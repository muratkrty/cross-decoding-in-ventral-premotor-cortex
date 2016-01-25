function [rUnitsCell] = createLatexTable( rUnitsCell )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 25/01/2016
% Description: Create latex table format for a given cell array 

[row, col] = size(rUnitsCell);
tableChr = '&';
tableEnd = '\\ \hline';

for i = 1 : row,
   for ii = 1 : col,
       if ii == col,
           rUnitsCell{i, ii} = strcat(rUnitsCell{i, ii}, tableEnd);
       else
           rUnitsCell{i, ii} = strcat(rUnitsCell{i, ii}, tableChr); 
       end
   end
end
end

