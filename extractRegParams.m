function [ w, yPred, errorTraining ] = extractRegParams( x, y)
% Author: Murat Kirtay, Robotics Laboratory
% Date: 22/01/2016
% Description: get training weight, prediction vector and 
%              training errors for specifc unit.

w = pinv( (x' * x) ) * x' * y;
yPred = x * w;
errorTraining = abs(y-yPred);

end

