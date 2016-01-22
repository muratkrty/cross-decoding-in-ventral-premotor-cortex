function [ testError  ] = extractLOOCVparams( X, Y )
% Author: Murat Kirtay, The BioRobotics Inst.
% Date: 22/01/2016
% Description: Apply leave one out cross validation
% Algorithm pseudo code:
%      for k = 1 to R
%          0- Let (X_k, Y_k) be the k^th record
%          1- Temporarily remove (X_k, Y_k) from the data set
%          2- Train on the remanining R-1 data point/samples
%          3- Note your error (X_k, Y_k)
%      end
%          4- When you've done all point/samples report mean error.

rowNum = size(X,1);

testError = [];
totError = [];

for i=1 : rowNum,
       
    inputX = X;
    outputY = Y;
    
    % contruct testing data
    testX = inputX(i, :);
    testY = outputY(i);
    
    % contruct training data
    inputX(i, :) = inputX(end, :);
    outputY(i, :) = outputY(end, :);
    
    % temporarily remove last row from IO
    inputX = inputX(1:end-1, :);
    outputY = outputY(1:end-1, :);
    
    % get training w, pred and errors
    % use only weight of pure regression
    [trW, trPred, trErr] = extractRegParams(inputX, outputY);
    
    testPredY = testX * trW;
    trError = abs(testY-testPredY);
    
    
    % test error will be evaluated my performance metrics
    testError(i, 1) = trError;
    
    % log the error to calculate mean
    totError = totError + trError;
    
end
   meanError = totError / rowNum;

end

