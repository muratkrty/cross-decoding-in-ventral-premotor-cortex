function [ bestUnits ] = extractBestUnits( units )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 21/01/2016
% Description: Extract best units from available data set
% Notes: 0- Object fixation experiment excluded.
%        1- This function will run only one time.

experimentIDs = [1 2 4]; % no obj-fix
objectIDs = [1:4];

emptyExpUnit = []

for j=units,
    
    unitFileName = setUnitName(j);
     
    unitStr = strcat('~/DATA/', unitFileName);
    unit = load(unitStr{1,1})
        
    for i=experimentIDs,
       for ii=objectIDs,
           if isempty(unit.data.spikes{i, ii}) 
               emptyExpUnit = [emptyExpUnit j]
           end
       end
    end
end

bestUnits = setdiff(units, unique(emptyExpUnit))

end

