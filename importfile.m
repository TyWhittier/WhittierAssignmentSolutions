%Function created by Tyler Whittier
%Fall 2016
%KINE 6803

function [Subject_ID, Age, Gender, Weight, Day1, Day2, Day3] = importfile(filename, row, column)
% This function imports the file and returns each column as a matrix with
% the column header as the variable name

% readtable is a built-in matlab function that creates a table from a file
% and we save it temporarily as t
t = readtable(filename);
% Create vectors from each column and save them as numbers, characters, or strings
Subject_ID = table2array(t(:,1));
Age = table2array(t(:,2));
Gender = table2array(t(:,3));
Gender = char(Gender);
Weight = table2array(t(:,4));
Day1 = table2array(t(:,5));
Day2 = table2array(t(:,6));
Day3 = table2array(t(:,7));
end

