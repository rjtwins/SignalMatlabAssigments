function plotCircle(r,x,y)
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x
    yunit = r * sin(th) + y
    plot(xunit, yunit);
end