from pathlib import Path
import json


class Merger:
    def __init__(self):
        self.files = None
        self.result = {}

    def __read_configs(self):
        p = Path('configs')
        self.files = list(p.glob('**/*.json'))

    def __get_dict(self, filename):
        if filename.name.count('.') != 1:
            return

        section, _ = filename.name.split('.')

        if self.result.get(section, None):
            return
        else:
            text = filename.open().read()
            parsed = json.loads(text)
            self.result[section] = parsed
        
    def config(self):
        if not self.files:
            self.__read_configs()

        for filename in self.files:
            if filename.exists() and filename.is_file():
                self.__get_dict(filename)
        return self.result

