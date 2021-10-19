clc,clear all,close all
[Data,Targets] = importDs(9);
KFindices=[];
testData=[];
trData=[];
testTargets=[];
trTargets=[];
zita=1;
[DataNum,Fnum]=size(Data);
size_reduced_features= round(Fnum /10);
features=[];
for i=1:Fnum
    Data(:,i)=(Data(:,i)-min(Data(:,i)))/(max(Data(:,i))-min(Data(:,i)));
end
for t=1:20
    
    p_obj=cvpartition(Targets,'k',5);
    
    for i=1:5
        
        tr=p_obj.training(i);
        tr_ind=find(tr==1);
        te=p_obj.test(i);
        tes_ind=find(te==1);
        %         Data=ds;
        trData=Data(tr_ind,:);
        trTargets=Targets(tr_ind,:);
        testData=Data(tes_ind,:);
        testTargets=Targets(tes_ind,:);
        
        
        
        [AR_without_FS(i)]=AccuracyRate(trData,trTargets,testData,testTargets,KFindices);% correction rate without feature selection
        [Fbest_without_FS(i),Lbest_without_FS,BestChart_without_FS,MeanChart_without_FS]=NBGSA(50,1000,1,0,trData,trTargets,testData,testTargets,50,KFindices);
        
        
        Feature_selection_IG=fsInfoGain(trData,trTargets);
        [sorted_weights_IG,index_IG]=sort(Feature_selection_IG.W,'descend');
        features_IG=index_IG(1,1:size_reduced_features);
        binary_features_IG=zeros(1,Fnum);
        binary_features_IG(features_IG)=1;
        trData_reduction_IG=trData(:,features_IG);
        testData_reduction_IG=testData(:,features_IG);
        [AR_IG(i)]=AccuracyRate(trData_reduction_IG,trTargets,testData_reduction_IG,testTargets,KFindices); %correction rate IG
        
        
        Feature_selection_ReliefF=fsReliefF(trData,trTargets);
        [sorted_weights_ReliefF,index_ReliefF]=sort(Feature_selection_ReliefF.W,'descend');
        features_ReliefF=index_ReliefF(1,1:size_reduced_features);
        binary_features_ReliefF=zeros(1,Fnum);
        binary_features_ReliefF(features_ReliefF)=1;
        trData_reduction_ReliefF=trData(:,features_ReliefF);
        testData_reduction_ReliefF=testData(:,features_ReliefF);
        [AR_ReliefF(i)]=AccuracyRate(trData_reduction_ReliefF,trTargets,testData_reduction_ReliefF,testTargets,KFindices); %correction rate ReliefF
        
        
        
        Feature_selection_Fisher=fsFisher(trData,trTargets);
        [sorted_weights_Fisher,index_Fisher]=sort(Feature_selection_Fisher.W,'descend');
        features_Fisher=index_Fisher(1,1:size_reduced_features);
        binary_features_Fisher=zeros(1,Fnum);
        binary_features_Fisher(features_Fisher)=1;
        trData_reduction_Fisher=trData(:,features_Fisher);
        testData_reduction_Fisher=testData(:,features_Fisher);
        [AR_Fisher(i)]=AccuracyRate(trData_reduction_Fisher,trTargets,testData_reduction_Fisher,testTargets,KFindices); %correction rate ReliefF
        
        
        and_selected_features= and(binary_features_IG,binary_features_ReliefF);
        and_selected_features= and(binary_features_Fisher,and_selected_features);
        final_features= find(and_selected_features==1);
        
        % features=[features_IG,features_ReliefF,features_Fisher];
        % final_features=unique(features);
        
        trData_reduction_total=trData(:,final_features);
        testData_reduction_total=testData(:,final_features);
        [AR_total(i)]=AccuracyRate(trData_reduction_total,trTargets,testData_reduction_total,testTargets,KFindices); %correction rate ReliefF
        
        [Fbest(i),Lbest,BestChart,MeanChart]=NBGSA(50,1000,1,0,trData_reduction_total,trTargets,testData_reduction_total,testTargets,50,KFindices);
        
        num_of_selected_features(i)=sum(Lbest==1);
        size_final_features(i)=length(final_features);
        % Results=[AR_without_FS,AR_IG,AR_ReliefF,AR_Fisher,AR_total,Fbest,size_reduced_features,size_final_features,num_of_selected_features]
    end
    AR_without_FS(t)=mean(AR_without_FS);
    AR_IG(t)=mean(AR_IG);
    AR_ReliefF(t)=mean(AR_ReliefF);
    AR_Fisher(t)=mean(AR_Fisher);
    AR_total(t)=mean(AR_total);
    Fbest(t)=mean(Fbest);
    size_reduced_features(t) = floor(mean(size_reduced_features));
    size_final_features(t) = floor(mean(size_final_features));
    num_of_selected_features(t) = floor(mean(num_of_selected_features));
end
AR_without_FS=mean(AR_without_FS);
AR_IG=mean(AR_IG);
AR_ReliefF=mean(AR_ReliefF);
AR_Fisher=mean(AR_Fisher);
AR_total=mean(AR_total);
Fbest=mean(Fbest);
size_reduced_features = floor(mean(size_reduced_features));
size_final_features = floor(mean(size_final_features));
num_of_selected_features = floor(mean(num_of_selected_features));
Fr= (Fnum - num_of_selected_features)/Fnum;
name='colon';
result={'AR_without_FS','AR_IG','AR_ReliefF','AR_Fisher','AR_total','Fbest_without_FS','Fbest','size_reduced_features','size_final_features','num_of_selected_features','Fr';...
    AR_without_FS,AR_IG,AR_ReliefF,AR_Fisher,AR_total,Fbest_without_FS,Fbest,size_reduced_features,size_final_features,num_of_selected_features,Fr};
xlswrite(strcat('accuracyRate',num2str(name),'.xlsx'),result);