function [ unit_name_list ] = setUnitName( input_args )
% Author: Murat Kirtay, Robotics Laboratory
% Date: 26/05/2014
% Description: Display selected neurons format ID: LF5-001
% Bugs: OK. No known 
unit_name_list = [ ];

for i = 1 : length(input_args)
    unit_no = input_args(i);
    
    if unit_no < 10
        unit_no_str = strcat('LF5-00', int2str(+unit_no));
    elseif unit_no >= 10 && unit_no <100
        unit_no_str = strcat('LF5-0', int2str(+unit_no));
    else
        unit_no_str = strcat('LF5-', int2str(+unit_no));
    end
        unit_name_list{i} = strcat(unit_no_str,'.mat');
end

end



