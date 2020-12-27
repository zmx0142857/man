# numpy

> numpy 是著名的线性代数函数库, 提供快速的矩阵运算

## import

    >>> import numpy as np

## array

`array` 是 `ndarray` 的别名

    >>> a = np.array([[1, 2, 3], [4, 5, 6]])
    >>> a
    array([[1, 2, 3],
           [4, 5, 6]])
    >>> a.dtype
    dtype('int64')
    >>> a.ndim
    2
    >>> a.shape
    (2, 3)
    >>> a.size
    6
    >>> a.T
    array([[1, 4],
           [2, 5],
           [3, 6]])
    >>> a.sum(axis=0) # sum of each column
    array([5, 7, 9])
    >>> a.min(axis=1) # min of each row
    array([1, 4])
    >>> a.cumsum(axis=1) # cumulative sum along each row
    array([[ 1,  3,  6],
           [ 4,  9, 15]])

## matrix product

    >>> b = np.array([[1, 0], [0, 1]])
    >>> b @ a
    array([[1, 2, 3],
           [4, 5, 6]])
    >>> b.dot(a)
    array([[1, 2, 3],
           [4, 5, 6]])
    >>> a @ b
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: matmul: Input operand 1 has a mismatch in its core dimension 0, with gufunc signature (n?,k),(k,m?)->(n?,m?) (size 2 is different from 3)
    >>> a.dot(b)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ValueError: shapes (2,3) and (2,2) not aligned: 3 (dim 1) != 2 (dim 0)

初始化

    >>> np.zeros((3,4))
    >>> np.ones((2,3,4))
    >>> np.arange(6).reshape(2,3)
    array([[0, 1, 2],
           [3, 4, 5]])
    >>> np.linspace(0,2,9).reshape(3,3)
    array([[0.  , 0.25, 0.5 ],
           [0.75, 1.  , 1.25],
           [1.5 , 1.75, 2.  ]])
    >>> np.random.random((2,3))

## ufunc

    sin, cos, exp, log...
