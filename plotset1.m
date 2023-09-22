function plotset1(mat1, mat2, mat3, r1, r2, r3)
%Plots the three sets of matrices and gives titles and labels
%displays correlation coefficients on the graph
  figure(2) %new figure window
  %create line of best fit
  polyfit(1:length(mat1),mat1, 1);
  coef = polyfit(1:length(mat1), mat1, 1);
  y = polyval(coef, 1:length(mat1));
  
  subplot(1,3,1) %format position in figure
  hold on
  scatter(1:length(mat1),mat1, 'x', 'b')
  plot(1:length(mat1), y) %plot best fit curve
  
  %label axes and title;plot r on graph
  text(1,8.8, sprintf('r = %.2f', r1(1,2)))
  title("Year 1990-1999")
  xlabel("# of Movies (Increasing By Year)")
  ylabel("Movie Rating")
  
  %create line of best fit
  polyfit(1:length(mat2),mat2, 1);
  coef2 = polyfit(1:length(mat2), mat2, 1);
  y2 = polyval(coef2, 1:length(mat2));
  
  subplot(1,3,2) %format position
  hold on
  scatter(1:length(mat2),mat2, 'x', 'g')
  plot(1:length(mat2), y2) %plot best fit curve
  
  %label axes and title;plot r on graph
  text(1,8.75, sprintf('r = %.2f', r2(1,2)))
  title("Year 2000-2011")
  xlabel("# of Movies (Increasing By Year)")
  ylabel("Movie Rating")
  
  %create line of best fit
  polyfit(1:length(mat3),mat3, 1);
  coef3 = polyfit(1:length(mat3), mat3, 1);
  y3 = polyval(coef3, 1:length(mat3));
  
  subplot(1,3,3) %format position
  hold on
  scatter(1:length(mat3),mat3, 'x', 'r')
  plot(1:length(mat3), y3) %plot best fit curve
  
  %label axes and title; plot r on graph
  text(1,9.5, sprintf('r = %.2f', r3(1,2)))
  title("Year 2012-2022")
  xlabel("# of Movies (Increasing By Year)")
  ylabel("Movie Rating")
end
