#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt

def sierpinski(x, y):
    v = 2/np.sqrt(3) * y
    u = x - 0.5 * v
    return sdf(u, v, 0)

def sdf(u, v, depth):
    if depth == 10:
        return 0
    if u < 0 or v < 0 or u + v > 1:
        return 1
    if u > 0.5:
        return sdf(2*u-1, 2*v, depth+1)
    if v > 0.5:
        return sdf(2*u, 2*v-1, depth+1)
    if u + v < 0.5:
        return sdf(2*u, 2*v, depth+1)
    return 1

plt.figure(figsize=(10, 10))
x0, x1, y0, y1 = 0, 1, 0, 1
y, x = np.ogrid[y0:y1:1000j, x0:x1:1000j]
img = np.frompyfunc(sierpinski, 2, 1)(x, y).astype(np.float)
plt.imshow(img, extent=[x0, x1, y0, y1])
plt.gca().axis('off')
plt.show()
