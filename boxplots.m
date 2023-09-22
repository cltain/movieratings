function boxplots(avg1, min1, max1, med1, std1, varargin)
%Finds the upper and lower quartiles and then plots boxplots for the comedy,
%drama, and romance movies
  q1_c = med1 - std1; %lower quartile
  q3_c = med1 + std1; %upper quartile
  q1_d = varargin{4} - varargin{5}; %lower quartile
  q3_d = varargin{4} + varargin{5}; %upper quartile
  q1_r = varargin{9} - varargin{10}; %lower quartile
  q3_r = varargin{9} + varargin{10}; %upper quartile
  
  %format on new figure
  figure(4)
  
  %position plot
  subplot(1,3,1)
  
  %plot boxplot
  boxplot([min1, q1_c, med1, med1, q3_c, max1], 'Labels', {'Comedy Ratings'})
  
  %display info and labels
  text(0.5,5.1, sprintf('average = %.2f', avg1))
  ylabel("Ratings")
  
  %position plot
  subplot(1,3,2)
  
  %plot boxplot
  boxplot([varargin{2},q1_d,varargin{4},varargin{4},q3_d, varargin{3}], ...
  'Labels', {'Drama Ratings'})
  
  %display info, title, and labels
  text(0.5,5.2, sprintf('average = %.2f', varargin{1}))
  title("Genre Box Plots")
  ylabel("Ratings")
  
  %position plot
  subplot(1,3,3)
  
  %plot boxplot
  boxplot([varargin{7},q1_r,varargin{9},varargin{9},q3_r, varargin{8}], ...
  'Labels', {'Romance Ratings'})
  
  %display info and labels
  text(0.5,5.1, sprintf('average = %.2f', varargin{6}))
  ylabel("Ratings")
end
