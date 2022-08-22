clc
clear 
filename1 = '附件1.xlsx';     
filename2 = '附件2.xlsx';    
filename3 = '附件3.xlsx';  
filename4 = '附件4.xlsx';    
%文件名
[num1_1,txt1_1,raw1_1] = xlsread(filename1,'目标点');
[num1_2,txt1_2,raw1_2] = xlsread(filename1,'落点');
[num1_3,txt1_3,raw1_3] = xlsread(filename1,'相关参数');
[num2_1,txt2_1,raw2_1] = xlsread(filename2,'目标点');
[num2_2,txt2_3,raw2_2] = xlsread(filename2,'落点');
[num2_3,txt2_3,raw2_3] = xlsread(filename2,'相关参数');
[num3_1,txt3_2,raw3_3] = xlsread(filename3,'目标点');
[num3_2,txt3_2,raw3_2] = xlsread(filename3,'落点');
[num3_3,txt3_3,raw3_3] = xlsread(filename3,'相关参数');
[num4_1,txt4_1,raw4_1] = xlsread(filename4,'目标点');
[num4_2,txt4_2,raw4_2] = xlsread(filename4,'落点');
num1_2(:,1) = num1_2(:,1)+23;
num1_2(:,2) = num1_2(:,2)+35;

%[Idx,C,sumD,D]=kmeans(num1_2,18,'dist','sqEuclidean','start',num1_1,'rep',1)

%scatter(num1_1(:,1),num1_1(:,2));
%hold on
%plot(num1_2(Idx==1,1),num1_2(Idx==1,2),'r.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==2,1),num1_2(Idx==2,2),'b.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==3,1),num1_2(Idx==3,2),'g.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==4,1),num1_2(Idx==4,2),'y.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==5,1),num1_2(Idx==5,2),'m.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==6,1),num1_2(Idx==6,2),'r.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==7,1),num1_2(Idx==7,2),'k.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==8,1),num1_2(Idx==8,2),'b.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==9,1),num1_2(Idx==9,2),'r.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==10,1),num1_2(Idx==10,2),'c.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==11,1),num1_2(Idx==11,2),'m.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==12,1),num1_2(Idx==12,2),'y.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==13,1),num1_2(Idx==13,2),'k.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==14,1),num1_2(Idx==14,2),'b.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==15,1),num1_2(Idx==15,2),'r.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==16,1),num1_2(Idx==16,2),'g.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==17,1),num1_2(Idx==17,2),'c.','MarkerSize',14)
%hold on
%plot(num1_2(Idx==18,1),num1_2(Idx==18,2),'m.','MarkerSize',14)


%%附件四数据
[Idx,C,sumD,D]=kmeans(num4_1,18,'dist','sqEuclidean','start',num4_1,'rep',1)
ld=num4_2([4 13 18 21 25 28 32 37 46 48 55 70 75 83 85 86 90 94 100 103 105 106 113 116 117 118 122 128 123 129 132 133 136 137 138 139 141 145 146 148] ,:)
%ld=num4_2([4 13 18 21 25 28 32 75 83 85 86 90 94 100 10] ,:)
jd=[-131.584 38581.8];
for i=1:40
   xdld(i,1)=ld(i,1) - jd(1,1);
   for j=1:40
       xdld(j,2)=ld(j,2) - jd(1,2);
   end
end
for k=1:40
    d(k,1)=sqrt(xdld(k,1)*xdld(k,1)+xdld(k,2)*xdld(k,2));
end
h = lillietest(d(:,1))%正态分布检验
% [f,xi] = ksdensity(xdld)

% plot (xi,f)
%%
x1=-49:50;
y1=xdld(:,1);
%y1=reshape(y1,1,39);
%y1 = hist(y1,100);
xx1 = x1(:);
yy1 = y1(:);

