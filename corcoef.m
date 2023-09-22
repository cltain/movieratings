function [r1, r2, r3, genre_r1, genre_r2, genre_r3] = corcoef(mat1, mat2, mat3,
com, dra, rom)
  %Calculates the correlation coefficient of each set of movie ratings
  r1 = corrcoef(1:length(mat1), mat1);
  r2 = corrcoef(1:length(mat2), mat2);
  r3 = corrcoef(1:length(mat3), mat3);
  genre_r1 = corrcoef(1:length(com.Rating), com.Rating);
  genre_r2 = corrcoef(1:length(dra.Rating), dra.Rating);
  genre_r3 = corrcoef(1:length(rom.Rating), rom.Rating);
end
