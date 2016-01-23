function [ absMetric, relMetric ] = extractDecodingMetrics(decTreshold, testErr, Y)
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 23/01/2016
% Description: Extract decoding performance metrics values for each
%              object based on absolute and relative decoding 
%              characteristics
% Notes: 0- High absolute specifity is high engagement with an object

    objectIDs = [1:4];
    objSize = size(objectIDs,2);
    testSize = size(testErr, 1);
    objLen = testSize/objSize;

    % below trick will save you from loops
    objTest = reshape(testErr', objLen, objSize)';
    absMetric = [length(find(objTest(1, :) <= decTreshold)),
                 length(find(objTest(2, :) <= decTreshold)),
                 length(find(objTest(3, :) <= decTreshold)),
                 length(find(objTest(4, :) <= decTreshold))];
   
    % extract absolute/relative perfomance metric values for each object
    relMetric = 100/testSize * absMetric';
    absMetric = 100/objLen * absMetric';

end

