% Plots values that were obtained from a fucntion
% normalised_values_from_RT_hist. Tiledlayout is to be able to change
% spaces in between graphs. Each part is plotted separately. On the upper 2
% parts, the xlabels are removed. All the plots have a common x axis
% labelling and they have the same ylim to make them easily comparable.
function fgr = normalised_distr_plot(all, corr, err, bar_pos)
    figure()
    fgr = tiledlayout(3, 1);
    fgr.TileSpacing = 'tight';
    grn = [0.4660 0.6740 0.1880];
    rd = [0.6350 0.0780 0.1840];
    nexttile
    bar1 = bar(bar_pos, all, 'FaceAlpha', 0.3);
    ax = gca;
    ax.XTickLabel = [];
    ylim([0 0.15])
    title('Reaction time distribution, all trials')
    nexttile
    
    bar2 = bar(bar_pos,corr, 'FaceColor', grn, 'FaceAlpha', 0.3);
    ylim([0 0.15])
    ax = gca;
    ax.XTickLabel = [];
    title('Reaction time distribution, correct trials')
    nexttile
    
    bar3 = bar(bar_pos,err, 'FaceColor', rd, 'FaceAlpha', 0.3);
    ylim([0 0.15])
    title('Reaction time distribution, error trials')
    xlabel('Reaction time, s')
end