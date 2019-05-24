% Jorre Vedder S4379101
% Signal analysis and MATLAB Assigment2

%get rho valies and set model variables
rho = 0:0.1:2*pi
r = 1
x = 1:length(rho)
y = 1:length(rho)

%loop over rho values and calculate x and y coordinates for plot
for i = 1:length(rho)
    x(i) = r*cos(rho(i))
    y(i) = r*sin(rho(i))
end

%Plot x,y
plot(x,y)