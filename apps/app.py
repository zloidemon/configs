from abc import ABCMeta, abstractmethod, abstractclassmethod, abstractproperty


class AbstractApp(metaclass=ABCMeta):
    @abstractproperty
    def config():
        pass

    @abstractmethod
    def generate():
        pass

    @abstractclassmethod
    def render():
        pass
