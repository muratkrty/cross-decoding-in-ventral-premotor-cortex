function [ X_inp, Y_inp ] = extractIOseq( unitData, id, experiment, objexSize )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 22/01/2016
% Description: create IO for regression in sequential order
% Notes:       0- X is neural data spikes
%              1- Y is object ids

X_inp = [];
objectIDs = [1:4];

for ii=objectIDs,
    X_inp = [X_inp ; unitData{1, id}{experiment, ii}(1:objexSize, :)];
end

Y_inp = X_inp(:, end);
X_inp = X_inp(:, 1:end-1);

end

