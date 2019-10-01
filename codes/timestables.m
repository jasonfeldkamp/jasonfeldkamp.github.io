% Created by Jason Feldkamp

clc
clear all
close all

n = 1000; % Number of points
t = 67; % Times table number

% Populate point arrays
x = zeros(1,2);
y = zeros(1,2);
k = 1;

for theta = 0:2*pi/n:2*pi-2*pi/n
    x(k) = cos(theta);
    y(k) = sin(theta);
    k = k+1;
end

figure(1)
plot(x,y,'bo','markersize',2)
axis equal
title([num2str(t)])

lines = gobjects(1,2);

for j = 2:n
    if mod(t*(j-1)+1,n) ~= 0
        lines(j) = line([x(j),x(mod(t*(j-1)+1,n))], [y(j),y(mod(t*(j-1)+1,n))]);
    else
        lines(j) = line([x(j),x(length(x))], [y(j),y(length(y))]);
    end
end