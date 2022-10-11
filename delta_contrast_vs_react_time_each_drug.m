clear
load('Data_for_anna.mat')
open('Data_for_anna.mat')
n = 4;

figure()
t = tiledlayout(1,3);
t.TileSpacing = 'compact';
for d = 1:3
    nexttile
    drug = extract_drug_data(Data, d);
   % yyaxis left
    plot_react_times_and_sem_quantiles(drug, n)
    title('Drug', num2str(d))
    if (d == 2)|| (d == 3)
        ax = gca;
        ax.YTickLabel = [];

% Commented part was used for plotting fraction of high confidence on the same plot.

%     else
%         ylabel('Reaction time, s', 'FontSize', 10)
    end
%     yyaxis right
%     plot_confidence_for_quantiles(drug, n)
%     ylim([0 1])
%     if (d == 1)||(d == 2)
%         ax = gca;
%         ax.YTickLabel = [];
%     else
%         ylabel('Percent of high confidence', 'FontSize', 10)
%     end

end
ylabel(t, 'Reaction time, s')
xlabel(t, 'Delta contrast')

legend('correct', 'error')
