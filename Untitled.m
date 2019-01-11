
for i=1:5:2896
    plot(x,C(i,:))
    M(i)=getframe; 
end
movie(M)