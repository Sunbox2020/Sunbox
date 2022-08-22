%% Kmeans�㷨
% ���룺
% data ����Ĳ��������ŵ�����
% K ����һ���ֶ�����
% iniCentriods ����ָ����ʼ��������
% iterations ��������

% �����
% Idx ���صķ�����
% centroids ÿһ�������
% Distance �����ܾ���

 
function [Idx,centroids,Distance]=Kmeans(data,K,iniCentriods,iterations)
[numOfData,numOfAttr]=size(data); % numOfData�����ݸ�����numOfAttr������ά��
centroids=iniCentriods;
%% ����
for iter=1:iterations
    pre_centroids=centroids;% ��һ����õ�����λ��
    
    tags=zeros(numOfData,K);
    %% Ѱ��������ģ���������
    for i=1:numOfData
        D=zeros(1,K);% ÿ�����ݵ���ÿ���������ĵı�׼��
        Dist=D;
        
        % ����ÿ���㵽ÿ�����ĵ�ı�׼��
        for j=1:K
            Dist(j)=norm(data(i,:)-centroids(j,:),2);
        end
        
        [minDistance,index]=min(Dist);% Ѱ�Ҿ�����С���������
        tags(i,index)=1;% �����С����������λ�ã����
    end
    
    
    %% ȡ��ֵ���¾������ĵ�
    for i=1:K
        if sum(tags(:,i))~=0
            % δ���ֿ��࣬�����ֵ��Ϊ��һ��������
            for j=1:numOfAttr
                centroids(i,j)=sum(tags(:,i).*data(:,j))/sum(tags(:,i));
            end
        else % ������ֿ��࣬�����ݼ������ѡ��һ������Ϊ����
            randidx = randperm(size(data, 1));
            centroids(i,:) = data(randidx(1),:);
            tags(randidx,:)=0;
            tags(randidx,i)=1;
        end
    end
    
   
    if sum(norm(pre_centroids-centroids,2))<0.001  % ���ϵ���ֱ��λ�ò��ٱ仯
        break;
    end
    
    
end

%% ����������
Distance=zeros(numOfData,1);
Idx=zeros(numOfData,1);
for i=1:numOfData
    D=zeros(1,K);% ÿ�����ݵ���ÿ���������ĵı�׼��
    Dist=D;
    % ����ÿ���㵽ÿ�����ĵ�ı�׼��
    for j=1:K
        Dist(j)=norm(data(i,:)-centroids(j,:),2);
    end
    
    [distance,idx]=min(Dist);% Ѱ�Ҿ�����С���������
    distance=Dist(idx);
    
    Distance(i)=distance;
    Idx(i)=idx;
end
Distance=sum(Distance,1);% ���������ܾ���
end
