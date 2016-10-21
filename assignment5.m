%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 5
% Tyler Whittier
% B01096287
% Fall 2016
% 
%
%
% This script analyzes isometric strength data collected on three
% separate days from 25 college aged participants both male and female  
%%
% The importfile function imports the raw data from a csv file and returns
% each column as a vector
[Subject_ID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv');


%%
%Create an index vector with the locations of all females/males
[maleLocations] = find(Gender == 'M');
[femaleLocations] = find(Gender == 'F');


%The genderIsoCalc function takes 5 arguments and outputs 4 that describe
%the mean values of isometric data for individuals and gender groups
[maleIsoIndMeans femaleIsoIndMeans maleGroupIsoMean femaleGroupIsoMean]...
    = genderIsoCalc(Day1, Day2, Day3, maleLocations, femaleLocations);
%%
% The dayComparator function compares days in order to determine who
% improved from day to day.  This is done 2 times to compare days 1 w/ 2 and
% 2 w/ 3.  It returns a vector with the subject IDs for those that did
% increase
[day1toDay2] = dayComparator(Subject_ID, Day1, Day2);
[day2toDay3] = dayComparator(Subject_ID, Day2, Day3);
day1toDay2 = cell2mat(day1toDay2);
day2toDay3 = cell2mat(day2toDay3);

%%
%Weight Normalize the isokinetic data for each day and calculate the mean
%for each day
normDay1 = (Day1 - min(Day1)) ./ (max(Day1) - min(Day1));
normDay1mean = mean(normDay1);
normDay2 = (Day2 - min(Day2)) ./ (max(Day2) - min(Day2));
normDay2mean = mean(normDay2);
normDay3 = (Day3 - min(Day3)) ./ (max(Day3) - min(Day3));
normDay3mean = mean(normDay3);

%%
% Now, to export to a CSV file.
% Make all vectors equal in length by adding a 13th row/column
femaleIsoIndMeans(13) = 0;
maleGroupIsoMean(13) = 0;
femaleGroupIsoMean(13)= 0;
normDay1mean(13) = 0;
normDay2mean(13) = 0;
normDay3mean(13) = 0;


%Make all row vectors into column vectors
maleGroupIsoMean = maleGroupIsoMean';
femaleGroupIsoMean = femaleGroupIsoMean';
normDay1mean = normDay1mean';
normDay2mean = normDay2mean';
normDay3mean = normDay3mean';

%Convert the cell arrays to string arrays
day1toDay2 = cellstr(day1toDay2);
%Add a 13th row as well
day1toDay2(13,1) = cellstr('Nan');
% Do the same for day2toDay3
day2toDay3 = cellstr(day2toDay3);
day2toDay3(13,1) = cellstr('Nan');
%Create a table with all the results from assignment 5 in separate columns
results = table(maleIsoIndMeans, femaleIsoIndMeans,...
    maleGroupIsoMean, femaleGroupIsoMean, normDay1mean, normDay2mean, normDay3mean, day1toDay2, day2toDay3);
%Write the table to a csv using writetable
writetable(results, 'iso_results.csv');