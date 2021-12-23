from .app import AbstractApp


class AppXTERM(AbstractApp):
    def __init__(self, config):
        self.__config = config
        self.prefix = "XTerm"

    @property
    def config(self):
        return self.__config[self.prefix.lower()]

    def generate(self):
        _generic_config = self.__config.get("generic", None)

        for k, v in self.config.items():
            if isinstance(v, bool):
                v = str(v).lower()
            print("%s%s: %s" % (self.prefix, k, v))

        if not _generic_config:
            return

        for k, v in _generic_config["colors"].items():
            if k in ["background", "foreground"]:
                print("%s*%s: %s" % (self.prefix, k, v))

        print("%s*faceName: %s" % (self.prefix, _generic_config["font"]["name"]))
        print("%s*faceSize: %s" % (self.prefix, _generic_config["font"]["size"]))

    @classmethod
    def render(cls, config):
        app = cls(config)

        return app.generate()
