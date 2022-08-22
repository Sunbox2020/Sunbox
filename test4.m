% 随机变量 z
clc;clear
target=xlsread('附件3.xlsx');
zidan=xlsread('附件3.xlsx',2);
canshu=xlsread('附件3.xlsx',3);
x_zidan(:,1)=zidan(:,1)-canshu(5);
x_zidan(:,2)=zidan(:,2)-canshu(6);
D=x_zidan;
[m n]=size(D);
% y=[2*ones(length(1:8),1);
%    ones(length(9:21),1);
%    2*ones(length(22:30),1);];% 注意分类的标签
k=18;% 簇类个数
echo=1;% 迭代次数
% 高斯混合分布参数初始化
% 初始均值，选取初始的簇类中心点
for i=1:k
    gauss(i).mu=target(i,:);
end
for i=1:k
    gauss(i).sigma=diag([canshu(1)*canshu(1)+canshu(3)*canshu(3),canshu(2)*canshu(2)+canshu(4)*canshu(4)]);
    gauss(i).a=1/k;
end
while(echo~=0)
    % 1.计算后验概率
    for j=1:m
        pz_den=0;% 求和后验概率的项先清零
        x=D(j,:);
        for i=1:k
            % 先验概率
            px(j,i)=mypro(x,gauss(i));
            % 全概率
            pz_den=pz_den+gauss(i).a*px(j,i);
        end
        % 后验概率
        for i=1:k
            pz(j,i)=(gauss(i).a*px(j,i))/pz_den;
        end
    end
    sum_pz=sum(pz);
    % 2.更新高斯分布参数
    for i=1:k
        % 更新新的均值向量
        gauss(i).mu=pz(:,i)'*D./sum_pz(:,i);
        % 更新新的协方差矩阵
        gauss(i).sigma=(pz(:,i).*(D-gauss(i).mu))'*(D-gauss(i).mu)/(sum_pz(:,i));
        % 更新新的混合系数
        gauss(i).a=sum_pz(:,i)/m;
    end
    echo=echo-1;
end
[gamma_m,~]=size(pz);
for j=1:k
    C{j}=[];
end
for i=1:gamma_m
    [~,index_max]=max(pz(i,:));
    x=D(i,:);
    C{index_max}=[C{index_max};x];
end
% marksize=12;
% figure(1)
% hold on
% plot(D(y==1,1),D(y==1,2),'r+','LineWidth',2,'MarkerSize',marksize)
% plot(D(y==2,1),D(y==2,2),'r_','LineWidth',2,'MarkerSize',marksize)
% plot(C{1}(:,1),C{1}(:,2),'g^','LineWidth',2,'MarkerSize',marksize)
% plot(C{2}(:,1),C{2}(:,2),'bo','LineWidth',2,'MarkerSize',marksize)
% plot(C{3}(:,1),C{3}(:,2),'kx','LineWidth',2,'MarkerSize',marksize)
% legend('正样本','负样本','C1类','C2类','C3类')
% title('密度特征量高斯混合分类')
%% 先验函数
function p=mypro(x,gauss)
    [~,n]=size(gauss.mu);
    nem=((2*pi)^(n/2))*sqrt(det(gauss.sigma));
    den=exp(-0.5*((x-gauss.mu)*pinv(gauss.sigma)*(x-gauss.mu)'));
    p=den/nem;
end
