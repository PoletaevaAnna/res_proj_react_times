clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')
n = 4;
all_data = each_trial_to_quantiles(Data, n);

% together = [];

figure()

for h = 1: height(all_data(:, 1))
    subplot(4, 5, h)
    plot(all_data(h, 2:5), all_data(h, 6:9),'Color', "#77AC30", 'Linewidth', 3)
    hold on
    plot(all_data(h, 2:5), all_data(h, 10:13),'Color', "#A2142F", 'Linewidth', 3)
    ttl = ['Subject ', num2str(all_data(h, 1))];
    title(ttl)
    xlabel('delta contrast')
    ylabel('reaction time, s')
    hold off
end
%     

figure()
together_contrast_left = mean(Data.contrast_left, 2);
together_contrast_right = mean(Data.contrast_right, 2);
together_correct = Data.correct;
real_delta_together = abs(together_contrast_right - together_contrast_left);
react_times_together = Data.choice_rt;

ind_correct_ = find(together_correct == 1);
ind_error_ = find(together_correct == 0);

real_delta_correct_ = real_delta_together(ind_correct_);
react_times_correct_ = react_times_together(ind_correct_);
real_delta_error_ = real_delta_together(ind_error_);
react_times_error_ = react_times_together(ind_error_);

n = 4;
qntls = 0: 1/n: 1;
quantile_border_ = quantile(real_delta_together, qntls);

[N_corr_tog, edges_corr_tog, bins_corr_tog]= histcounts(real_delta_correct_, quantile_border_);
[N_err_tog, edges_err_tog, bins_err_tog] = histcounts(real_delta_error_, quantile_border_);
[N__, edges__, bins__] = histcounts(real_delta_together, quantile_border_);

quant_centers_ = [];
RT_med_correct_ = [];
RT_med_error_ = [];
SEMs = zeros(2,4);
for i = 1:n
    bin_indeces_c_ = find(bins_corr_tog == i);
    RT_median_corr = median(react_times_correct_(bin_indeces_c_));
    RT_med_correct_ = [RT_med_correct_, RT_median_corr];
    bin_indeces_e_ = find(bins_err_tog == i);
    RT_median_err = median(react_times_error_(bin_indeces_e_));
    RT_med_error_ = [RT_med_error_, RT_median_err];
   
    bn__ind = find(bins__== i);
    quant_centers_(i) = median(real_delta_together(bn__ind));

    SEMs(1, i) = std(all_data(:, 5+i))/sqrt(height(all_data(:, 1)));
    SEMs(2, i) = std(all_data(:, 9+i))/sqrt(height(all_data(:, 1)));
end

plot(quant_centers_, mean(RT_med_correct_, 1),'Color', "#77AC30", 'Linewidth', 3)
hold on
plot(quant_centers_, mean(RT_med_error_, 1), 'Color', "#A2142F", 'Linewidth', 3)
hold on
sem_1_bar = errorbar(quant_centers_, mean(RT_med_correct_, 1), SEMs(1, :), 'Color', 'green', ...
    'CapSize', 12, 'LineWidth', 2, 'LineStyle', 'none');
hold on
sem_2_bar = errorbar(quant_centers_, mean(RT_med_error_, 1), SEMs(2, :), 'Color', 'red', ...
    'CapSize', 12, 'LineWidth', 2, 'LineStyle', 'none');
xlabel('delta contrast')
ylabel('reaction time, s')
% xlim([0 0.16])
% ylim([0.3 0.6])
title('Reaction times for all drugs')
hold off
legend('correct', 'error')

% 
% 
% std_bar = errorbar(bar_names, react_times_mean, STDs);
% std_bar.LineStyle = 'none';
