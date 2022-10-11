clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')

nbins = 50;

[tr_num1, tr_num2, tr_num3, bar_positions] = normalise_values_from_RT_hist(Data, nbins);
br_plt = normalised_distr_plot(tr_num1, tr_num2, tr_num3, bar_positions);