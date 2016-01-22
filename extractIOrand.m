function [ X_inp, Y_inp ] = extractIOrand( unitData, id, experiment, objexSize )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 22/01/2016
% Description: create IO for regression in random order
% Notes:       0- X is neural data spikes
%              1- Y is object ids
%              2- randperm is not available for some matlab versions


X_inp = [];
objectIDs = [1:4];

for ii=objectIDs,
    rowSize = size(unitData{1, id}{experiment, ii}, 1);
    randInd = randperm(rowSize, objexSize);
    X_inp = [X_inp ; unitData{1, id}{experiment, ii}(randInd, :)];
end

Y_inp = X_inp(:, end);
X_inp = X_inp(:, 1:end-1);

end

