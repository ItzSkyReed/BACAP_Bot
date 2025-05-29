from abc import ABC, abstractmethod

import requests

from common import SingletonMeta
from DBGenerator.constants import ED_GH_PATH

class AbstractActualRequirementsParser(ABC, metaclass=SingletonMeta):

    @abstractmethod
    def get(self, identifier: str) -> str | None:
        ...


class EDActualRequirementsParser(AbstractActualRequirementsParser):
    def __init__(self):
        self.__get_last_version()
        self.__get_ed_data()

    def __get_last_version(self):
        response = requests.get(f"{ED_GH_PATH}/ver/default_data.json")
        response.raise_for_status()

        data = response.json()
        self._last_version = data['defaultVersion']

    def __get_ed_data(self):
        response = requests.get(f"{ED_GH_PATH}/ver/{self._last_version}/data.json")
        response.raise_for_status()
        data = response.json()

        self._actual_requirements = dict()

        for item in data:
            self._actual_requirements[item["title"]] = item["req"] if item["req"] else None

    def get(self, identifier: str) -> str | None:
        """
        :param identifier: title of the advancement
        :return: actual requirements of the advancement if exists, else None
        """
        return self._actual_requirements.get(identifier, None)

class BACAPActualRequirementsParser(AbstractActualRequirementsParser):
    def __init__(self):
        pass

