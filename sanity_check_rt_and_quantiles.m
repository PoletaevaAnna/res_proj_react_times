clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')
n = 4;
% [RT_corr, RT_err, quant_cntr, sems] = react_times_to_quantiles_with_sems(Data, n);
% plot(quant_cntr, RT_corr)
% hold on
% plot(quant_cntr, RT_err)
% hold on
% errorbar(quant_cntr, RT_corr, sems(1, :))
% hold on
% errorbar(quant_cntr, RT_err, sems(2, :))

plot_react_times_and_sem_quantiles(Data, n)
title('Reaction times for all drugs')
xlabel('Reaction time, s')
ylabel('Delta contrast')
legend('correct', 'error')
