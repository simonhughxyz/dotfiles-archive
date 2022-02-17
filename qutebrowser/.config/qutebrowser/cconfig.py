import os

class CConfig():
    
    def __init__(self, config):
        self.config = config
        self.dir = self.config.datadir.joinpath("cconfig")
        if not os.path.exists(self.dir):
            self.dir.mkdir(parents=True)

    def get(self, key):
        try:
            with open(self.dir.joinpath(key), 'r') as file:
                return file.readline().rstrip('\n')
        except FileNotFoundError:
            return ''

    def set(self, key, value):
        with open(self.dir.joinpath(key), 'w') as file:
            file.write(str(value))

    def get_bool(self, key):
        if self.get(key) == "True":
            return True
        else:
            return False

    @property
    def redirect(self):
        return self.get_bool('redirect')
    @redirect.setter
    def redirect(self, val):
        self.set('redirect', val)
