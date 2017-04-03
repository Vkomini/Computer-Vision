#!/usr/bin/env python
import numpy as np
from scipy.spatial.distance import pdist, squareform
import scipy.io as sio
from scipy.stats import threshold
import matplotlib.pyplot as plt
import cv2, numpy as np, os
from scipy.misc import imread, imsave, imresize
import plotly.plotly as py
import plotly.graph_objs as go
import math
import __future__

# Read an JPEG image into a numpy array
img = imread('nature.jpg')
print img.dtype, img.shape  # Prints "uint8 (400, 248, 3)
img_tinted = img * [1, 0.95, 0.9]

def Web_Safe_Colour(Image):
	

# Resize the tinted image to be 300 by 300 pixels.
img_tinted = imresize(img_tinted, (300, 300))

plt.imshow(img_tinted)
plt.show()
plt.imshow(img)
plt.show()
