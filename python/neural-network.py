#!/usr/bin/env python3

import numpy as np

arr = np.array
tanh = np.tanh

# softmax([x1, ..., xn]) = [e^x1, ..., e^xn] / (e^x1 + ... + e^xn)
def softmax(x):
    exp = np.exp(x-x.max()) # 分子分母同除一个常数, 防止指数爆炸
    return exp / exp.sum()

activate = [tanh, softmax]
dimension = [28**2, 10]
bound = np.sqrt(6/(dimension[0] + dimension[1]))
distribution = [
    {'b': (0,0)}, # 第 0 层, b 在 [0,0] 上均匀分布 (退化分布)
    {'b': (0,0), 'w': (-bound, bound)}, # 第 1 层
]

def init(layer, key):
    lo, hi = distribution[layer][key]
    if key == 'b':
        dim = (dimension[layer],)
    elif key == 'w':
        dim = (dimension[layer-1], dimension[layer])
    return np.random.rand(*dim) * (hi-lo) + lo

b0 = init(0, 'b')
b1 = init(1, 'b')
w1 = init(1, 'w')

def predict(img):
    l0 = activate[0](img + b0)
    l1 = activate[1](np.dot(l0, w1) + b1)
    return l1.argmax()

def plot(img):
    import matplotlib.pyplot as plt
    img = np.reshape(img, (28, 28))
    plt.imshow(img, cmap='gray')
    plt.show()

img = np.random.rand(dimension[0])
plot(img)
print(predict(img))
