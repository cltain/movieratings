function [minimum, maximum, med, stddev] = min_and_max(struct1)
%Gives the minimum and maximum values from the struct
%also gives median and standard deviation
  minimum = min(struct1.Rating);
  maximum = max(struct1.Rating);
  med = median(struct1.Rating);
  stddev = std(struct1.Rating);
end
