% Extracts confidence from a dataset. Conf is the confidence for all
% trials; conf_correct - only for correct trials, conf_error - only for
% error trials.

function [conf, conf_correct, conf_error] = general_percent_high_conf(data)
    conf = mean(data.confidence(~isnan(data.confidence))) - 1;
    conf_correct = mean(data.confidence(data.correct == 1)) - 1;
    conf_error = mean(data.confidence(data.correct == 0)) - 1;
end