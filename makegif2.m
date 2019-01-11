
x = 0:0.01:10;
figure(1)
filename = 'testnew51.gif';

for n = 1:length(c0)
      y = c0(n,:);
      plot(y,c0)
      drawnow
      frame = getframe(1);
      im = frame2im(frame);
      [imind,cm] = rgb2ind(im,256);
      if n == 1;
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
      else
          imwrite(imind,cm,filename,'gif','WriteMode','append');
      end
end
