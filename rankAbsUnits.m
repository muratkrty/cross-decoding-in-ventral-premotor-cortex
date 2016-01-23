function [ rankedAbsUnits ] = rankAbsUnits( unitAbsMetrics, uNum )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 23/01/2016
% Description: Rank and extract units from first nNum^th unit ids
%              according to their absoulte decoding performance metric

absCylinder = sortrows(unitAbsMetrics, -2);
absSphere = sortrows(unitAbsMetrics, -3);
absRing = sortrows(unitAbsMetrics, -4);
absCube = sortrows(unitAbsMetrics, -5);

rankedAbsUnits = [absCylinder(1:uNum)' absSphere(1:uNum)'...
                  absRing(1:uNum)' absCube(1:uNum)'];
end

