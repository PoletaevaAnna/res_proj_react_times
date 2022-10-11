clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')

plot_react_times_and_sem_quantiles(Data, 4)
xlabel('Delta contrast')
ylabel ('Reaction time, s')
title('Reaction time for all drugs')
