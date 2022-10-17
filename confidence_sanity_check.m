clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')

[cfd, cfd_corr, cfd_err] = cfd_sanity_check(Data);
cfd_method_1 = [cfd; cfd_corr; cfd_err];

[cfd1, cfd1_corr, cfd1_err] = general_percent_high_conf(Data);
cfd_method_2 = [cfd1; cfd1_corr; cfd1_err];

bar_names = categorical({'all', 'correct', 'error'});
bar(bar_names, cfd_method_1, 'FaceAlpha', 0.15)

hold on
bar(bar_names, cfd_method_2, 'FaceAlpha', 0.15)
hold off