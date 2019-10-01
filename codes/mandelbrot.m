% Created by Jason Feldkamp

clc
close all
clear all

pixel = 0;
x_data = zeros(1,2);
y_data = zeros(1,2);
iteration_data = zeros(1,2);
pixel_color = zeros(8,3);
pixel_size = 0.001;

for x0 = -2.5:pixel_size:1
    for y0 = -1:pixel_size:1
        pixel = pixel + 1;
        x = 0;
        y = 0;
        c = x0 + i*y0;
        iteration = 0;
        max_iteration = 200;
        while (x^2+y^2 <= 4) && (iteration < max_iteration)
            z = x + i*y;
            x = real(z^2+c);
            y = imag(z^2+c);
            iteration = iteration + 1;
        end
        %iteration_data(1,pixel) = x0;
        %iteration_data(2,pixel) = y0;
        iteration_data(3,pixel) = iteration;
    end
end

matC = zeros(1,2);

col_len = 3.5/pixel_size+1;
row_len = 2/pixel_size+1;

count = 0;
for column = 1:col_len
    for row = 1:row_len
        count = count+1;
        matC(row,column) = iteration_data(3,count);
    end
end

image(matC)
