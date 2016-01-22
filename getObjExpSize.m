function [ objexSize ] = getObjExpSize( unitData, id, experiment)
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 22/01/2016
% Description: get min of object experiments

objectIDs = [1:4];
expSize = [];

for i=objectIDs,
    expSize = [expSize size(unitData{1, id}{experiment, i}, 1)];
end

objexSize = min(expSize);
end

