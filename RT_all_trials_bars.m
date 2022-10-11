clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')

[RT_table, RTall, RTcorr, RTerr] = RT_data_multiple_subj(Data);
means = [RTall, RTcorr, RTerr];
sems = SEM_bars(RT_table);

grn = [0.4660 0.6740 0.1880];
rd = [0.6350 0.0780 0.1840];

figure()
bar_names = categorical({'all', 'correct', 'error'});
b1 = bar(bar_names(1), means(1), 'FaceColor', 'flat', 'CData', [0 0.4470 0.7410]);
hold on
b2 = bar(bar_names(2), means(2), 'FaceColor', 'flat', 'CData', grn);
hold on
b3 = bar(bar_names(3), means(3), 'FaceColor', 'flat', 'CData', rd);
hold on 
std_bar = errorbar(bar_names, means, sems, 'LineStyle', 'none', 'LineWidth',2, 'CapSize', 7, 'Color', 'k');
ylabel('Reaction time, s')
title('Reaction times for all subjects in all trials')
hold off
% hold off
% legend('all', 'correct', 'error')
%histogram(Data.choice_rt(~isnan(Data.correct)),nbins)
% hold on
% histogram(Data.choice_rt(Data.correct == 1),nbins, 'FaceColor', grn, 'FaceAlpha', 0.3)
% hold on
% histogram(Data.choice_rt(Data.correct == 0), nbins, 'FaceColor', rd, 'FaceAlpha', 0.3)
% title('Reaction time distributions')
% xlabel('Reaction time, s')
% hold off
% legend('all', 'correct', 'error')
% 
