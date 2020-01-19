from wsgiref.simple_server import make_server

def app(info, response):
    response('200 OK', [('Content-Type', 'text/html; charset=utf-8')])
    return [b'<h1>Hello web!</h1>']

httpd = make_server('', 8000, app)
print('Service started at localhost:8000...')
httpd.serve_forever()
