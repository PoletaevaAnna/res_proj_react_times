clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')
n = 4;
map = [0 0.4470 0.7410
    0.8500 0.3250 0.0980
    0.9290 0.6940 0.1250];


for d = 1:3
    drug = extract_drug_data(Data, d);
    [slope, q_c] = generate_slopes(drug, n);

%    yyaxis left
    plot(q_c, slope, 'LineWidth', 3, 'LineStyle', '-', 'Color', map(d, :))
    
    hold on
%     [c, quant_c, conf_slope] = percent_high_conf(drug, n);
%     yyaxis right
%     plot(quant_c, conf_slope, 'LineStyle', '--', 'Color', map(d, :))
    hold on
end
title('Difference between error and correct reaction time')
xlabel('Delta contrast')
% yyaxis left
ylabel('Reaction time difference, s')
% yyaxis right
% ylabel('Confidence level difference, %')
% [slp_all, q_c_all] = generate_slopes(Data, n);
% plot(q_c_all, slp_all, 'LineStyle', '-.')
legend('drug 1', 'drug 2', 'drug 3')
