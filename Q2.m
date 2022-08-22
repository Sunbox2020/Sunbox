clc
clear 
filename = '附件4带标签.xlsx';  
[target,txt1_1,raw1_1] = xlsread(filename,'目标点');
[rt,txt1_2,raw1_2] = xlsread(filename,'落点');
jd=[-140.210216306886,	38480.8565822262;
    -91.8209775733651,	38505.7203542910;
    -26.2781698822636,	38491.8521274214;
    14.2088343860230,	38500.5990219281;
    59.6374108798871,	38469.1736202499;
    98.7394248488003,	38444.6462969518;
    -150.533848994281,	38594.8025400972;
    -91.1707510700490,	38581.6775095581;
    -33.4575466601126,	38557.4900696764;
    10.2873876129346,	38575.6870877689;
    47.8909853658966,	38565.9246684307;
    99.4281474582986,	38622.6659925492;
    -143.495402863269,	38704.8233656868;
    -80.1974926252788,	38683.6160684749;
    -54.1751111733246,	38700.0723135831;
    26.6637361067188,	38699.9375679687;
    67.2712342502062,	38713.8195766340;
    95.5770349063836,	38709.3057646180];
 for i=1:507
    if(rt(i,3)==1)
        s1(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==2)
        s2(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==3)
        s3(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==4)
        s4(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==5)
        s5(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==6)
        s6(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==7)
        s7(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==8)
        s8(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==9)
        s9(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==10)
        s10(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==11)
        s11(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==12)
        s12(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==13)
        s13(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==14)
        s14(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==15)
        s15(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==16)
        s16(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==17)
        s17(i,1:2)=rt(i,1:2)
    elseif(rt(i,3)==18)
        s18(i,1:2)=rt(i,1:2)
    else
        disp('None')
    end
 end
s1(all(s1==0,2),:)=[];
s2(all(s2==0,2),:)=[];  
s3(all(s3==0,2),:)=[];
s4(all(s4==0,2),:)=[];
s5(all(s5==0,2),:)=[];
s6(all(s6==0,2),:)=[];
s7(all(s7==0,2),:)=[];
s8(all(s8==0,2),:)=[];
s9(all(s9==0,2),:)=[];
s10(all(s10==0,2),:)=[];
s11(all(s11==0,2),:)=[];
s12(all(s12==0,2),:)=[];
s13(all(s13==0,2),:)=[];
s14(all(s14==0,2),:)=[];
s15(all(s15==0,2),:)=[];
s16(all(s16==0,2),:)=[];
s17(all(s17==0,2),:)=[];
s18(all(s18==0,2),:)=[];

jd1=jd(1,:);
jd2=jd(2,:);
jd3=jd(3,:);
jd4=jd(4,:);
jd5=jd(5,:);
jd6=jd(6,:);
jd7=jd(7,:);
jd8=jd(8,:);
jd9=jd(9,:);
jd10=jd(10,:);
jd11=jd(11,:);
jd12=jd(12,:);
jd13=jd(13,:);
jd14=jd(14,:);
jd15=jd(15,:);
jd16=jd(16,:);
jd17=jd(17,:);
jd18=jd(18,:);

for i=1:18
   rejd(i,1)=jd(i,1) - target(i,1);
   for j=1:18
       rejd(j,2)=jd(j,2) - target(j,2);
   end
end
for k=1:18
    dx(k,1)=sqrt(rejd(k,1)*rejd(k,1));
    dy(k,1)=sqrt(rejd(k,2)*rejd(k,2));
end

% scatter(jd(:,1),jd(:,2));
% hold on
% plot(s1(:,1),s1(:,2),'r.','MarkerSize',14);
% hold on
for i=1:31
   re1(i,1)=s1(i,1) - jd1(1,1);
   for j=1:31
       re1(j,2)=s1(j,2) - jd1(1,2);
   end
end
for k=1:31
    d1(k,1)=sqrt(re1(k,1)*re1(k,1)+re1(k,2)*re1(k,2));
end

for i=1:14
   re2(i,1)=s2(i,1) - jd2(1,1);
   for j=1:14
       re2(j,2)=s2(j,2) - jd2(1,2);
   end
end
for k=1:14
    d2(k,1)=sqrt(re2(k,1)*re2(k,1)+re2(k,2)*re2(k,2));
end

