#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from turtle import *

def rectangle():
    pensize(4)          # brush width
    forward(200)        # go forward 200 units
    right(90)           # turn right 90 degrees

    pencolor('red')     # brush color
    forward(100)
    right(90)

    pencolor('green')
    forward(200)
    right(90)

    pencolor('blue')
    forward(100)
    right(90)


def stars():
    def star(x, y):
        penup()
        goto(x, y)
        pendown()
        setheading(0)       # heading to east
        for i in range(5):
            forward(40)
            right(144)
    for x in range(-100, 101, 50):
        star(x, 0)

r, g, b = 0, 0, 0
def kidney():
    max_level = 9
    rate = 0.75
    def recur_kidney(level, length, size):
        global r, g, b
        r += 1
        g += 2
        b += 3
        pencolor(r % 200, g % 200, b % 200)
        pensize(size)

        left(45)
        forward(length)

        if level < max_level:
            recur_kidney(level+1, length*rate, size*rate)

        backward(length)
        right(90)
        forward(length)

        if level < max_level:
            recur_kidney(level+1, length*rate, size*rate)

        backward(length)
        left(45)
        pensize(size)

    length = 120
    size = 14

    colormode(255) # color mode rgb
    pencolor(0, 0, 0)
    pensize(size)

    penup()
    backward(length)
    pendown()
    forward(length)
    speed("fastest")

    recur_kidney(0, length*0.75, size*0.75)

kidney()

# enter message loop, if not, the window will be closed immediately
done()
