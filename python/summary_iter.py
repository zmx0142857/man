from chain import chain
summary = lambda s: chain(s).groupby().map(lambda t: str(len(t[1])) + str(t[0])).join('').value()
s = '1'
for i in range(10):
    print(s)
    s = summary(s)
