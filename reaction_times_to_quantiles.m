% Deltas for all, correct and error trials are extracted. Then, I
% calculated quantiles based on delta of all trials (quantile borders
% derived this way will be used as quantile borders for correct and for
% error trials).
% Histcounts [bins] generates indeces for each value - the index is the
% quantile number. The way values are separated is defined by quantile
% borders (and they were previously derived for all deltas).
% Finally, medians of reaction times for trials that fall in each quantile
% are found. Also for plotting, quantile center is defined as a median of
% all delta values that fall into the quantile.

function [RT_med_correct, RT_med_error, quant_centers] = reaction_times_to_quantiles(subj, n_quant)

    [real_delta, real_delta_correct, real_delta_error] = extract_delta_contrast(subj);
    react_times_correct = subj.choice_rt(subj.correct == 1);
    react_times_error = subj.choice_rt(subj.correct == 0);

    qntls = 0: 1/n_quant : 1;
    quantile_border = quantile(real_delta, qntls);

    [~, ~, bins_corr]= histcounts(real_delta_correct, quantile_border);
    [~, ~, bins_err] = histcounts(real_delta_error, quantile_border);
    [~, ~, bins_] = histcounts(real_delta, quantile_border);

    quant_centers = [];
    RT_med_correct = [];
    RT_med_error = [];
    for i = 1:n_quant
        RT_med_correct = [RT_med_correct, median(react_times_correct(bins_corr == i))];
        RT_med_error = [RT_med_error, median(react_times_error(bins_err == i))];
        quant_centers(i) = median(real_delta(bins_ == i));
    end
end

