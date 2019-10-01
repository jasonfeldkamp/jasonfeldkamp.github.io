% Created by Jason Feldkamp

clc;
clear all;
close all;

% Generate random array
arr_rand = zeros(1,2);

num_elements = 100;
magnitude = 1;

figure(1)
axis([0,num_elements,0,magnitude])
rects = gobjects(1,2);

delay = 10^-4;

for k = 1:num_elements
    arr_rand(k) = magnitude*rand;
    rects(k) = rectangle('Position', [k-1,0,1,arr_rand(k)],'FaceColor','y','LineWidth',1);
end

% Initialization
num_end = 0;
num_start = 0;
num_sort = 0;
init_length = length(arr_rand);

tic
% Sorting loop
while num_sort < init_length-1
    index = num_start+1;
    num_sort = num_end + num_start;
    if mod(num_sort,2) == 0 % Increasing (even) sweep - search for max
        max_val = 0;
        for k = 1 + num_start:init_length - num_end
            set(rects(k), 'FaceColor', 'b')
            pause(delay)
            if arr_rand(k) > max_val
                max_val = arr_rand(k);
                set(rects(index), 'FaceColor', 'y')
                index = k;
            end
            set(rects(k), 'FaceColor', 'y')
            set(rects(index), 'FaceColor', 'r')
        end
        arr_rand(index) = arr_rand(init_length - num_end);
        arr_rand(init_length - num_end) = max_val;
        set(rects(index), 'FaceColor', 'y', 'Position', [index-1,0,1,arr_rand(index)])
        set(rects(init_length - num_end), 'FaceColor', 'g', 'Position', [init_length - num_end-1,0,1,max_val])
        num_end = num_end + 1;
    else % Decreasing (odd) sweep - search for min
        min_val = magnitude;
        for k = init_length - num_end:-1:1 + num_start
            set(rects(k), 'FaceColor', 'b')
            pause(delay)
            if arr_rand(k) < min_val
                min_val = arr_rand(k);
                set(rects(index), 'FaceColor', 'y')
                index = k;
            end
            set(rects(k), 'FaceColor', 'y')
            set(rects(index), 'FaceColor', 'r')
        end
        arr_rand(index) = arr_rand(1+num_start);
        arr_rand(1+num_start) = min_val;
        set(rects(index), 'FaceColor', 'y', 'Position', [index-1,0,1,arr_rand(index)])
        set(rects(1+num_start), 'FaceColor', 'g', 'Position', [num_start,0,1,min_val])
        num_start = num_start + 1;
    end
end
            
        
        
