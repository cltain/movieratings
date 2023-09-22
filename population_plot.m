function population_plot
%Loads the ratings.dat file and puts all ratings into a matrix to plot;
%calculates correlation coefficient
  %load ratings.dat (open)
  load ratings.dat
  
  %initizalize matrix to store ratings
  rating = [];
  
  %loop through ratings.dat file and put into matrix
  for i = 1:length(ratings)
    rating(i) = ratings(i);
  end
  %calculate correlation coefficient
  pop_r = corrcoef(1:length(rating), rating);
  
  %create best fit line equation
  eq = polyfit(1:length(rating),rating, 2);
  coef = polyfit(1:length(rating), rating, 2);
  y = polyval(coef, 1:length(rating));
  
  figure(1) %create figure 1
  hold on
  scatter(1:length(ratings),rating) %plots all ratings; chronological time
  plot(1:length(rating), y) %plot best fit curve
  
  %show line equation on plot
  text(25,3, sprintf('rating = %f*movienum + %f\n', eq(1), eq(2)))
  
  %show r on plot
  text(25,4, sprintf('r = %.2f', pop_r(1,2)))
  
  %label title and axes
  xlabel('Movie Number (ordered by time 90s-present)')
  ylabel('Movie Rating (Out of 10)')
  title('General Population Movie Ratings')
end
