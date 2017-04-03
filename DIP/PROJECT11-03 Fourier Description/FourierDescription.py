#!/usr/bin/env python

# Distance between points
import numpy as np
from scipy.spatial.distance import pdist, squareform
import matplotlib.pyplot as plt
import cv2, numpy as np, os
from scipy.misc import imread, imsave, imresize

img = (imread('lincoln.tif'))
print img.dtype, img.shape  # Prints "uint8 (400, 248, 3)
size=np.shape(img)
print size[1]
Length=np.prod(size)
print Length
z=np.zeros((1,Length)) # Create a empty matrix the same size as x
nums=range(size[1])
print nums
#for i in range(size[1]):
#	for j in range(size[2]):
#		x=x+1

