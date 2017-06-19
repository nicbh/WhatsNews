import requests, json
from item import itemInfo
import html

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',
    'Accept-Charset': 'utf-8',
    'Accept': 'text/html,application/xhtml+xml,application/xml,application/json;q=0.9,*/*;q=0.8',
    'Accept-Language': 'zh-CN,zh;q=0.8',
    'Accept-Encoding': 'gzip',
    'Connection': 'keep-alive',
    # 'host': host,
    'Referer': None
}

appkey = 'd4da805ad26879f4c8a96ae3bd4d1fc1'
urlNews = 'http://v.juhe.cn/toutiao/index?type=top&key=' + appkey

url = urlNews
r = requests.get(url=url, headers=headers)
text = r.text
text = json.loads(r.text, encoding='utf-8')
text = text['result']['data']

items = []
for stories in text:
    id = stories['uniquekey']
    title = stories['title']
    image_key = 'thumbnail_pic_s'
    images = [stories[image_key]]
    for i in range(2, 10):
        mkey = image_key + '%02d' % i
        if mkey in stories:
            images.append(stories[mkey])
        else:
            break
    url = stories['url']
    date = stories['date']
    name = stories['author_name']
    section = stories['category']
    newItem = itemInfo(name=name, date=date, id=id, title=title, images=images, url=url, section=section)
    items.append(newItem)
for item in items:
    with open(str(item.date.replace(' ', ',')) + '_' + str(item.id) + 'juhe.txt', 'w', encoding='utf-8') as f:
        f.write(json.dumps(item, default=itemInfo.jsonDecode, ensure_ascii=False))
print(text)
