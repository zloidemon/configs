import io
from .app import AbstractApp


class AppURXVT(AbstractApp):
    def __init__(self, config, file):
        self.__config = config
        self.prefix = "URxvt"
        self.file = file

    @property
    def config(self):
        return self.__config[self.prefix.lower()]

    def generate(self):
        _generic_config = self.__config.get("generic", None)

        for k, v in self.config.items():
            if isinstance(v, bool):
                v = str(v).lower()
            self.file.write("%s%s: %s\n" % (self.prefix, k, v))

        if not _generic_config:
            return

        for k, v in _generic_config["colors"].items():
            if k in ["background", "foreground"]:
                self.file.write("%s*%s: %s\n" % (self.prefix, k, v))
            elif k == "url":
                self.file.write("%s.colorUL: %s\n" % (self.prefix, v))
        font_name = _generic_config["font"]["name"]
        font_size = _generic_config["font"]["size"]

        for t in [
                "%s*font: xft:%s:size=%s:antialias=true:hinting=true\n",
                "%s*boldFont: xft:%s:size=%s:weight=bold\n",
            ]:
            self.file.write(t % (self.prefix, font_name, font_size))
        self.file.write(
            "%s.urlLauncher: %s\n" % (
                self.prefix, _generic_config["browser"]["application"]
            )
        )

    @classmethod
    def render(cls, config, file):
        app = cls(config, file)
        app.generate()
