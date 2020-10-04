%% Initialization
clear ; close all; clc
X=csvread('gdp.csv');

%% =================
% Settings for running K-Means
K = 3;
max_iters = 15;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = kMeans(X, initial_centroids, max_iters);

