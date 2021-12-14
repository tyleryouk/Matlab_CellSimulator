function [] = pb3_plotting(StartingCells)

% STEP 1 
M = evolution(StartingCells); %calling evolution

figure
for i=1:20
    for j=1:20
        if StartingCells(i,j)==1 
            scatter(j,20-i,'ko','filled'); %plotting all necessary black dots
            axis([0 20 0 20]); %defining axis's
            hold on 
        end
    end
end
set(gca,'Color','b') %setting background to blue

pause(0.5); %pausing between figures

% STEP 2 
figure
for i=1:20
    for j=1:20
        if StartingCells(i,j)==1 
            scatter(j,20-i,'ko','filled'); %plotting the cells
            hold on 
        end
        if M(i,j)==0&&StartingCells(i,j)==1 %parameters for live cells that will die
            scatter(j,20-i,'rx'); %plotting red xs
            hold on 
        elseif M(i,j)==1&&StartingCells(i,j)==0 %parameters for new cells that will become live
            scatter(j,20-i,'gp','filled'); %plotting green ps
            hold on                 
        end
    end
end
axis([0 20 0 20]); %setting axis 
set(gca,'Color','b') %setting background color to blue

pause(0.5);

%STEP 3 
figure

for i=1:20
    for j=1:20
        if StartingCells(i,j)==1&&M(i,j)~=0 %parameters for live cells (doesn't count cells with red x)
            scatter(j,20-i,'ko','filled'); %plotting black cells
            hold on 
        elseif M(i,j)==1&&StartingCells(i,j)==0 %parameters for new live cells
            scatter(j,20-i,'ko','filled'); %plotting new black cells
            hold on                 
        end
    end
end

axis([0 20 0 20]); %setting axis
set(gca,'Color','b') %setting background color to blue

end

