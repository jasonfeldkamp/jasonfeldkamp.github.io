% Created by Jason Feldkamp

clc
close all
clear all

dim = [-50,50,-50,50]; % xmin, xmax, ymin, ymax
b_density = 1.3; % Affects the density of the cluster

seed = [0,0]; % place seed

figure(1)
axis equal
axis(dim)
graphics = gobjects(1,2);

particles = zeros(1,2);
particles(1,1) = seed(1);
particles(1,2) = seed(2);
graphics(1) = rectangle('Position',[particles(1,1)-0.5,particles(1,2)-0.5,1,1],'FaceColor','black');

iterations = 2001; % Must be odd
num_particles = 1;

for n = 1:iterations
    maxes = max(abs(particles),[],1);
    num_particles = num_particles + 1;
    particles(num_particles,1) = randi([floor(-b_density*maxes(1))-1,floor(b_density*maxes(1))+1]);
    particles(num_particles,2) = randi([floor(-b_density*maxes(2))-1,floor(b_density*maxes(2))+1]);
    if num_particles <= iterations/6
        graphics(num_particles) = rectangle('Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1],'FaceColor','yellow');
    elseif num_particles <= iterations/3
        graphics(num_particles) = rectangle('Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1],'FaceColor','red');
    elseif num_particles <= iterations/2
        graphics(num_particles) = rectangle('Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1],'FaceColor','green');
    elseif num_particles <= 2*iterations/3
        graphics(num_particles) = rectangle('Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1],'FaceColor','cyan');
    elseif num_particles <= 5*iterations/6
        graphics(num_particles) = rectangle('Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1],'FaceColor','blue');
    else
        graphics(num_particles) = rectangle('Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1],'FaceColor','magenta');
    end
    collision = false;
    while collision == false
        for k = 1:num_particles-1
            if particles(k,1) == particles(num_particles,1) && particles(k,2) == particles(num_particles,2);
                collision = true;
                break
            end
        end
        if collision == true% && moves ~= 0;
            switch dir
                case 1 % U
                    particles(num_particles,2) = particles(num_particles,2) - 1;
                case 2 % R
                    particles(num_particles,1) = particles(num_particles,1) - 1;
                case 3 % D
                    particles(num_particles,2) = particles(num_particles,2) + 1;
                case 4 % L
                    particles(num_particles,1) = particles(num_particles,1) + 1;
            end
            set(graphics(num_particles),'Position',[particles(num_particles,1)-0.5,particles(num_particles,2)-0.5,1,1]);
            pause(10^-10);
        else
            dir = randi(4);
            switch dir
                case 1 % U
                    if particles(num_particles,2) <= b_density*maxes(2);
                        particles(num_particles,2) = particles(num_particles,2) + 1;
                    end
                case 2 % R
                    if particles(num_particles,1) <= b_density*maxes(1);
                        particles(num_particles,1) = particles(num_particles,1) + 1;
                    end
                case 3 % D
                    if particles(num_particles,2) >= -b_density*maxes(2);
                        particles(num_particles,2) = particles(num_particles,2) - 1;
                    end
                case 4 % L
                    if particles(num_particles,1) >= -b_density*maxes(1);
                        particles(num_particles,1) = particles(num_particles,1) - 1;
                    end
            end
        end
    end
end

for k = 1:num_particles
	set(graphics(k),'Position',[particles(k,1)-0.5,particles(k,2)-0.5,1,1]);
end