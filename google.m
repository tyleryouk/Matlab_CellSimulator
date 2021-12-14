figure

for i=1:20
    for j=1:20
        %if StartingCells(i,j)==1&&M(i,j)~=0 
        %    scatter(j,20-i,'ko','filled');
        %    hold on 
        elseif M(i,j)==1&&StartingCells(i,j)==0
            scatter(j,20-i,'ko','filled');
            hold on                 
        end
    end
end

axis([0 20 0 20]);
set(gca,'Color','b')