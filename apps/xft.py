from .app import AbstractApp


class AppXFT(AbstractApp):
    def __init__(self, config):
        self.__config = config
        self.prefix = "Xft"

    @property
    def config(self):
        return self.__config[self.prefix.lower()]

    def generate(self):
        _generic_config = self.config.get("generic", None)

        for k, v in self.config.items():
            if isinstance(v, bool):
                v = str(v).lower()
            print("%s%s: %s" % (self.prefix, k, v))

        if not _generic_config:
            return

    @classmethod
    def render(cls, config):
        app = cls(config)

        return app.generate()
