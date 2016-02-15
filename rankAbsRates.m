function [ rateAbs ] = rankAbsRates( unitAbsMetrics, uNum )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 15/05/2016
% Description: Rank and extract units from first nNum^th unit ids
%              according to their absoulte decoding performance rates


absCylinder = sortrows(unitAbsMetrics, -2);
absSphere = sortrows(unitAbsMetrics, -3);
absRing = sortrows(unitAbsMetrics, -4);
absCube = sortrows(unitAbsMetrics, -5);

rateAbs = [absCylinder(1:uNum, 2) absSphere(1:uNum, 3)...
                  absRing(1:uNum, 4) absCube(1:uNum, 5)];

end

