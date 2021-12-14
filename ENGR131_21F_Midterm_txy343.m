%% Solving Systems of Equations First Question

% Steps of creating a systems of equations (copied down from my paper)
% 1st equation is A+A+T+F+F=378 : 2A+T+2F=378
% 2nd equation is L+L-580+T+T+L+F=-G : 3L+2T+F+G=580
% 3rd equation is P+P+L+P-401=-L : 3P+2L=401
% 4th equation is T+G+G+L+L+T+G+G+T=740 : 3T+4G+2L=740
% 5th equation is A+A+P+P+F+F+P=531 : 2A+3P+2F=531
% 6th equation is L+P+A+T+G+F=474 : L+P+A+T+G+F=474

% Switching equatinons above to A,F,G,L,P,T (including zeroes)
% 2A+2F+0G+0L+0P+T=378
% 0A+F+G+3L+0P+2T=580
% 0A+0F+0G+2L+3P+0T=401
% 0A+0F+4G+2L+0P+3T=740
% 2A+2F+0G+0L+3P+0T=531
% A+F+G+L+P+T=474

FallMatrix=[2 2 0 0 0 1;0 1 1 3 0 2;0 0 0 2 3 0;0 0 4 2 0 3;2 2 0 0 3 0;1 1 1 1 1 1]; %matrix of above
Answers=[378;580;401;740;531;474];

% getting solution
Solution=FallMatrix\Answers; %array of solutions, 6x1 array of solutions

% changing double value to integer
Apples=int8(Solution(1)); % [ValApple] = Value of Apple
Footballs=int8(Solution(2));
Grapes=int8(Solution(3));
Leaves=int8(Solution(4));
Pumpkins=int8(Solution(5));
Trees=int8(Solution(6));

% display solution
fprintf('Value of Apples %d \n',Apples);
fprintf('Value of Footballs %d \n',Footballs);
fprintf('Value of Grapes %d \n',Grapes);
fprintf('Value of Leaves %d \n',Leaves);
fprintf('Value of Pumpkins %d \n',Pumpkins);
fprintf('Value of Trees %d \n',Trees);

%% Computer Volumes part 2
CupArray = [57/2,92/2,117] %radius of bottom, radius of top, height in mm

VolumeOfCupmm = (((pi/3)*CupArray(3))*((CupArray(1)^2) + (CupArray(2)^2) + (CupArray(1)*CupArray(2))));
VolumeOfCupL = VolumeOfCupmm * (10^-6)

disp(VolumeOfCupL)

%1L = 33.814 fluid ounces

VolumeOfCupFL = VolumeOfCupL*33.814

% find the markings of 5, 9, and 16 fluid ozs
volumes = [5 9 16];
heights = [0 0 0]; %going to input correct heights
radiuses = [0 0 0];
% What height is 5 fluid ounces at
% Reduced formula comparing fluid ounces and height

for i = 1:3
hinches = (volumes(i)/.15) * 0.0393701; %finding height in mm then converting to inches
heights(i) = hinches;
rinches = 1.125+(hinches*0.6875/4.265)
radiuses(i) = rinches;
end

%plot(radiuses(1),heights(1), '-bo',radiuses(2),heights(2), '-bs',radiuses(3),heights(3), '-r>')
hold on
%disp('heights = ') %debugging reasons
%disp(heights) %heights of each fluid ounces in inches
%disp('radiuses = ') %debugging reasons
%disp(radiuses)


% plot graph of cup
Radius = 1.1250:11/800:1.8125;
Height = 4.265*(Radius-1.125)/0.6875;
plot(radiuses(1),heights(1),'bs-','LineWidth',1.5,'MarkerSize',15,'MarkerFaceColor',[0 0 1])
plot(radiuses(2),heights(2),'g^-','LineWidth',1.5,'MarkerSize',15,'MarkerFaceColor',[0 1 0])
plot(radiuses(3),heights(3),'ko-','LineWidth',1.5,'MarkerSize',15,'MarkerFaceColor',[0 0 0])
plot(Radius,Height,'r','LineWidth',1)
legend('5oz','9oz','16oz','Cup')
xlim([0 5])
ylim([0 5])
hold on


%% Cell Simulator
close all
clc
clear all

load('StartingCells.mat');

c = false;

while (~c) %~ means opposite of
    n = input('Please enter s for Simulation, and q to exit the simulation \n','s'); %prompting user
    if n=="s" 
        pb3_plotting(StartingCells); %calls pb3_plotting script
        c = true;      
    elseif n=="q"
        c = true; %ends script
    else 
        c =false; %prompts user again, false will keep it going, true will end it
    end
end
