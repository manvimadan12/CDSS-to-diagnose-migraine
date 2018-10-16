% Generate Table 3.5 in Chapter 3 of 
%
% J. M. Mendel and Dongrui Wu, Perceptual Computing: Aiding People in Making Subjective Judgments, 
% Wiley-IEEE Press, 2010.
%
% Dongrui WU (dongruiw@usc.edu), 4/19/2008

clc
clear all
close all

%% Read Data
[A,words] = xlsread('datacopy.xls');
words=words(1,1:2:end);
[row, col] = size(A);

%%  Compute the FOUs and centroids
for i=1:col/2
    L = A(1:row, 2*i-1);  %% Left end-points for interval data.
    R = A(1:row, 2*i);    %% Right end-points for interval data.
    [MFs(i,:), nums(i,:)] = IA(L,R); %% Map into an IT2 FS
    Cs(i)=centroidIT2(MFs(i,:)); %% Compute the centroid
end

%% Sort the MFs in ascending order according to the centers of centroids
[Cs,index]=sort(Cs);  % Sort the centers of the centroids
MFs=MFs(index,:);
words1=words(index); % Reorder the names of words
nums=nums(index,:)

