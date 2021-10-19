function [CorPer]=AccuracyRate(trData,trTargets,testData,testTargets,KFindices)

 k = 1;%1 5 10
      predictedLabels = knnclassify(testData, trData, trTargets,k,'euclidean');
      CorPer = sum(predictedLabels == testTargets)/length(testTargets ) ;
end