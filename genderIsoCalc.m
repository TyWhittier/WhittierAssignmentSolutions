%Function created by Tyler Whittier
%Fall 2016
%KINE 6803

function [maleIsoIndMeans, femaleIsoIndMeans,...
    maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Day1, Day2, Day3, maleLocations, femaleLocations)
%This function takes in the isometric data from all three days and the
%vector locations of males and females.  From here, it outputs a separate
%vector for males and females with the means across all three days for each
%individual.  It also outputs the mean value for each gender group across
%all three days


% Create a vector with the male data points for each day
maleDay1 = Day1([maleLocations]);
maleDay2 = Day2([maleLocations]);
maleDay3 = Day3([maleLocations]);
% Create a matrix with these three vectors
matrix = [maleDay1 maleDay2 maleDay3];
% Transpose the matrix so that the mean function gives an average for each
% individual
Isok_mean = mean(matrix');
%Transpose these means to make a column vector
maleIsoIndMeans = Isok_mean';
%Do the same with the female data as was done with the male
femaleDay1 = Day1([femaleLocations]);
femaleDay2 = Day2([femaleLocations]);
femaleDay3 = Day3([femaleLocations]);
fmatrix = [femaleDay1 femaleDay2 femaleDay3];
feIsok_mean = mean(fmatrix');
femaleIsoIndMeans = feIsok_mean';
%Find the mean for all individual male/female means
maleGroupIsoMean = mean(maleIsoIndMeans);
femaleGroupIsoMean = mean(femaleIsoIndMeans);
end

