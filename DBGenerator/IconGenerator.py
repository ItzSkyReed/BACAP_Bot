import base64
from io import BytesIO
from pathlib import Path
import re
import BACAP_Parser
import requests
from BACAP_Parser import cut_namespace
from PIL import Image, ImageFilter
from constants import URL_PATTERN
from DBGenerator.constants import ASSETS_FOLDER, CACHE_FOLDER

DEFAULT_ICON_SIZE = (128, 128)
DEFAULT_ITEM_IN_FRAME_SIZE = (80, 80)
DEFAULT_HEAD_IN_FRAME_SIZE = (72, 72)


ENCHANTED_GLINT = Image.open(ASSETS_FOLDER / "enchanted_glint.png").convert("RGBA")
ENCHANTED_GLINT = ENCHANTED_GLINT.filter(ImageFilter.GaussianBlur(radius=5))

FRAME_IMAGES_MAP: dict[str, Image.Image] = {}

def __load_and_resize_frame(filename: str, size: tuple[int, int] = DEFAULT_ICON_SIZE) -> Image.Image:
    path = ASSETS_FOLDER / "frames" / filename
    return Image.open(path).resize(size, resample=Image.NEAREST).convert('RGBA')

FRAME_IMAGES_MAP["task"] = __load_and_resize_frame("task_frame.png")
FRAME_IMAGES_MAP["goal"] = __load_and_resize_frame("goal_frame.png")
FRAME_IMAGES_MAP["challenge"] = __load_and_resize_frame("challenge_frame.png")

def _fetch_item_image(item_id: str) -> bytes:
    return (ASSETS_FOLDER / "items" / f"{item_id}.png").read_bytes()

def _fetch_player_head_image(head_hash_value: str, size: int = DEFAULT_ICON_SIZE[0]) -> bytes:
    response = requests.get(fr"https://mc-heads.net/head/{head_hash_value}/{size}.png")
    response.raise_for_status()
    return response.content

def _add_enchantment_glint_on_image(image: Image.Image, opacity: float = 0.22, light_factor: float = 1.65) -> Image.Image:
    scaled_overlay = ENCHANTED_GLINT.resize(image.size, resample=Image.HAMMING)

    bg_data = image.getdata()
    ov_data = scaled_overlay.getdata()

    new_data = []

    for bg_pixel, ov_pixel in zip(bg_data, ov_data):
        br, bg, bb, ba = bg_pixel
        or_, og, ob, oa = ov_pixel

        if ba == 0 or oa == 0:
            new_data.append(bg_pixel)
        else:
            or_ = min(int(or_ * light_factor), 255)
            og = min(int(og * light_factor), 255)
            ob = min(int(ob * light_factor), 255)

            new_pixel = (
                or_,
                og,
                ob,
                int(oa * opacity)
            )

            blended = Image.alpha_composite(
                Image.new("RGBA", (1, 1), bg_pixel),
                Image.new("RGBA", (1, 1), new_pixel)
            ).getpixel((0, 0))

            new_data.append(blended)

    result = Image.new("RGBA", image.size)
    result.putdata(new_data)
    return result


def _preprocess_item_image(image_data: bytes, size: tuple[int, int], has_glint: bool = False) -> bytes:
    img = Image.open(BytesIO(image_data)).convert("RGBA")
    img = img.resize(size, resample=Image.HAMMING)
    if has_glint:
        img = _add_enchantment_glint_on_image(img)
    output = BytesIO()
    img.save(output, format="WEBP", lossless=True)
    return output.getvalue()

def _get_head_hash_value(item_components: dict):
    profile = item_components.get("minecraft:profile") or item_components.get("profile")
    if not profile:
        return None

    texture_url: str | None = re.search(URL_PATTERN, base64.b64decode(profile["properties"][0]["value"]).decode())[0]
    return texture_url.rsplit('/', 1)[-1]

def _get_item_cache_path(item_id: str, size: tuple[int, int]) -> Path:
    return CACHE_FOLDER / f"items_{size[0]}_{size[1]}" / f"{item_id}.webp"

def _get_item_frame_cache_path(item_id: str, frame: str, size: tuple[int, int]) -> Path:
    return CACHE_FOLDER / f"frames_{size[0]}_{size[1]}" / f"{frame}_{item_id}.webp"

