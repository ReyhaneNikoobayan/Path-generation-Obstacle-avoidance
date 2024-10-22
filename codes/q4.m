close all
clc
clear
B={{2,1,[4;12],[10;18],[12;16],[6;10]},{2,1,[13;16],[17;16],[19;12],[15;8],[11;12]},{2,1,[9;10],[12;4],[6;4]},{2,1,[17.5;10],[17.5;8]}};
xs=[1;10];
xf=[22;12];
eta=1;
P=Path_generator2(xs,xf,eta,B);
obs1=polyshape([4 10 12 6],[12 18 16 10]);
obs2=polyshape([13 17 19 15 11],[16 16 12 8 12]);
obs3=polyshape([9 12 6],[10 4 4]);

plot(obs1);
hold on
plot(obs2);
hold on
plot(obs3);
hold on
plot([17.5 17.5],[10 8],'LineWidth',2)

hold on
plot(P(1,:),P(2,:),'blue','LineWidth',2)
hold on
plot([1,22],[10,12],'ro','LineWidth',2)






