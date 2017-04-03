#!/usr/bin/env python
import numpy as np
from scipy.spatial.distance import pdist, squareform
from scipy.stats import threshold
import matplotlib.pyplot as plt
import cv2, numpy as np, os
from scipy.misc import imread, imsave, imresize
import plotly.plotly as py
import plotly.graph_objs as go
import math
import __future__
##############################################################
# Reading the image
img = (imread('fingerprint.tif'))
# histogram computation
bins,Hist = np.unique(img, return_counts=True)
Total=float(np.sum(bins))
Probability=(bins/Total)

# Declaration of the variables
Range=range(len(Hist))
wB=np.zeros(len(Hist))
wH=np.zeros(len(Hist))
muB=np.zeros(len(Hist))
muH=np.zeros(len(Hist))
sigma_B=np.zeros(len(Hist))

# Otsu algorithm
for ii in Range:
	wB[ii]=np.sum(Probability[0:ii])
	wH[ii]=np.sum(Probability[ii+1:])
	muB[ii]=sum(np.multiply(Probability[0:ii+1],Hist[0:ii+1]))/wB[ii]
	muH[ii]=sum(np.multiply(Probability[ii+1:],Hist[ii+1:]))/wH[ii]
	sigma_B[ii]=(muB[ii]*muH[ii]*(muB[ii]-muH[ii])**2)
	if wH[ii]==0:
		sigma_B[ii]=0;
	if wB[ii]==0:
		sigma_B[ii]=0;



imgThresholded=threshold(img,bins[np.argmax(sigma_B)])
plt.subplot(2,2,1)
plt.imshow(img)
plt.title("Original image")
plt.subplot(2,2,2)
plt.imshow(imgThresholded)
plt.title("Thresholded image")

plt.subplot(2,2,3)
Hist,bins=np.histogram(img)
plt.hist(np.histogram(img))
plt.title("Hist before thresholding")
plt.xlabel("Value")
plt.ylabel("Frequency")

plt.subplot(2,2,4)
Hist,bins=np.histogram(imgThresholded)
plt.hist(np.histogram(imgThresholded))
plt.title("Hist before thresholding")
plt.xlabel("Value")
plt.ylabel("Frequency")

plt.show()
