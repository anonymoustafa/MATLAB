c0 = 1 ; x = 0 : 0.01 : 10; u = 0.2 ;
filename = 'eq104.gif';
for k = 0.001 : 0.1 : 0.3
    
    c = c0 * exp( ( -k / u )* x ); 
    title('Plot of v versus t')
    xlabel('Values of t')
    ylabel('Values of v')
    grid
    plot(x,c)
    drawnow
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k == 0.001;
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
      else
          imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
end
    