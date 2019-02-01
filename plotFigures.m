% An example to illustrate the Interval Approach
% Dongrui WU, 4/19/2008

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
    MFs(i,:) = IA(L,R); %% Map into an IT2 FS
    Cs(i)=centroidIT2(MFs(i,:)); %% Compute the centroid
end

%% Sort the MFs in ascending order according to the centers of centroids
[Cs,index]=sort(Cs);  % Sort the centers of the centroids
MFs=MFs(index,:);
words1=words(index); % Reorder the names of words

%% Plot the ordered interval type-2 word models
figure
set(gcf,'DefaulttextFontName','times new roman');
set(gcf,'DefaultaxesFontName','times new roman');
set(gcf,'DefaulttextFontAngle','italic');
for i=1:32
    subplot(8,6,2*floor((i-1)/4)+i);
    plotIT2(MFs(i,:));
    title(words1(i),'fontsize',9);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    axis([0 10 0 1]);
end
saveas(gcf,'Fig3-18.eps');

%%  Compute the FOUs and centroids, specifying Very Small to be a left
%%  shoulder
for i=1:col/2
    L = A(1:row, 2*i-1);  %% Left end-points for interval data.
    R = A(1:row, 2*i);    %% Right end-points for interval data.
    if i==11
        MFs(i,:) = IA(L,R); %% Specify Very Small to be a left-shoulder
    else
        MFs(i,:) = IA(L,R); %% Map into an IT2 FS
    end
    Cs(i)=centroidIT2(MFs(i,:)); %% Compute the centroid
end

%% Sort the MFs in ascending order according to the centers of centroids
[Cs,index]=sort(Cs);  % Sort the centers of the centroids
MFs=MFs(index,:);
words2=words(index); % Reorder the names of words

%% Plot the ordered interval type-2 word models
figure
set(gcf,'DefaulttextFontName','times new roman');
set(gcf,'DefaultaxesFontName','times new roman');
set(gcf,'DefaulttextFontAngle','italic');
for i=1:32
    subplot(8,6,2*floor((i-1)/4)+i);
    plotIT2(MFs(i,:));
    title(words2(i),'fontsize',9);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    axis([0 10 0 1]);
end

% Plot Very Small
figure
set(gcf,'DefaulttextFontName','times new roman');
set(gcf,'DefaultaxesFontName','times new roman');
set(gcf,'DefaulttextFontAngle','italic');
subplot(8,6,1);
plotIT2(MFs(5,:));
title(words2(5),'fontsize',10);
set(gca,'YTick',[]);
set(gca,'XTick',[]);
axis([0 10 0 1]);
saveas(gcf,'Fig3-19.eps');

%% Plot sub-vocabularies
sv=[1 8 14 23 29; 4 10 16 26 32; 3 11 16 24 30];
index='abc';
for i=1:3
    figure
    set(gcf,'DefaulttextFontName','times new roman');
    set(gcf,'DefaultaxesFontName','times new roman');
    set(gcf,'DefaulttextFontAngle','italic');
    for j=1:5
        subplot(8,5,j);
        plotIT2(MFs(sv(i,j),:));
        title(words2(sv(i,j)),'fontsize',10);
        set(gca,'YTick',[]);
        set(gca,'XTick',[]);
        axis([0 10 0 1]);
    end
    saveas(gcf,['Fig3-20' index(i) '.eps']);
end
disp(Cs);

%Prediction score for Migraine Diagnosis without Aura
disp('Are your Headaches Migraines?');
%for i=1:5
    c1(i)=calusrcentroid(words,Cs);
%end
disp(c1);
disp('**********');


%if (c1<4) 
 %   disp('Your Headaches are Migraines. Follow LIfestyle and trigger management along with medication');
%elseif (c1>4)
 %   disp('Traditional Headaches');
%end

disp(c1);