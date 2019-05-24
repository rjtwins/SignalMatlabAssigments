function pltSin(t,type)
    y1 = sin(3*t);
    y2 = 10*cos(0.2*pi*t);
    y3 = 5*cos(19*t);
    y4 = -1*sin(4*pi*t);
    hold on
    plot(t,y1,type);
    plot(t,y2,type);
    plot(t,y3,type);
    plot(t,y4,type);

    legend('y1 = sin(3t)','y2 =	10cos(0.2pi*t)','	y3 = 5cos(19t)','y4 = -sin(4?t)')
    xlabel("Time (sec)");
    ylabel("Amplitude");
    hold off
end

