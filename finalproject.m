%Initialize variables
%Use ; to suppress output; use clc to clear inputs & outputs in command window
clc
format compact

%call population_plot to plot the general population ratings
population_plot

%call function store_ratings to access matrices separated by year
[year_90_99, year_00_11, year_12_22] = store_ratings;

%call genre_samples function to access the 3 genre's ratings
[comedy, drama, romance] = genre_samples;

%call function corcoef() to calculate correlation coefficient of each set
[r90s, r2000s, r2010s, rcom, rdra, rrom] = corcoef(year_90_99, year_00_11,
year_12_22, comedy, drama, romance);

%call plot function
plotset1(year_90_99, year_00_11, year_12_22, r90s, r2000s, r2010s)

%call the genre_plots function to plot the genre histogram
genre_plots(comedy, drama, romance, rcom, rdra, rrom)

%call the calc_avg function to take average of the ratings for each genre
c_avg = calc_avg(comedy);
d_avg = calc_avg(drama);
r_avg = calc_avg(romance);

%call the min_and_max functions to get the minimum and maximum values for
%the ratings in the three genres
[c_min, c_max, c_med, c_std] = min_and_max(comedy);
[d_min, d_max, d_med, d_std] = min_and_max(drama);
[r_min, r_max, r_med, r_std] = min_and_max(romance);

%call the boxplots function to plot the box plots
boxplots(c_avg, c_min, c_max, c_med, c_std, d_avg, d_min, d_max, d_med, d_std,
r_avg, r_min, r_max, r_med, r_std)

%call the myratings function to access table
rating_table = myratings();

%call table_plot function to plot the table data
table_plot(rating_table)

%call differences function to find the differences between my ratings and
%the pro ratings
diff_table = difference(rating_table);

%call income_plots function to plot ratings vs gross
income_plots(rating_table)
%display tables
disp(rating_table)
disp(diff_table)
