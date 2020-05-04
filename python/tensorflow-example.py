#!/usr/bin/env python3

#import os
#os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

import tensorflow as tf

#msg = tf.constant('hello')
#with tf.Session() as s:
    #print(s.run(msg).decode())

v1 = tf.constant([1, 2, 3, 4])
v2 = tf.constant([2, 1, 5, 3])
add = tf.add(v1, v2) # add = v1 + v2

s = tf.InteractiveSession()
print('\033[32m', add.eval(), '\033[0m', sep='')
s.close()
