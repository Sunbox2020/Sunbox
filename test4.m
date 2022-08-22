% ������� z
clc;clear
target=xlsread('����3.xlsx');
zidan=xlsread('����3.xlsx',2);
canshu=xlsread('����3.xlsx',3);
x_zidan(:,1)=zidan(:,1)-canshu(5);
x_zidan(:,2)=zidan(:,2)-canshu(6);
D=x_zidan;
[m n]=size(D);
% y=[2*ones(length(1:8),1);
%    ones(length(9:21),1);
%    2*ones(length(22:30),1);];% ע�����ı�ǩ
k=18;% �������
echo=1;% ��������
% ��˹��Ϸֲ�������ʼ��
% ��ʼ��ֵ��ѡȡ��ʼ�Ĵ������ĵ�
for i=1:k
    gauss(i).mu=target(i,:);
end
for i=1:k
    gauss(i).sigma=diag([canshu(1)*canshu(1)+canshu(3)*canshu(3),canshu(2)*canshu(2)+canshu(4)*canshu(4)]);
    gauss(i).a=1/k;
end
while(echo~=0)
    % 1.����������
    for j=1:m
        pz_den=0;% ��ͺ�����ʵ���������
        x=D(j,:);
        for i=1:k
            % �������
            px(j,i)=mypro(x,gauss(i));
            % ȫ����
            pz_den=pz_den+gauss(i).a*px(j,i);
        end
        % �������
        for i=1:k
            pz(j,i)=(gauss(i).a*px(j,i))/pz_den;
        end
    end
    sum_pz=sum(pz);
    % 2.���¸�˹�ֲ�����
    for i=1:k
        % �����µľ�ֵ����
        gauss(i).mu=pz(:,i)'*D./sum_pz(:,i);
        % �����µ�Э�������
        gauss(i).sigma=(pz(:,i).*(D-gauss(i).mu))'*(D-gauss(i).mu)/(sum_pz(:,i));
        % �����µĻ��ϵ��
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
% legend('������','������','C1��','C2��','C3��')
% title('�ܶ���������˹��Ϸ���')
%% ���麯��
function p=mypro(x,gauss)
    [~,n]=size(gauss.mu);
    nem=((2*pi)^(n/2))*sqrt(det(gauss.sigma));
    den=exp(-0.5*((x-gauss.mu)*pinv(gauss.sigma)*(x-gauss.mu)'));
    p=den/nem;
end
