x=	[-1,2,2,1,2,0,2,-3,2,1,2,3,-1];
y=	[2,-1,2,0,0,1,3,2,-1,0,1,3,1];
x = randn(20,1)*1.5 +3
y = randn(20,1)*1.5
plot(x,y,'bo')
xlim([-10 10])
ylim([-10 10])
axis([-10 10 -10 10])
line([0 0], [-10 10]);  %x-axis
line([-10 10], [0 0]);  %y-axis

color = ['r,g,b']

hold on
for r = 2:2:6
    plotCircle(r,0,0)
end
hold off

meanx = mean(x);
meany = mean(y);
hold on
plot(meanx,meany, 'rx')
hold off
dist = 0;
for i = 1:size(x,1)
    dist = dist + pdist([x(i),y(i);meanx,meany],'euclidean');
end
dist = dist/size(x,1);
hold on
plotCircle(dist,meanx,meany);
hold off
comm = ['spread = ',num2str(dist)];
text(0.5,8,comm);