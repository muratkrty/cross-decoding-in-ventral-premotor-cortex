function [ movementData, graspingData ] = extractEventsData( bestUnits, movementInd, graspingInd )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 21/01/2016
% Description: Extract onmove and grasping event data for specified index
%              range
% Notes: 0- Data vectors are raw spiking data. 
%        1- Window size should be performed to decrease resolution

unitSize = size(bestUnits, 2);
movementData = cell(1, unitSize);
graspingData = cell(1, unitSize);

experimentIDs = [1 2 4]; % no need for object fixation experiment
objectIDs = [1:4];

ind = 1;

for j = bestUnits,
        
    unitFileName = setUnitName(j);
  
    unitStr = strcat('~/DATA/', unitFileName);
    unit = load(unitStr{1,1});
    onMoveData = cell(size(experimentIDs,2), size(objectIDs,2));
    graspedData = cell(size(experimentIDs,2), size(objectIDs,2));
    
    for i=experimentIDs,
        for ii=objectIDs,
            onMoveData{i,ii} = unit.data.spikes{i,ii}(:, movementInd(1):movementInd(2)-1);
            graspedData{i,ii} = unit.data.spikes{i,ii}(:, graspingInd(1):graspingInd(2)-1);
         end
    end
    
    movementData{1, ind} = onMoveData;
    graspingData{1, ind} = graspedData;
    ind = ind + 1;
    
end

end

