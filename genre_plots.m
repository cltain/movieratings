function genre_plots(c, d, r, corr1, corr2, corr3)
%Takes in the three different genre structs and plots each of them
%create new figure window

  figure(3)
  %create best-fit-line
  eq1 = polyfit(1:length(c.Rating),c.Rating, 1);
  coef1 = polyfit(1:length(c.Rating),c.Rating, 1);
  y1 = polyval(coef1, 1:length(c.Rating));
  
  %plot comedy ratings and position with subplot; plot best fit line
  %equation
  subplot(1,3,1)
  hold on
  text(1,9.25, sprintf('r = %.2f', corr1(1,2)))
  text(1,5, sprintf('rating = %.2f*movienum + %.2f\n', eq1(1), eq1(2)))
  scatter(1:length(c.Rating),c.Rating, 'x', 'm')
  plot(1:length(c.Rating), y1)

  %label axes
  xlabel('Movie Number (Increasing By Year)')
  ylabel('Movie Rating')
  
  %label title
  title("Comedy Movies")
  
  %create best-fit-line
  eq2 = polyfit(1:length(d.Rating),d.Rating, 1);
  coef2 = polyfit(1:length(d.Rating),d.Rating, 1);
  y2 = polyval(coef2, 1:length(d.Rating));
  
  %plot drama ratings and position with subplot; plot best fit line
  %equation
  subplot(1,3,2)
  hold on
  text(1,8.75, sprintf('r = %.2f', corr2(1,2)))
  text(1,5, sprintf('rating = %.2f*movienum + %.2f\n', eq2(1), eq2(2)))
  scatter(1:length(d.Rating),d.Rating,'x', 'c')
  plot(1:length(d.Rating), y2)
  
  %label axes
  xlabel('Movie Number (Increasing By Year)')
  ylabel('Movie Rating')
  
  %label title
  title("Drama Movies")
  eq3 = polyfit(1:length(r.Rating),r.Rating, 1);
  coef3 = polyfit(1:length(r.Rating),r.Rating, 1);
  y3 = polyval(coef3, 1:length(r.Rating));
  
  %plot romance ratings and position with subplot; plot best fit line
  %equation
  subplot(1,3,3)
  hold on
  text(1,8.75, sprintf('r = %.2f', corr3(1,2)))
  text(1,5, sprintf('rating = %.2f*movienum + %.2f\n', eq3(1), eq3(2)))
  scatter(1:length(r.Rating),r.Rating, 'x', 'k')
  plot(1:length(r.Rating), y3)
  
  %label axes
  xlabel('Movie Number (Increasing By Year)')
  ylabel('Movie Rating')
  
  %label title
  title("Romance Movies")
end
