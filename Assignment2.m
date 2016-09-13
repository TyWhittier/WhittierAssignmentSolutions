%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Name: Tyler Whittier
%Due Date: September 15, 2016
%Assignment 2

%% Chapter 1 Exercises
%1.)

Ch1_one =63.55;

%2.)
myage = 28;
myage - 2
myage + 1

%3.)
ch1_three = namelengthmax

%4.)
ch1_fourlbs = 223;
ch1_fouroz = 3568;
who
whos
clear myweightoz
who
whos

%5.)
intmin('uint32')
intmax('uint32')
intmin('uint64')
intmax('uint64')

%6.)
dbl = 4.5;
integerthirtytwo = int32(dbl);

%11.) 
pounds = 46;
kilos = pounds / 2.2;

%12.)
ftemp = 98.6;
ctemp = (ftemp - 32)* (5/9);

%13.) 
% cfbtime = hours spent watching college football
% hwtime = hours that should have been spent doing homework
cfb = 12;
hwtime = (1.4563 * 1.43 /9.6 * 0)+ cfb;

%14.)
sind(90);
sin(pi/2);

%15.)
r_one = 12;
r_two = 14;
r_three = 16;
r_total = 1/(r_one + r_two + r_three);

%22.)
% Uppercase comes first

%24.)
% 'b' >= 'c' -1  result is 1
% 3 == 2 +1 result is 1
% (3==2) +1 result is 1
% xor(5<6, 8>4) result is 0

%25.)
x = 12;
y = 23;
xor(x > 5, y <10) 

%26.)
3*10^5 == 3e5

%27.)
log10(10000) == 4

%% Chapter 2 Exercises

%1.)
ch2_onea = [2:7];
ch2_oneb = [1.1:.2:1.7];
ch2_onec = [8:-2:2];

%2.)
vec = linspace(0,2*pi, 50);

%3.)
ch2_three = linspace(2,3,6);

%4.)
ch2_foura = linspace(-5,-1,5);
ch2_fourb = linspace(5,9,3);
ch2_fourc = linspace(8,4,3);

%6.)
ch2_six = [-1:.5:1]';

%7.)
ch2_sevenvec = [3:.5:54];
ch2_seven = ch2_sevenvec([1:2:(length(ch2_sevenvec))]);

%8.)
ch2_eightvec = [7:10;12:-2:6];
ch2_eighta = ch2_eightvec(1,3);
ch2_eightb = ch2_eightvec(2,:);
ch2_eightc = ch2_eightvec(:,1:2);

%9.)
ch2_nineveca = reshape(1:8,2,4);
ch2_ninea = numel(ch2_nineveca);
ch2_ninevecb = size(ch2_ninea);
ch2_nineb = ch2_ninevecb(1) * ch2_ninevecb(2);

%10.)
mat = reshape(1:8,2,4);
mat(1,:) = (1:4);
mat(:,3) = 2:3;

%12.)
rows = randi(5);
cols = randi(5);
zeros(rows, cols);

%23.)
ch2_twentythreevec = [3:2:11];
ch2_twentythree = sum(ch2_twentythreevec);

%26.)
ch2_twentysixA = [3:2:9];
ch2_twentysixB = [1:4];
ch2_twentysix = sum(ch2_twentysixA ./ ch2_twentysixB);

%30.)
ch2_thirtyvec = randi([-10,10], 1,5);
ch2_thirtyA = ch2_thirtyvec - 3;
ch2_thirtyB = length(find(ch2_thirtyvec > 0));
ch2_thirtyC = abs(ch2_thirtyvec);
ch2_thirtyC = max(ch2_thirtyvec);

%31.)
ch2_thirtyonevec = randi([0, 46],3,5);
ch2_thirtyoneA = max(ch2_thirtyonevec);
ch2_thirtyoneB = max(ch2_thirtyonevec');
ch2_thirtyoneC = max(max(ch2_thirtyonevec));

%% Chapter 3 Exercises

%.1)
% Script that calculates the volume of a hollow sphere
%First the different radii (plural radius?) are assigned
%R_i = inner radius of hollow sphere
%R_o = outer radius of hollow sphere
%v_sphere = volume of the sphere
R_i = 4;
R_o = 5;
v_sphere = ((4* pi)./ 3 * (R_o ^3 - R_i ^3));

%4.)
%This is a way that the user can be prompted to enter in a matrix
% ch3_four = input('Enter a matrix:')
%Enter a matrix:[4: 9; 5:10]
%
%ch3_four =
%
%    4     5     6     7     8     9
%    5     6     7     8     9    10
     
%6.)
% display 1234.5678 using fprintf w/out specifying any field width
% display in a field width of 10 w/ 4 decimal places
fprintf('%10.4f\n',1234.5678)
%  1234.5678
% display in a field width of 10 w/ 2 decimal places
fprintf('%10.2f\n',1234.5678)
%  1234.57
% display in a field width of 6 w/ 2 decimal places
fprintf('%6.4f\n',1234.5678)
%  1234.5678
% display in a field width of 2 w/ 4 decimal places
fprintf('%2.4f\n',1234.5678)
%  1234.5678


%The following script is my second time doing these 2problems.  I originally
%did them the way the book described, with functions and my output was
%exactly the same format as is given in number 8 of the book. However,
%since you asked for it all to be in one file it would give me an error
%when I tried to run my whole homework assignment because it would then
%save assignment 2 as a function and for some reason it didn't like that.
%So, for #s 8 and 13 I re-created it w/out functions. 

%8.)

disp('>>flowrate')
%This displays flowrate just as it is in the book
%It then goes on to ask the user for the value in cubic meters, performs
%the calculation and then returns the result in cubic feet
meters = input('Enter the flow in m^3/s:\n');
feet = meters/.028;
fprintf('A flow rate of%10.3f cubic meters per sec\n', meters)
fprintf('is equivalent to%10.3f cubic feet per second \n\n\n', feet)

%13.)
%The following script calculates the unit vector from a 3 dimensional
%vector.  It prompts the user to enter in the x,y, and z values and then
%returns the unit vector
x = input('To calculate a unit vector on your 3-dimensional value\n please Enter the x value:');
y = input('Now, please enter the y value:');
z = input('One more.  Please enter the z value:');

u = (x+ y+ z) /(sqrt((x*x) + (y*y) + (z*z)));
fprintf('A vector with the values%10.3f,%10.3f,and%10.3f \n', x,y,z)
fprintf('has a unit vector of%10.3f\n', u);
