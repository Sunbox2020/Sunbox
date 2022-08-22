clc;clear
target=xlsread('附件1.xlsx');
zidan=xlsread('附件1.xlsx',2);
canshu=xlsread('附件1.xlsx',3)
% scatter(target(:,1),target(:,2),'xr')
% grid on
% hold on
% scatter(zidan(:,1),zidan(:,2))
% [Idzidan,centroids,Distance]=Kmeans(zidan,18,target,1);
% for i=1:18
% scatter(zidan(Idzidan==i,1), zidan(Idzidan==i,2)); hold on
% end
% scatter(target(:,1), target(:,2), 'r*'); hold off
% grid on;
%

x_zidan(:,1)=zidan(:,1)-canshu(5);
x_zidan(:,2)=zidan(:,2)-canshu(6);
nov=[canshu(1)*canshu(1)+canshu(3)*canshu(3),0;0,canshu(2)*canshu(2)+canshu(4)*canshu(4)];n=360;
R=mvnrnd([0,0],nov,n);
A=[];
for i=1:18
    temp=target(i,:)+R((i-1)*n/18+1:i*n/18,:);
    g((i-1)*n/18+1:i*n/18)=i;
    A=[A;temp];
end

scatter(target(:,1),target(:,2),'xr')
grid on
hold on
scatter(A(:,1),A(:,2))
[class,err]=classify(zidan,A,g,'mahalanobis');



% x=[16.6,28.08,108.3,858.1,0.08455;
% 20.6,29.33,140.1,1265,0.1178;
% 7.76,24.54,47.92,181,0.05263]  %需要分类的数据集，A和X的列数保持一致
% 
% g=[ones(3,1);2*ones(5,1)]; %原始数据分类的情况，1为良性肿瘤标准，2个为恶性肿瘤标准
% %调用函数
% [class,err]=classify(x,A,g)  %可以选择TYPE类型,缺省值为'linear'，即线性分类，TYPE 还可取值'quadratic'(二次判别)，'mahalanobis'（mahalanobis 距离）






% A=[13.54,14.36,87.46,566.3,0.09779;
% 13.08,15.71,85.63,520,0.1075
% 9.504,12.44,60.34,273.9,0.1024;
% 17.99,10.38,122.8,1001,0.1184;
% 20.57,17.77,132.9,1326,0.08474;
% 19.69,21.25,130,1203,0.1096;
% 11.42,20.38,77.58,386.1,0.1425;
% 20.29,14.34,135.1,1297,0.1003]  %原始数据，不包含分类指标g

% A=[13.54,14.36,87.46,566.3,0.09779;
% 13.08,15.71,85.63,520,0.1075
% 9.504,12.44,60.34,273.9,0.1024;
% 17.99,10.38,122.8,1001,0.1184;
% 20.57,17.77,132.9,1326,0.08474;
% 19.69,21.25,130,1203,0.1096;
% 11.42,20.38,77.58,386.1,0.1425;
% 20.29,14.34,135.1,1297,0.1003]  %原始数据，不包含分类指标g
% 
% x=[16.6,28.08,108.3,858.1,0.08455;
% 20.6,29.33,140.1,1265,0.1178;
% 7.76,24.54,47.92,181,0.05263]  %需要分类的数据集，A和X的列数保持一致
% 
% g=[ones(3,1);2*ones(5,1)]; %原始数据分类的情况，1为良性肿瘤标准，2个为恶性肿瘤标准
% %调用函数
% [class,err]=classify(x,A,g)  %可以选择TYPE类型,缺省值为'linear'，即线性分类，TYPE 还可取值'quadratic'(二次判别)，'mahalanobis'（mahalanobis 距离）











