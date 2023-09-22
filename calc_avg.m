function avg = calc_avg(struct)
%Calculates the average for elements in a struct
%initialize sum

  sum = 0;
  for i = 1:length(struct.Rating) %loop through the ratings
    sum = sum + struct.Rating(i); %get sum
  end
  
  %calculate average
  avg = sum/length(struct.Rating);
end
