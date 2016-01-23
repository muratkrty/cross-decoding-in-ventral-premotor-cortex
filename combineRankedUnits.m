function [ relAbsRankedUnits ] = combineRankedUnits( rankedRelUnits, rankedAbsUnits )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 23/01/2016
% Description: Combine Ranked Units acc. to Abs/Rel values.
% Notes: 0- This function can be used for latex table 

relAbsRankedUnits = [ rankedRelUnits(:, 1) rankedAbsUnits(:, 1)...
                      rankedRelUnits(:, 2) rankedAbsUnits(:, 2)...
                      rankedRelUnits(:, 3) rankedAbsUnits(:, 3)...
                      rankedRelUnits(:, 4) rankedAbsUnits(:, 4)];
end

