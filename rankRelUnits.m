function [ rankedRelUnits ] = rankRelUnits( unitRelMetrics, uNum )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 23/01/2016
% Description: Rank and extract units from first nNum^th unit ids
%              according to their relative decoding performance metric

relCylinder = sortrows(unitRelMetrics, -2);
relSphere = sortrows(unitRelMetrics, -3);
relRing = sortrows(unitRelMetrics, -4);
relCube = sortrows(unitRelMetrics, -5);

rankedRelUnits = [relCylinder(1:uNum)' relSphere(1:uNum)'...
                  relRing(1:uNum)' relCube(1:uNum)'];
end

