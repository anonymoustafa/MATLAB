figure

for i=1:1:length(c0)
    plot(i,c0(i,:))
    m(i)=getframe;
end
movie(m,1)