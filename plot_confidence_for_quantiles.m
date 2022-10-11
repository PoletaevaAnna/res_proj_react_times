% The function puts bars of high confidence percentage in each quantile.

function plot_confidence_for_quantiles(subj, n_quant)
    [high_conf, q_c, ~, ~] = percent_high_conf(subj, n_quant);
    grn = [0.4660 0.6740 0.1880];
    rd = [0.6350 0.0780 0.1840];
    b = bar(q_c, high_conf, 'FaceAlpha', 0.15);
    b(1).FaceColor = grn;
    b(2).FaceColor = rd;
end