% histogram(y1,20,'Normalization','probability');
% xlim([-49,50]);
%histfit(y1,10);
%xlim([-49,50]);
x2=-79:80;
y2=xdld(:,2);
xx2 = x2(:);

% [f,xi] = ksdensity(y1)
% f=f';
% xi=xi';
% ft = fittype('(1/(w*sqrt(pi/2)))*exp(-2*((x-mu1)/w).^2)+(1/(w1*sqrt(pi/2)))*exp(-2*((x-mu2)/w1).^2)', 'independent', 'x', 'dependent', 'y');
% opts = fitoptions(ft);
% opts.Display = 'Off';
% opts.Lower = [0 0 0 0];
% opts.Lower = [ 0 0 0 0];
% opts.Upper = [0 30 0 20]
% opts.StartPoint = [0 1.1 0 1.1 ]
% fitobject = fit(xi,f,ft)
% 
[f1,xi1] = ksdensity(y2)
% plot (xi1,f1);
f1=f1';
xi1=xi1';
ft1 = fittype('(1/(w*sqrt(pi/2)))*exp(-2*((x-mu1)/w).^2)+(1/(w1*sqrt(pi/2)))*exp(-2*((x-mu2)/w1).^2)', 'independent', 'x', 'dependent', 'y');
opts = fitoptions(ft1);
opts.Display = 'Off';
opts.Lower = [0 0 0 0];
opts.Upper = [0 30 0 20];
opts.StartPoint = [0 1.1 0 1.1];
fitobject1 = fit(xi1,f1,ft1);


%%
% hold on
% scatter(num4_1(:,1),num4_1(:,2));
% hold on
% scatter(ld(:,1),ld(:,2));
% hold on
% %scatter(num4_2(:,1),num4_2(:,2),'r','x');
% %scatter(num2_2(:,1),num2_2(:,2),'y','x');
% %scatter(num3_2(:,1),num3_2(:,2),'b','x');
% axis([-200 150 38300 38900]);
% title('target');
% hold off
%%
% jd=[-123.284418284917,38542.3807399732;
%     -88.9698543555282,38521.2345214832;
%     -46.5062205269887,	38545.3291153920;
%     17.6661718732834,	38480.6281669956;
%     60.3245897714684,	38497.3735464576;
%     127.038652200587,	38495.1857325225;
%     -123.463149847361,	38577.4485609710;
%     -81.6988867840823,	38564.7914488592;
%     -48.9842391921875,	38578.7163817749;
%     12.6565549769615,	38602.7927222493;
%     76.3334533381268,	38595.1263903036;
%     99.3156424901725,	38566.3017705948;
%     -117.239629428277,	38685.6885507855;
%     -102.204691562103,	38741.8883138774;
%     -19.1059887623741,	38674.6115734957;
%     1.05952926426730,	38653.9147307884;
%     73.0534853715678,	38659.0454260991;
%     91.7489317112763,	38659.5234743262]
% for i=1:18
%    xdjl(i,1)=jd(i,1) - num4_1(i,1);
%    for j=1:18
%        xdjl(j,2)=jd(j,2) - num4_1(j,2);
%    end
% end



% x=ld(:,1);
% y=ld(:,2);
% u1 = -131.544;          %均值
% u2 = 38581.8;        
% sigma1 = 50;      %方差
% sigma2 = 100;
% rou = 0;     %相关系数
% mu=[-1,2];
% [X,Y]=meshgrid(x,y); % 产生网格数据并处理
% p = 1/(2*pi*sigma1*sigma2*sqrt(1-rou*rou)).*exp(-1/(2*(1-rou^2)).*[(X-u1).*(X-u1)/(sigma1*sigma1)-2*rou*(X-u1).*(Y-u2)/(sigma1*sigma2)+(Y-u2).*(Y-u2)/(sigma2*sigma2)]);
% figure(2)
% surf(X,Y,p)
% shading interp
% colorbar
% title('二维正态分布条件概率密度函数曲线');






