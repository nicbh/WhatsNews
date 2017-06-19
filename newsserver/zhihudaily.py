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
urlNews = 'http://news-at.zhihu.com/api/4/news/latest'
urlPast = 'http://news-at.zhihu.com/api/4/news/before/'  # http://news-at.zhihu.com/api/4/news/before/20161119 (next date)
urlInfo = 'http://news-at.zhihu.com/api/4/news/'  # http://news-at.zhihu.com/api/4/news/2139812 (ID)

years = [2017]
months = [5]  # , 4, 3, 2, 1]
days = [31, 30, 29, 28]  # , 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
for year in years:
    for month in months:
        for day in days:
            url = urlPast + str(year) + '0' + str(month) + str(day)
            r = requests.get(url=url, headers=headers)
            text = r.text
            text = json.loads(r.text, encoding='utf-8')
            date = text['date']
            items = []
            for stories in text['stories']:
                id = str(stories['id'])
                title = stories['title']
                # images = stories['images']
                itemUrl = urlInfo + id
                r = requests.get(url=itemUrl, headers=headers)
                itemText = json.loads(r.text, encoding='utf-8')
                images = [itemText['image']]
                if title != itemText['title'] or id != str(itemText['id']):
                    continue
                content = html.unescape(itemText['body'])
                url = itemText['share_url']
                newItem = itemInfo(name='知乎日报', date=date, id=id, title=title, images=images, url=url,
                                   content=content)
                items.append(newItem)
            for item in items:
                with open(item.date + '_' + item.id + 'zh.txt', 'w', encoding='utf-8') as f:
                    f.write(json.dumps(item, default=itemInfo.jsonDecode, ensure_ascii=False))
