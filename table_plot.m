function table_plot(movietable)
%Takes in a table and plots the data to compare pro ratings and personal
%ratings
  %extract movie names, my ratings, and pro ratings from the table
  movie_names = categorical(movietable.Movie_Names);
  audienceratings = movietable.Audience_Ratings;
  myratings = movietable.My_Ratings;
  proratings = movietable.Pro_Ratings;
  %create new figure
  figure(5)
  hold on;
  %plot the ratings for personal and pro against the movie name
  p1 = scatter(movie_names, audienceratings,"*", 'b');
  p2 = scatter(movie_names, proratings,"*", 'r');
  p3 = scatter(movie_names, myratings,"*", 'p');
  %label axes, title, and format legend
  title("My vs Critics vs Audience Ratings")
  xlabel("Movie Names")
  ylabel("Movie Rating (Out of 100%)")
  legend([p1, p2, p3], 'audience ratings', 'pro ratings', 'my ratings')
  legend('Location','bestoutside')
end
