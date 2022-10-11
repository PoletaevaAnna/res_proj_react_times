% Similarly to finding reaction times in different quantiles (quantiles
% defined by delta contrast), confidence can be found.
% Since the confidence is defined as either high (2) or low(1), the
% fraction of high confidence can be found by averaging the confidence
% column and substracting 1. Confidence is kind of a binary variable, that
% is instead of being 0 and 1 is 0+1 and 1+1. Therefore, mean allows to
% access the fraction of 1s - or in this case 2s.
% Confidence slope is difference between confidence of error trials and
% confidence of correct trials in each quantile. I further use it to compare
% reported confidence difference to difference of reaction times in error
% and correct (reaction times being a proxy of confidence).
function [conf_perc, quant_centers, conf_slope] = percent_high_conf(subj, n_quant)
    [real_delta, real_delta_correct, real_delta_error] = extract_delta_contrast(subj);
    confidence_correct = subj.confidence(subj.correct == 1);
    confidence_error = subj.confidence(subj.correct == 0);

    qntls = 0: 1/n_quant : 1;
    quantile_border = quantile(real_delta, qntls);

    [~, ~, bins_corr]= histcounts(real_delta_correct, quantile_border);
    [~, ~, bins_err] = histcounts(real_delta_error, quantile_border);
    [~, ~, bins_] = histcounts(real_delta, quantile_border);

    for i = 1:n_quant
        conf_corr(i) = mean(confidence_correct(bins_corr == i)) - 1;
        conf_error(i) = mean(confidence_error(bins_err == i)) - 1;
        quant_centers(i) = median(real_delta(bins_ == i));
    end
    conf_perc = [conf_corr; conf_error];
    conf_slope = conf_error - conf_corr;
end