#!/usr/bin/env python

# Distance between points
import numpy as np
from scipy.spatial.distance import pdist, squareform
import matplotlib.pyplot as plt
import cv2, numpy as np, os
from scipy.misc import imread, imsave, imresize
import plotly.plotly as py
import plotly.graph_objs as go

def IndexOfMax(a):
	a = np.array([[1,2,3],[4,3,1]])
	Index = np.unravel_index(a.argmax(), a.shape)
	return Index;


img = (imread('lincoln.tif'))
print img.dtype, img.shape  # Prints "uint8 (400, 248, 3)
size=np.shape(img)
print size[1]
Length=np.prod(size)
print Length
z=np.zeros((1,Length)) # Create a empty matrix the same size as x
nums=range(size[1])


FirstIndex=IndexOfMax(img)
print FirstIndex
NextItem=FirstIndex+1;
while():
	

#plt.hist(img)
#plt.show()

#plt.plot(img,'x')
#plt.show()
