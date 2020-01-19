import asyncio, threading

async def hello():
    print('Hello world! %s' % threading.currentThread())
    r = await asyncio.sleep(1)
    print('Hello again! %s' % threading.currentThread())

loop = asyncio.get_event_loop() # 获取 EventLoop
tasks = [hello(), hello(), hello()] # 封装多个任务 (coroutine)
loop.run_until_complete(asyncio.wait(tasks)) # 并发执行它们
loop.close()
# 从打印的线程号可以看出, 协程是由同一个线程来执行的, 不需要切换线程
