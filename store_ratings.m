function [yearsp1, yearsp2, yearsp3] = store_ratings
%Reads rating.dat and stores the three sets of ratings, separated by year
  %load through ratings.dat (open)
  load ratings.dat
  
  %store ratings from 2000 to 2011 in matrix
  for i = 1:100
    yearsp1(i) = ratings(i);
  end
  %store ratings from 1990 to 1999 in matrix
  for i = 1:100
    yearsp2(i) = ratings(i+100);
  end
  %store ratings from 2012 to 2022 in matrix (later 50 ratings released during
  %covid)
  for i = 1:100
    yearsp3(i) = ratings(i+200);
  end
end
