x= (1.8:0.01:2.6);
y = (sqrt(9-x.^2))/.log(x);
plot(x,y,'-r')
axis([1.8,2.6,-2.8,-0.8])