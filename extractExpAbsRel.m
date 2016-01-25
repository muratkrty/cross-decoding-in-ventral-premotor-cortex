function [ unitAbsMetrics, unitRelMetrics] = extractExpAbsRel( mCell, id,...
                                             experiment, winStep, decTreshold)
% Author: Murat Kirtay, Robotics Laboratory
% Date: 25/1/2016
% Description: Extract ranked unit ids based on absolute/relative 
%              specifity matrices. Then, combine them for latex table.
% Note: 0- this will be ugliest function.

objectIDs = [1:4];

absDecoding = [] % absolute decoding performance
relDecoding = [] % relative decoding performance

objSize = size(objectIDs,2);

unitAbsMetrics = [];
unitRelMetrics = [];

for i = id,
    
    % traverse trought experiment size for each object
    % this needs to be done for min of all experiment size
    [objexSize, exp] = getObjExpSize( mCell, i, experiment);
    % construct IO mat and vector/s in random order
    % RUN: 
    [X, Y] =extractIOseq( mCell, i, experiment, objexSize );
    %[X, Y] = extractIOrand( mCell, i, experiment, objexSize );
    
    % a pure regression leads to overfitting 
    % LOO must be performed.
    %[w, pred, err] = extractRegParams(X, Y)
    
    % apply LOO-CV
    testErr = extractLOOCVparams(X, Y);
    
    % extract absolute/relative perfomance metric values for each object
    [absMetric, relMetric] = extractDecodingMetrics(decTreshold, testErr, Y);
    unitAbsMetrics = [unitAbsMetrics ; id(i) absMetric];
    unitRelMetrics = [unitRelMetrics ; id(i) relMetric];

end
end

