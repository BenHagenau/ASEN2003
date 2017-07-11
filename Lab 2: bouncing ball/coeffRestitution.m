%Author: Benjamin Hagenau
%Created: 1/2/17

function [] = coeffRestitution()

%This script is made for ASEN 2003 Lab 2: Bouncing Balls. It will determine
%the coefficient of restitution using three different methods. 

%METHOD 1: height of bounces
e1 = @(h,h0,n) (h/h0)^(1/(2*n));

%METHOD 2: time of two adjascent bounces
e2 = @(t,t0) (t/t0);

%METHOD 3: time to stop bouncing
e3 = @(t,h0) (t - sqrt((2*h0)/9.807)/(t + sqrt(((2*h0)/9.807)));
