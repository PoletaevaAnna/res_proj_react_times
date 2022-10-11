clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')

drugs_medians = [];
drugs_sems = [];
for d = 1:3
    drug = extract_drug_data(Data, d);
    [RT_data_drug, RTall, RTcorr, RTerr] = RT_data_multiple_subj(drug);
    drug_sem = SEM_bars(RT_data_drug);
    drugs_medians(d, 1:3) = [RTall, RTcorr, RTerr];
    drugs_sems(d, 1:3) = drug_sem;
end
figure()
bar_names = categorical({'drug 1', 'drug 2', 'drug 3'});
b = bar(bar_names, drugs_medians, 'FaceAlpha', 0.9);
grn = [0.4660 0.6740 0.1880];
rd = [0.6350 0.0780 0.1840];
b(2).FaceColor = grn;
b(3).FaceColor = rd;

hold on
% This part is to extract center of each bar to be able to place SEMs
% correctly. Bar centers are stored in x_coord.
[ngroups, nbars] = size(drugs_sems);
x_coord = nan(nbars, ngroups);
for i = 1:nbars
    x_coord(:, i) = b(i).XEndPoints;
end

sembar = errorbar(x_coord, drugs_medians, drugs_sems, 'LineStyle', ...
    'none', 'LineWidth',2, 'CapSize', 7, 'Color', 'k');
ylim([0 0.5])
ylabel('Reaction times, s')
title('Reaction times for different drugs')
hold off
legend({'all', 'correct', 'error'}, 'Location', 'eastoutside')

% This part is to plot only all trials, without separating on
% all-correct-error.

figure()
all_meds = drugs_medians(:, 1);
all_sems = drugs_sems(:, 1);
bar(bar_names, all_meds)
hold on
errorbar(bar_names, all_meds, all_sems, 'LineStyle', ...
    'none', 'LineWidth',2, 'CapSize', 7, 'Color', 'k')
ylim([0 0.5])
ylabel('Reaction time, s')
title('Mean reaction times for different drugs')


