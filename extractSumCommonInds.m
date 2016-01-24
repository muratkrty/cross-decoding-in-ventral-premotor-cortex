function [ absRelCommon ] = extractSumCommonInds( rankedRelUnits, rankedAbsUnits )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 24/01/2016
% Description: Extract sum of common unit ids in different experiment
%              conditions. This will lead to how many units are performed
%              well above treshold.

%absRelCommon = ismember(rankedAbsUnits, rankedRelUnits);
relAbsCommon = ismember(rankedRelUnits, rankedAbsUnits);

absRelCommon = sum(relAbsCommon);
end