def _get_head_frame_cache_path(head_hash: str, frame: str, size: tuple[int, int]) -> Path:
    return CACHE_FOLDER / f"frames_{size[0]}_{size[1]}" / f"{frame}_{head_hash}.webp"

def _get_head_cache_path(head_hash_value: str, size: tuple[int, int]) -> Path:
    return CACHE_FOLDER / f"heads_{size[0]}_{size[1]}" / f"{head_hash_value}.webp"

def _compose_item_on_frame(item_image: Image.Image, frame_image: Image.Image) -> Image.Image:
    composed = frame_image.copy()
    offset = (
        (frame_image.width - item_image.width) // 2,
        (frame_image.height - item_image.height) // 2
    )
    composed.alpha_composite(item_image, dest=offset)
    return composed

def _encode_image_to_webp(image: Image.Image) -> bytes:
    output = BytesIO()
    image.save(output, format="WEBP", lossless=True)
    return output.getvalue()

def _get_item_image(item: BACAP_Parser.Item, size: tuple[int, int] = DEFAULT_ICON_SIZE) -> bytes:
    item_path = _get_item_cache_path(cut_namespace(item.id), size)
    if item_path.exists():
        return item_path.read_bytes()

    image_data = _fetch_item_image(cut_namespace(item.id))
    processed = _preprocess_item_image(image_data, size, cut_namespace(item.id) != "player_head" and item.has_enchantment_glint)
    item_path.parent.mkdir(parents=True, exist_ok=True)
    item_path.write_bytes(processed)
    return processed

def _get_head_image(head_hash_value: str, size: tuple[int,int] = DEFAULT_ICON_SIZE) -> bytes:

    head_path = _get_head_cache_path(head_hash_value, size)
    if head_path.exists():
        return head_path.read_bytes()

    head_data = _fetch_player_head_image(head_hash_value, size[0]) # We made it sync because mc-heads is "FORBIDDEN 403"
    head_img = Image.open(BytesIO(head_data)).convert("RGBA")

    output = BytesIO()
    head_img.save(output, format="WEBP", lossless=True)

    head_path.parent.mkdir(parents=True, exist_ok=True)
    head_path.write_bytes(output.getvalue())
    return output.getvalue()


def _get_item_on_frame_image(item: BACAP_Parser.Item, frame: str, size: tuple[int, int] = DEFAULT_ICON_SIZE) -> bytes:
    cache_path = _get_item_frame_cache_path(cut_namespace(item.id), frame, size)
    if cache_path.exists():
        return cache_path.read_bytes()

    item_data = _get_item_image(item, DEFAULT_ITEM_IN_FRAME_SIZE)
    item_img = Image.open(BytesIO(item_data)).convert("RGBA")
    frame_img = FRAME_IMAGES_MAP[frame]

    composed_img = _compose_item_on_frame(item_img, frame_img)
    result_bytes = _encode_image_to_webp(composed_img)

    cache_path.parent.mkdir(parents=True, exist_ok=True)
    cache_path.write_bytes(result_bytes)

    return result_bytes

def _get_head_on_frame_image(item: BACAP_Parser.Item, frame: str, size: tuple[int, int] = DEFAULT_ICON_SIZE) -> bytes:
    hash_value = _get_head_hash_value(item.components)
    if hash_value is None:
        return _get_item_on_frame_image(item, frame, size)

    cache_path = _get_head_frame_cache_path(hash_value, frame, size)
    if cache_path.exists():
        return cache_path.read_bytes()

    head_data = _get_head_image(hash_value, DEFAULT_HEAD_IN_FRAME_SIZE)
    item_img = Image.open(BytesIO(head_data)).convert("RGBA")
    frame_img = FRAME_IMAGES_MAP[frame]

    composed_img = _compose_item_on_frame(item_img, frame_img)
    result_bytes = _encode_image_to_webp(composed_img)

    cache_path.parent.mkdir(parents=True, exist_ok=True)
    cache_path.write_bytes(result_bytes)

    return result_bytes

def get_trophy_icon(item: BACAP_Parser.TrophyItem):
    if cut_namespace(item.id) == "player_head":
        hash_value = _get_head_hash_value(item.components)

        if hash_value is None:
            return _get_item_image(item)

        return _get_head_image(hash_value)

    return _get_item_image(item)


def get_adv_icon(item: BACAP_Parser.Item, frame: str):
    if cut_namespace(item.id) == "player_head":
        return _get_head_on_frame_image(item, frame)

    return _get_item_on_frame_image(item, frame)
