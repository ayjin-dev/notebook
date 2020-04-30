## 多进程Pool的使用

```
from multiprocessing import Pool
def run(name,link):
    headers = {"User-Agent": ua.random}
    response=requests.get(link,headers=headers).text
    page=etree.HTML(response)
    os.mkdir('./mmpic/' +name)
    # 获得所有图片的链接
    img_srcs = page.xpath('//div[@id="content-innerText"]//img/@src')
    # 保存图片'./mmpic/绅士好图/'
    for i in range(0, len(img_srcs)):
        response = requests.get(img_srcs[i], headers=headers)
        img = response.content
        with open('./mmpic/' + name + '/' + str(i) + '.jpg', 'wb') as f:
            f.write(img)
if __name__ == '__main__':
    imglist=get_imglist()
    pool=Pool(processes=128)
    for i in range(0,len(imglist)):
        pool.apply_async(run,(imglist[i]['name'],imglist[i]['link'],))
    print('start')
    pool.close()
    pool.join()
    print('stop')
```

