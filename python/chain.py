#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import functools
import itertools

# 二重 map/list
# L = [[1,2],[3,4]]
# res = map(lambda x: map(str, x), L)
# list(list(x) for x in res)

def map_into(func, xs, depth):
    if depth == 0:
        return func(xs)
    return (map_into(func, x, depth-1) for x in xs)

def rec_along(func, xs, depth):
    if depth == 0:
        return xs
    return func(rec_along(func, x, depth-1) for x in xs)

def rec_args(func, xs, args, depth):
    if depth == 0:
        return xs
    return func(args[-depth], (rec_args(func, x, args, depth-1) for x in xs))

class chain(object):
    '''
    Doctest:
    >>> chain([1,2,3]).map(lambda x: x**2).to_list()
    [1, 4, 9]
    >>> chain([[1,2],[3,4]]).str(2).join('\\n',' ').value()
    '1 2\\n3 4'
    >>> chain(['1,2', '3,4']).split(',').to_list()
    [['1', '2'], ['3', '4']]
    >>> chain(['1 2','3 4']).split().float(2).to_list(2)
    [[1.0, 2.0], [3.0, 4.0]]
    '''
    def __init__(self, val):
        self.val = val

    # output functions
    def value(self):
        return self.val
    def to_list(self, depth=1):
        return rec_along(list, self.val, depth)
    def to_tuple(self, depth=1):
        return rec_along(tuple, self.val, depth)
    def to_set(self, depth=1):
        return rec_along(set, self.val, depth)

    # pipe functions
    def pipe(self, func):
        return chain(func(self.val))

    # const functions
    def print(self):
        print(self.val)
        return self

    # map functions
    def map(self, func, depth=1):
        return chain(map_into(func, self.val, depth))
    def filter(self, func):
        return chain(filter(func, self.val))
    where = filter
    def zip(self):
        return chain(zip(*self.val))
    def list(self, depth=1):
        return chain(self.to_list(depth))
    def tuple(self, depth=1):
        return chain(self.to_tuple(depth))
    def slice(self, *args):
        return chain(self.val[slice(*args)])
    def groupby(self, func=None): # 按 func 的结果划分等价类
        return chain(
            map(
                lambda it:(it[0],list(it[1])),
                itertools.groupby(self.val,func)
            )
        )
    def descartes(self, tag): # 笛卡尔积
        return chain(itertools.product(self.val, tag))
    x = descartes
    # map shorthands
    def str(self, depth=1):
        return self.map(str, depth)
    def int(self, depth=1):
        return self.map(int, depth)
    def float(self, depth=1):
        return self.map(float, depth)
    def split(self, delim=None, depth=1):
        return self.map(lambda x: str.split(x, delim), depth)

    # reduce functions
    def reduce(self, func, init=None):
        if init == None:
            return chain(functools.reduce(func, self.val))
        return chain(reduce(func, self.val, init))
    def join(self, *args):
        return chain(rec_args(str.join, self.val, args, len(args)))
    def sum(self, init):
        return chain(sum(self.val, init))
    def flat(self): # 将多个迭代对象连接为一个
        return chain(itertools.chain.from_iterable(self.val))
    def all(self, func):
        return all(func, self.val)
    def any(self, func):
        return any(func, self.val)
    # reduce shorthands
    def prod(self):
        return self.reduce(lambda x, y: x * y, 1)

    def __iter__(self):
        return self.val.__iter__()

    def __str__(self):
        return self.val.__str__()

    def __repr__(self):
        return 'chain<%s>' % self.val.__repr__()

if __name__ == '__main__':
    import doctest
    doctest.testmod()
