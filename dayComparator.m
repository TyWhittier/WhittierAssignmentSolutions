%Function created by Tyler Whittier
%Fall 2016
%KINE 6803

function [increased] = dayComparator(Subject_ID, DayA, DayB);
%This function takes in the data from the whole group for 2 different days
%and returns the subject IDs for those that increased from the first to the
%second day

%Subtract the 2nd day entered from the 1st value and create a vector of
%the results.  If the result is negative it means their 2nd day was
%stronger. 
a = DayA-DayB;
% Create an index vector to locate the individuals that increased
b = find(a<= 0);
%Use the index vector to select the Subject IDs that increased from day A
%to day B
c = Subject_ID([b]);
increased = c;
end