for i=1:36
   re3(i,1)=s3(i,1) - jd3(1,1);
   for j=1:36
       re3(j,2)=s3(j,2) - jd3(1,2);
   end
end
for k=1:36
    d3(k,1)=sqrt(re3(k,1)*re3(k,1)+re3(k,2)*re3(k,2));
end

for i=1:19
   re4(i,1)=s4(i,1) - jd4(1,1);
   for j=1:19
       re4(j,2)=s4(j,2) - jd4(1,2);
   end
end
for k=1:19
    d4(k,1)=sqrt(re4(k,1)*re4(k,1)+re4(k,2)*re4(k,2));
end

for i=1:27
   re5(i,1)=s5(i,1) - jd5(1,1);
   for j=1:27
       re5(j,2)=s5(j,2) - jd5(1,2);
   end
end
for k=1:27
    d5(k,1)=sqrt(re5(k,1)*re5(k,1)+re5(k,2)*re5(k,2));
end

for i=1:17
   re6(i,1)=s6(i,1) - jd6(1,1);
   for j=1:17
       re6(j,2)=s6(j,2) - jd6(1,2);
   end
end
for k=1:17
    d6(k,1)=sqrt(re6(k,1)*re6(k,1)+re6(k,2)*re6(k,2));
end

for i=1:15
   re7(i,1)=s7(i,1) - jd7(1,1);
   for j=1:15
       re7(j,2)=s7(j,2) - jd7(1,2);
   end
end
for k=1:15
    d7(k,1)=sqrt(re7(k,1)*re7(k,1)+re7(k,2)*re7(k,2));
end

for i=1:42
   re8(i,1)=s8(i,1) - jd8(1,1);
   for j=1:42
       re8(j,2)=s8(j,2) - jd8(1,2);
   end
end
for k=1:42
    d8(k,1)=sqrt(re8(k,1)*re8(k,1)+re8(k,2)*re8(k,2));
end


for i=1:18
   re9(i,1)=s9(i,1) - jd9(1,1);
   for j=1:18
       re9(j,2)=s9(j,2) - jd9(1,2);
   end
end
for k=1:18
    d9(k,1)=sqrt(re9(k,1)*re9(k,1)+re9(k,2)*re9(k,2));
end

for i=1:52
   re10(i,1)=s10(i,1) - jd10(1,1);
   for j=1:52
       re10(j,2)=s10(j,2) - jd10(1,2);
   end
end
for k=1:52
    d10(k,1)=sqrt(re10(k,1)*re10(k,1)+re10(k,2)*re10(k,2));
end

for i=1:34
   re11(i,1)=s11(i,1) - jd11(1,1);
   for j=1:34
       re11(j,2)=s11(j,2) - jd11(1,2);
   end
end
for k=1:34
    d11(k,1)=sqrt(re11(k,1)*re11(k,1)+re11(k,2)*re11(k,2));
end

for i=1:1
   re12(i,1)=s12(i,1) - jd12(1,1);
   for j=1:1
       re12(j,2)=s12(j,2) - jd12(1,2);
   end
end
for k=1:1
    d12(k,1)=sqrt(re12(k,1)*re12(k,1)+re12(k,2)*re12(k,2));
end

for i=1:74
   re13(i,1)=s13(i,1) - jd13(1,1);
   for j=1:74
       re13(j,2)=s13(j,2) - jd13(1,2);
   end
end
for k=1:74
    d13(k,1)=sqrt(re13(k,1)*re13(k,1)+re13(k,2)*re13(k,2));
end

for i=1:32
   re14(i,1)=s14(i,1) - jd14(1,1);
   for j=1:32
       re14(j,2)=s14(j,2) - jd14(1,2);
   end
end
for k=1:32
    d14(k,1)=sqrt(re14(k,1)*re14(k,1)+re14(k,2)*re14(k,2));
end

for i=1:13
   re15(i,1)=s15(i,1) - jd15(1,1);
   for j=1:13
       re15(j,2)=s15(j,2) - jd15(1,2);
   end
end
for k=1:13
    d15(k,1)=sqrt(re15(k,1)*re15(k,1)+re15(k,2)*re15(k,2));
end

for i=1:23
   re16(i,1)=s16(i,1) - jd16(1,1);
   for j=1:23
       re16(j,2)=s16(j,2) - jd16(1,2);
   end
