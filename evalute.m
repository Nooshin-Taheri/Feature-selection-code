function [ fitness] = evalute( trData2,trTargets,testData2,testTargets)       
    
 k = 1;%1 5 10
      predictedLabels = knnclassify(testData2, trData2, trTargets,k,'euclidean');
      fitness = sum(predictedLabels == testTargets)/length(testTargets ) ;
end

