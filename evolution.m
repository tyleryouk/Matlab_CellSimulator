
function [evolved_result] = evolution(array)
[m,n] = size(array); % input array

neighborhood = zeros(m,n); % a zero array the same size as the input array
evolved_result = zeros(m,n); % a zero array the same size as the input array

for ix = 2:m-1 % loop over all x-values
    for iy = 2:n-1 % loop over all y-values
        lx = ix-1; % left neighbor
        rx = ix+1; % right neighbor
        uy = iy-1; % top neighbor
        dy = iy+1; % bottom neighbor
      
        neighbors = [array(ix,uy),array(ix,dy),array(lx,iy),array(rx,iy),array(lx,uy),array(rx,uy),array(lx,dy),array(rx,dy)];
        neighborhood(ix,iy) = sum(neighbors);
      
        % current cell is alive and has two neighbors
        if array(ix,iy) > 0 && neighborhood(ix,iy) == 2 
            evolved_result(ix,iy) = 1;
      
        % current cell is alive and has three neighbors
         elseif array(ix,iy)> 0 && neighborhood(ix,iy) == 3
            evolved_result(ix,iy) = 1;
      
        % current cell is dead and has three neighbors
        elseif array(ix,iy)== 0 && neighborhood(ix,iy) == 3
            evolved_result(ix,iy) = 1;
  
         
        else
            % else the cell is dead so new point is 0
            evolved_result(ix,iy) = 0;
        end 
    end 
end 
end 
