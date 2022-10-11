% Slopes are differences between reaction time for error and correct
% trails.

function [slope, quant_centers] = generate_slopes(data, n_quant)
    [RT_corr, RT_err, quant_centers] = reaction_times_to_quantiles(data, n_quant);
    slope = RT_err - RT_corr;
end