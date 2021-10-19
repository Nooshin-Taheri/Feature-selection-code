function [Data,Targets] = importDs(ds_Num)
switch ds_Num
    case 1% 9_Tumors (60*5727), 9 classes:0,1,...,8
        load  ('D:\arshad\dataset\9_Tumors.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);

 case 2% 11_Tumors (174*12534), 11 classes:0,1,...,10
        load  ('D:\arshad\dataset\11_Tumors.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);
        
 case 3% 14_Tumors (308*15010),26 classes:0,1,...,26
        load  ('D:\arshad\dataset\14_Tumors.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);
        
 case 4% Brain_Tumor1 (90*5921),5 classes:0,1,...,4
        load  ('D:\arshad\dataset\Brain_Tumor1.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);

case 5% Brain_Tumor2 (50*10368),4 classes:0,1,...,3
        load  ('D:\arshad\dataset\Brain_Tumor2.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);
        
case 6% breast_Cancer (97*24482),2 classes:0,1
        load  ('D:\arshad\dataset\breast_Cancer.mat') ;
        Data=breast_Cancer(:,1:end-1);
        Targets=breast_Cancer(:,end);  
     

case 7% CLL-SUB-111 (111*11341),3 classes:1,2,3
        load  ('D:\arshad\dataset\CLL-SUB-111.mat') ;
        Data=X;
        Targets=Y;
        
case 8% CNS (60*7130),2 classes:0,1
        load  ('D:\arshad\dataset\CNS.mat') ;
        Data=CNS(:,1:end-1);
        Targets=CNS(:,end);     
        
        
 case 9% colon (62*2001),2 classes:1,2
        load  ('D:\arshad\dataset\colon.mat') ;
        Data=colon(:,1:end-1);
        Targets=colon(:,end);       
        
case 10% DLBCL (77*5470),2 classes:0,1
        load  ('D:\arshad\dataset\DLBCL.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);  
        
case 11% GCM (190*16064),14 classes:0,1,...,13
        load  ('D:\arshad\dataset\GCM.mat') ;
        Data=GCM(:,1:end-1);
        Targets=GCM(:,end);         
        
 case 12% GLA-BRA-180 (180*49152),4 classes:1,2,3,4
        load  ('D:\arshad\dataset\GLA-BRA-180.mat') ;
        Data=X;
        Targets=Y; 
        
 case 13% GLI-85(85*22284),2 classes:1,2
        load  ('D:\arshad\dataset\GLI-85.mat') ;
        Data=X;
        Targets=Y;   
        
 case 14%leukemia(72*7130),2 classes:0,1
        load  ('D:\arshad\dataset\leukemia.mat') ;
        Data=leukemia(:,1:end-1);
        Targets=leukemia(:,end);         
          
case 15% Leukemia1 (72*5328),3 classes:0,1,2
        load  ('D:\arshad\dataset\Leukemia1.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1); 
        
case 16% Leukemia2 (72*11226),3 classes:0,1,2
        load  ('D:\arshad\dataset\Leukemia2.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1); 
        
case 17% Lung_Cancer (203*12601),5 classes:0,1,...,4
        load  ('D:\arshad\dataset\Lung_Cancer.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);   
        
        
case 18% Lymphoma (45*4027),2 classes:0,1
        load  ('D:\arshad\dataset\Lymphoma.mat') ;
        Data=Lymphoma(:,1:end-1);
        Targets=Lymphoma(:,end);     
        
case 19% prostat_Cancer (21*12601),2 classes:0,1
        load  ('D:\arshad\dataset\prostat_Cancer.mat') ;
        Data=prostat_cancer(:,1:end-1);
        Targets=prostat_cancer(:,end);             
        
case 20% Prostate_Tumor (102*10510),2 classes:0,1
        load  ('D:\arshad\dataset\Prostate_Tumor.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);    
        
        
case 21% SMK-CAN-187(187*19994),2 classes:1,2
        load  ('D:\arshad\dataset\SMK-CAN-187.mat') ;
        Data=X;
        Targets=Y;  
        
case 22% SRBCT (83*2309),4 classes:0,1,2,3
        load  ('D:\arshad\dataset\SRBCT.mat') ;
        Data=data(:,2:end);
        Targets=data(:,1);        
                            
        
case 23%TOX-171(171*5749),4 classes:1,2,3,4
        load  ('D:\arshad\dataset\TOX-171.mat') ;
        Data=X;
        Targets=Y;      
end
end
