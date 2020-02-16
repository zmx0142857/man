#!/usr/bin/env python3

import numpy as np
import matplotlib.pyplot as plt

def get_degree(c, depth):
    z = c
    for i in range(depth):
        if abs(z) > 2: break
        z = z**2 + c
    return i

def mandelbrot_plot(p, d):
    x0, x1, y0, y1 = p[0] - d, p[0] + d, p[1] - d, p[1] + d
    y, x = np.ogrid[y0:y1:800j, x0:x1:800j]
    c = x + y * 1j
    mandelbrot_set = np.frompyfunc(get_degree, 2, 1)(c, 300).astype(np.float)
    plt.imshow(mandelbrot_set, extent=[x0, x1, y0, y1])
    plt.gca().axis('off')
    plt.show()

if __name__ == '__main__':
    plt.figure(figsize=(10, 10))
    mandelbrot_plot((-0.5, 0), 1.5)
