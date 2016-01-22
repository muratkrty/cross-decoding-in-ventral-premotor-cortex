function [ wSCell ] = createWScellObj( dataCell, winStep )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 22/01/2016
% Description: Crate window sized data with object ids.
% Notes: 0- last column consists of object ids.

experimentIDs = [1 2 4]; % exclude obj-fixation
objectIDs = [1:4];

windowSize = winStep(1);
stepSize = winStep(2);

fInd = 1;
lInd = fInd + windowSize-1;

dataSize = [1:size(dataCell, 2)];
wSCell = cell(1, size(dataCell, 2));

wSizedVec = [];
wsData = [];

for i=dataSize, % number of unit
      for j=experimentIDs,
        for jj=objectIDs,
            unitData = dataCell{1,i}{j, jj};
            [expRow, expCol] = size(unitData);
            for k = 1 : expRow,
                rawData = unitData(k, :);
                while lInd < expCol,
                    slicedVec = rawData(fInd:lInd);
                    countSpikes = sum(slicedVec);
                    wSizedVec = [wSizedVec countSpikes];
                    
                    % update first and last index
                    fInd = fInd + stepSize;
                    lInd = lInd + stepSize;
                    
                end
          
            wsData = [wsData ; wSizedVec];
            wSizedVec = [];
            fInd = 1;
            lInd = fInd + windowSize-1;
                
            end
            % put object ids as last column   
            ids = jj * ones(expRow, 1);
            wsData = [wsData ids];
            wSCell{1,i}{j, jj} = wsData;
            wsData = [];
        end
    end
end

