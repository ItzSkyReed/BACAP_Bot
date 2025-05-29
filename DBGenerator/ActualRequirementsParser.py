from abc import ABC, abstractmethod

import requests
from openpyxl import load_workbook

from common import SingletonMeta
from DBGenerator.constants import ED_GH_PAGES_URL, BAC_DOC_SHEET_PATH, RIDDLE_ME_THIS_ACTUAL_REQ


class AbstractActualRequirementsParser(ABC, metaclass=SingletonMeta):

    @abstractmethod
    def get(self, *args, **kwargs) -> str | None:
        ...


class EDActualRequirementsParser(AbstractActualRequirementsParser):
    def __init__(self):
        self._get_last_version()
        self._get_ed_data()

    def _get_last_version(self):
        response = requests.get(f"{ED_GH_PAGES_URL}/ver/default_data.json")
        response.raise_for_status()

        data = response.json()
        self._last_version = data['defaultVersion']

    def _get_ed_data(self):
        response = requests.get(f"{ED_GH_PAGES_URL}/ver/{self._last_version}/data.json")
        response.raise_for_status()
        data = response.json()

        self._actual_requirements = dict()

        for item in data:
            self._actual_requirements[item["title"]] = item["req"] if item["req"] else None

    def get(self, title: str) -> str | None:
        """
        :param title: title of the advancement
        :return: actual requirements of the advancement if exists, else None
        """
        if title == "Riddle Me That":
            return None
        return self._actual_requirements.get(title, None)


class BACAPActualRequirementsParser(AbstractActualRequirementsParser):
    SEE_BELOW_TEXTS = ("See requirement notes below", "See requirement notes for a list of which biomes are considered 'rare'", "See requirement notes below for some exceptions")

    def __init__(self):
        self._doc_sheet = load_workbook(filename=BAC_DOC_SHEET_PATH)

    def get(self, datapack_name: str, tab_display: str, title: str) -> str | None:
        if "terralith" in datapack_name.lower():
            tab_display = "Terralith"
            start_row = 3
        else:
            if tab_display == "The End":
                tab_display = "End"
            start_row = 1
        sheet = self._doc_sheet[tab_display]
        row = self._find_title_row(sheet, title, start_row)
        if row is None:
            return None

        actual_req_value = sheet[f"D{row}"].value
        if isinstance(actual_req_value, str):
            actual_req_value = actual_req_value.strip()

        if not actual_req_value:
            return None

        if any(actual_req_value in see_below_text for see_below_text in self.SEE_BELOW_TEXTS):
            return self._find_below_requirement(sheet, title, start_row=row)

        return actual_req_value

    @staticmethod
    def _find_title_row(sheet, title: str, start_row: int) -> int | None:
        row = start_row
        while True:
            cell_value = sheet[f"A{row}"].value
            if isinstance(cell_value, str):
                cell_value = cell_value.strip()
            if cell_value == title:
                return row
            if cell_value is None:
                return None
            row += 1

    @classmethod
    def _find_below_requirement(cls, sheet, title: str, start_row: int) -> str | None:
        row = cls._skip_until_none(sheet, start_row)
        if row is None:
            return None

        row = cls._find_text_in_column(sheet, "Full requirement notes:", col="A", start_row=row + 1)
        if row is None:
            return None

        return cls._find_title_in_notes(sheet, title, start_row=row + 1)

    @staticmethod
    def _skip_until_none(sheet, row: int) -> int | None:
        while sheet[f"A{row}"].value is not None:
            row += 1
        return row

    @staticmethod
    def _find_text_in_column(sheet, text: str, col: str, start_row: int) -> int | None:
        row = start_row
        while True:
            value = sheet[f"{col}{row}"].value
            if isinstance(value, str):
                value = value.strip()
            if value == text:
                return row
            if value is None:
                return None
            row += 1

    @staticmethod
    def _find_title_in_notes(sheet, title: str, start_row: int) -> str | None:
        row = start_row
        while True:
            value = sheet[f"A{row}"].value
            if isinstance(value, str):
                value = value.strip()
            if value is None:
                return None

            lines = value.split("\n")
            if title in lines:
                return sheet[f"B{row}"].value or None
            elif value == title:
                return sheet[f"B{row}"].value or None

            row += 1
