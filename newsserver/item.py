from json import JSONEncoder


class itemInfo:
    date = ''
    images = []
    name = ''
    id = ''
    title = ''
    content = ''
    section = ''
    share_url = ''

    def __init__(self, date, name, id, title, content='', images=[], section='', url=''):
        self.date = date
        self.name = name
        self.id = id
        self.images = images
        self.title = title
        self.content = content
        self.section = section
        self.share_url = url

    @classmethod
    def jsonDecode(cls, o):
        return o.__dict__

    @classmethod
    def jsonEncode(cls, jsonobject):
        return cls(jsonobject['date'], jsonobject['name'], jsonobject['id'], jsonobject['title'], jsonobject['content'],
                   jsonobject['images'], jsonobject['section'], jsonobject['url'])

    pass


class itemEncoder(JSONEncoder):
    def default(self, o):
        return o.__dict__
