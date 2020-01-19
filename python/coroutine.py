def consumer():
    r = ''
    while True:
        n = yield r # 产生 r, 切换到 produce(), 回来后取得返回值
        if not n:
            return
        print('consumer: consuming %s...' % n)
        r = 'ok'

def produce(c):
    c.send(None) # 启动生成器
    for n in range(1,6):
        print('producer: producing %s...' % n)
        r = c.send(n) # 切换到 consumer(), 回来后取得返回值
        print('producer: consumer returns %s' % r)
    c.close() # 关闭 consumer()

c = consumer()
produce(c)
