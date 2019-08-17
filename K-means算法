% 用聚类法确定葡萄酒分级
clc; 
clear; 
close;
%% 需要聚类的数据
% 红葡萄酒质量评分数据
 A=[65.4	77.15	77.5	69.9	72.7	69.25	68.4	69.15	79.85	71.5	65.85	61.1	71.7	72.8	62.2	72.4	76.9	62.75	75.6	77.5	74.65	74.4	81.35	74.75	68.7	72.9	72.25]; 
% 白葡萄酒质量评分数据
% A=[79.95	75	76.9	78.15	76.25	71.95	75.85	71.35	76.65	77.05	71.85	67.85	69.9	74.55	75.4	70.65	79.55	74.9	74.3	77.2	77.8	75.2	76.65	74.7	78.3	77.8	70.9	80.45];
%% 用k-Means聚类法确定最佳的聚类数
X=A';
numC=15;
for i=1:numC
kindx = kmeans(X,i);
silh = silhouette(X,kindx); %计算轮廓值
silh_m(i) = mean(silh); %计算平均轮廓值
end
figure
plot(1:numC,silh_m,'o-')
xlabel('类别数')
ylabel('平均轮廓值')
title('不同类别对应的平均轮廓值')
% 绘制2至5类时的轮廓值分布图
figure
for i=2:5
kindx = kmeans(X,i);
subplot(2,2,i-1);
[~,h] = silhouette(X,kindx); 
title([num2str(i), '类时的轮廓值 '])
snapnow
xlabel('轮廓值');
ylabel('类别数');
end 
%% 聚类结果显示
% idx = kmeans(A',4);
idx = kmeans(A',3);
C1 = find(idx==1);
C2 = find(idx==2);
C3 = find(idx==3);
% C4 = find(idx==4);
% figure
% F1 = plot(find(idx==1),A(idx==1),'r:o',...
%           find(idx==2),A(idx==2),'b:o',...
%           find(idx==3),A(idx==3),'k:o',...
%           find(idx==4),A(idx==4),'g:d');
figure
F1 = plot(find(idx==1),A(idx==1),'r:o',...
          find(idx==2),A(idx==2),'b:o',...
          find(idx==3),A(idx==3),'k:o');
