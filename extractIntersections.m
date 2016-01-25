function [ rExpUnit1, rExpUnit2] = extractIntersections( rExpUnit1, rExpUnit2 )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 25/01/2016
% Description: Extract the unit ids which are appeared in both 
%              experiment conditions

% add latex color names
ltxColors = importdata('latex/latex_color.txt');

colSize = [1:size(rExpUnit1,2)];
for i=colSize,
   [absEl, absInRel] = ismember(rExpUnit2(:,i), rExpUnit1(:,i)); 
   absRelInd = [find(absInRel > 0) nonzeros(absInRel)];
   
   randColor = randperm(size(ltxColors, 1));
   for ii = 1 : size(absRelInd,1),
       rExpUnit2{absRelInd(ii,1),i} = strcat(ltxColors(randColor(ii)), rExpUnit2{absRelInd(ii, 1), i});
       rExpUnit1{absRelInd(ii,2),i} = strcat(ltxColors(randColor(ii)), rExpUnit1{absRelInd(ii, 2), i});
   end
   
   absRelInd = [];
end

end

