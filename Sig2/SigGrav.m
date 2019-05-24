function [T, v, h_half] = gravity(g,h)
    T = sqrt((2*h)*g);
    v = g*T;
    h_half = 1/2*g*power((T/2),2);
end