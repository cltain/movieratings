function diff_table = difference(movietable)
%Takes in the my_ratings.m table and calculates the difference between audience
%ratings and the pro ratings; returns a table of the count of large differences,
%medium differences, and small differences
  %initialize null matrix to store differences
  differences = [];
  mydiff = [];
  
  %loop through the movies in the table
  for i = 1:length(movietable.Movie_Names)
    %take the difference between audience ratings and the pro ratings
    diff = movietable.Audience_Ratings(i) - movietable.Pro_Ratings(i);
    %take the difference between my ratings and the pro ratings
    diff2 = movietable.My_Ratings(i) - movietable.Pro_Ratings(i);
    %add the differences to the differences matrices
    differences(i) = diff;
    mydiff(i) = diff2;
  end
  
  %initialize counts to count how many of my ratings are greater, less,
  %or equal to the pro ratings
  LargeDifferencesCount = 0;
  MediumDifferencesCount = 0;
  SmallDifferencesCount = 0;
  NoneCount = 0;
  LargeDifferencesCount2 = 0;
  MediumDifferencesCount2 = 0;
  SmallDifferencesCount2 = 0;
  NoneCount2 = 0;
  %loop through each of the values in the differences matrices
  %large difference = 15% difference, medium difference = 10% difference,
  %and small difference < 10% difference
  for i = 1:length(differences)
    if differences(i) > 15 || differences(i) < -15
      LargeDifferencesCount = LargeDifferencesCount + 1;
    elseif differences(i) >= 10 || differences(i) <= -10
      MediumDifferencesCount = MediumDifferencesCount + 1;
    elseif differences(i) > 0 || differences(i) < 0
      SmallDifferencesCount = SmallDifferencesCount + 1;
    elseif differences(i) == 0
      NoneCount = NoneCount + 1;
    end
  end
  for i = 1:length(mydiff)
    if mydiff(i) > 15 || mydiff(i) < -15
      LargeDifferencesCount2 = LargeDifferencesCount2 + 1;
    elseif mydiff(i) >= 10 || mydiff(i) <= -10
      MediumDifferencesCount2 = MediumDifferencesCount2 + 1;
    elseif mydiff(i) > 0 || mydiff(i) < 0
      SmallDifferencesCount2 = SmallDifferencesCount2 + 1;
    elseif mydiff(i) == 0
      NoneCount2 = NoneCount2 + 1;
    end
  end
  
  %add differences counts matrices together
  largediff = [LargeDifferencesCount; LargeDifferencesCount2];
  mediumdiff = [MediumDifferencesCount; MediumDifferencesCount2];
  smalldiff = [SmallDifferencesCount; SmallDifferencesCount2];
  none = [NoneCount; NoneCount2];
  diff_table = table(largediff, mediumdiff, smalldiff, none, 'VariableNames',
  { ...
  'Large Difference (15% or greater)', 'Medium Difference (10% to 14%)', ...
  'Small Difference(less than 10%)','No Difference'}, ...
  'RowNames', {'Audience and Critics', 'Mine and Critics'});
end
