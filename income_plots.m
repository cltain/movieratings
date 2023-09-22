function income_plots(ratingstable)
%Takes in the myratings table and plots the pro ratings vs the gross income
%Also calculates the net profit and plots a bar graph with the net profit
%and percent rating
  figure(6) %new figure
  %plot scatterplot
  subplot(1,2,1)
  scatter(ratingstable.Pro_Ratings, ratingstable.Gross_Income,'m')
  
  %label axes and title
  ylabel('Box Office Gross Income (Tens of Millions of Dollars)')
  xlabel('Critic Ratings')
  title('Gross Income vs Critic Rating')
  
  %polynomial best fit line
  fit = polyfit(ratingstable.Pro_Ratings, ratingstable.Gross_Income,2);
  
  %get x and y value for best fit line
  x = sortrows(ratingstable.Pro_Ratings);
  y = polyval(fit, x);
  
  %plot best fit line
  hold on;
  plot(x,y)
  
  %plot line equation on graph
  text(12,125, sprintf('gross = %f(rating^2)\n%f(rating) + %f', fit(1), fit(2),
  fit(3)))
  
  %net profit vs ratings
  subplot(1,2,2)
  scatter(ratingstable.Pro_Ratings,ratingstable.Net_Profit,'b')
  
  %label axes and title
  ylabel('Box Office Net Profit (Millions of Dollars)')
  xlabel('Critic Ratings')
  title('Net Profit vs Critic Rating')
  
  %polynomial best fit line
  fit2 = polyfit(ratingstable.Pro_Ratings, ratingstable.Net_Profit,2);
  
  %get x and y value for best fit line
  x2 = sortrows(ratingstable.Pro_Ratings);
  y2 = polyval(fit2, x);
  
  %plot best fit line
  hold on;
  plot(x2,y2)
  
  %plot line equation on graph
  text(12,1190, sprintf('net = %f(rating^2)\n%f(rating) + %f', ...
  fit2(1), fit2(2), fit2(3)))
  figure(7) %new figure window
  
  %filter the ratings by rotten tomato scores for pro and audience scores
  tomato_60to80_1 = ratingstable((ratingstable.Pro_Ratings > 59 &
  ratingstable.Pro_Ratings < 81), {'Net_Profit'});
  tomato_81to100 = ratingstable(ratingstable.Pro_Ratings > 80, {'Net_Profit'});
  splat0to29 = ratingstable(ratingstable.Pro_Ratings < 30, {'Net_Profit'});
  splat31to59_1 = ratingstable((ratingstable.Pro_Ratings > 29 &
  ratingstable.Pro_Ratings < 60), {'Net_Profit'});
  Atomato_60to80_1 = ratingstable((ratingstable.Audience_Ratings > 59 &
  ratingstable.Audience_Ratings < 81), {'Net_Profit'});
  Atomato_81to100 = ratingstable(ratingstable.Audience_Ratings > 80,
  {'Net_Profit'});
  Asplat0to29 = ratingstable(ratingstable.Audience_Ratings < 30, {'Net_Profit'});
  Asplat31to59_1 = ratingstable((ratingstable.Audience_Ratings > 29 &
  ratingstable.Audience_Ratings < 60), {'Net_Profit'});
  
  %access net profits for the values; separated by rating percentage
  profit_tomato81to100 = tomato_81to100.Net_Profit;
  profit_splat0to29 = splat0to29.Net_Profit;
  profit_tomato60to80_1 = tomato_60to80_1.Net_Profit;
  profit_splat31to59_1 = splat31to59_1.Net_Profit;
  Aprofit_tomato81to100 = Atomato_81to100.Net_Profit;
  Aprofit_splat0to29 = Asplat0to29.Net_Profit;
  Aprofit_tomato60to80_1 = Atomato_60to80_1.Net_Profit;
  Aprofit_splat31to59_1 = Asplat31to59_1.Net_Profit;
  
  %initialize the movies that were successful counts to 0
  tomato60to80 = 0;
  tomato81to100 = 0;
  splat0to29 = 0;
  splat31to59 = 0;
  Atomato60to80 = 0;
  Atomato81to100 = 0;
  Asplat0to29 = 0;
  Asplat31to59 = 0;
  
  %filter if the movie was successful (if at least 3 times the budget was made,
  % it was profitable); find the indexess of when the net profit in the table
  % is equal to the value filtered by rating; add one to count whenever the movie
  is successful
  for i = 1:length(profit_tomato60to80_1)
    index = find(ratingstable.Net_Profit == profit_tomato60to80_1(i));
    if (3 * ratingstable.Budget(index)) < profit_tomato60to80_1(i)
      tomato60to80 = tomato60to80 + 1;
    end
  end
  for i = 1:length(profit_tomato81to100)
    index = find(ratingstable.Net_Profit == profit_tomato81to100(i));
    if (3 * ratingstable.Budget(index)) < profit_tomato81to100(i)
      tomato81to100 = tomato81to100 + 1;
    end
  end
  for i = 1:length(profit_splat0to29)
    index = find(ratingstable.Net_Profit == profit_splat0to29(i));
    if (3 * ratingstable.Budget(index)) < profit_splat0to29(i)
      splat0to29 = splat0to29 + 1;
    end
  end
  for i = 1:length(profit_splat31to59_1)
    index3 = find(ratingstable.Net_Profit == profit_splat31to59_1(i));
    if (3 * ratingstable.Budget(index3)) < profit_splat31to59_1(i)
      splat31to59 = splat31to59 + 1;
    end
  end
  
  %plot bar graph
  x = categorical({'0%-29%', '30%-59%', '60%-80%', '81%-100%'});
  y = [splat0to29, splat31to59, tomato60to80, tomato81to100];
  bar(x,y)
  
  %label title and axes
  ylabel('Good Net Profit (Millions of Dollars)')
  xlabel('Rotten Tomatoes Percentages')
  title('Profits vs Critic Rating')
  for i = 1:length(Aprofit_tomato60to80_1)
    index = find(ratingstable.Net_Profit == Aprofit_tomato60to80_1(i));
    if (3 * ratingstable.Budget(index)) < Aprofit_tomato60to80_1(i)
      Atomato60to80 = Atomato60to80 + 1;
    end
  end
  for i = 1:length(Aprofit_tomato81to100)
    index = find(ratingstable.Net_Profit == Aprofit_tomato81to100(i));
    if (3 * ratingstable.Budget(index)) < Aprofit_tomato81to100(i)
      Atomato81to100 = Atomato81to100 + 1;
    end
  end
  for i = 1:length(Aprofit_splat0to29)
    index = find(ratingstable.Net_Profit == Aprofit_splat0to29(i));
    if (3 * ratingstable.Budget(index)) < Aprofit_splat0to29(i)
      Asplat0to29 = Asplat0to29 + 1;
    end
  end
  for i = 1:length(Aprofit_splat31to59_1)
    index3 = find(ratingstable.Net_Profit == Aprofit_splat31to59_1(i));
    if (3 * ratingstable.Budget(index3)) < Aprofit_splat31to59_1(i)
      Asplat31to59 = Asplat31to59 + 1;
    end
  end
  
  figure(8) %new figure window
  
  %plot bar graph
  x = categorical({'0%-29%', '30%-59%', '60%-80%', '81%-100%'});
  y = [Asplat0to29, Asplat31to59, Atomato60to80, Atomato81to100];
  bar(x,y)
  
  %label title and axes
  ylabel('Good Net Profit (Millions of Dollars)')
  xlabel('Audience Scores')
  title('Profits vs Audience Rating')
end