end
for k=1:23
    d16(k,1)=sqrt(re16(k,1)*re16(k,1)+re16(k,2)*re16(k,2));
end

for i=1:22
   re17(i,1)=s17(i,1) - jd17(1,1);
   for j=1:22
       re17(j,2)=s17(j,2) - jd17(1,2);
   end
end
for k=1:22
    d17(k,1)=sqrt(re17(k,1)*re17(k,1)+re17(k,2)*re17(k,2));
end

for i=1:36
   re18(i,1)=s18(i,1) - jd18(1,1);
   for j=1:36
       re18(j,2)=s18(j,2) - jd18(1,2);
   end
end
for k=1:36
    d18(k,1)=sqrt(re18(k,1)*re18(k,1)+re18(k,2)*re18(k,2));
end

s1_x=s1(:,1);
s2_x=s2(:,1);
s3_x=s3(:,1);
s4_x=s4(:,1);
s5_x=s5(:,1);
s6_x=s6(:,1);
s7_x=s7(:,1);
s8_x=s8(:,1);
s9_x=s9(:,1);
s10_x=s10(:,1);
s11_x=s11(:,1);
s12_x=s12(:,1);
s13_x=s13(:,1);
s14_x=s14(:,1);
s15_x=s15(:,1);
s16_x=s16(:,1);
s17_x=s17(:,1);
s18_x=s18(:,1);

s1_y=s1(:,2);
s2_y=s2(:,2);
s3_y=s3(:,2);
s4_y=s4(:,2);
s5_y=s5(:,2);
s6_y=s6(:,2);
s7_y=s7(:,2);
s8_y=s8(:,2);
s9_y=s9(:,2);
s10_y=s10(:,2);
s11_y=s11(:,2);
s12_y=s12(:,2);
s13_y=s13(:,2);
s14_y=s14(:,2);
s15_y=s15(:,2);
s16_y=s16(:,2);
s17_y=s17(:,2);
s18_y=s18(:,2);

reall=[re1;re2;re3;re5;re6;re7;re8;re9;re10;re11;re12;re13;re14;re14;re15;re16;re17;re18]
sxall=[s1_x;s2_x;s3_x;s4_x;s5_x;s6_x;s7_x;s8_x;s9_x;s10_x;s11_x;s12_x;s13_x;s14_x;s15_x;s16_x;s17_x;s18_x];
syall=[s1_y;s2_y;s3_y;s4_y;s5_y;s6_y;s7_y;s8_y;s9_y;s10_y;s11_y;s12_y;s13_y;s14_y;s15_y;s16_y;s17_y;s18_y];


[f1,s2x] = ksdensity(syall);
% 
% plot (s2x,f1);
% xlabel('x轴','FontName','宋体','FontSize',8,'LineWidth',2);
% ylabel('概率密度','FontName','宋体','FontSize',8,'LineWidth',2);
% title('关于距离位正态分布概率密度图像');

f1=f1'*10;
s2x=s2x';
ft1 = fittype('(1/(w*sqrt(pi/2)))*exp(-2*((x-mu1)/w).^2)', 'independent', 'x', 'dependent', 'y');
opts = fitoptions(ft1);
opts.Display = 'Off';
opts.Lower = [0 20];
opts.Upper = [0 60]
opts.StartPoint = [0 1.1]
fitobject1 = fit(s2x,f1,ft1)

x=reall(:,1);
y=reall(:,2);
u1 = 0;          %均值
u2 = 0;        
sigma1 =7.86;      %方差
sigma2 = 9.561;
rou = 0;     %相关系数
mu=[0,0];
[X,Y]=meshgrid(x,y); % 产生网格数据并处理
p = 1/(2*pi*sigma1*sigma2*sqrt(1-rou*rou)).*exp(-1/(2*(1-rou^2)).*[(X-u1).*(X-u1)/(sigma1*sigma1)-2*rou*(X-u1).*(Y-u2)/(sigma1*sigma2)+(Y-u2).*(Y-u2)/(sigma2*sigma2)]);
figure(2)
surf(X,Y,p)
shading interp
colorbar
xlabel('方向位','FontName','宋体','FontSize',8,'LineWidth',2);
ylabel('距离位','FontName','宋体','FontSize',8,'LineWidth',2);
zlabel('概率密度','FontName','宋体','FontSize',8,'LineWidth',2)
title('二维正态分布条件概率密度函数曲线');

        
        