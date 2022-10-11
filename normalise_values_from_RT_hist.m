% Reaction times for each case (all/correct/error) are plotted in a
% histogram with a selected number of bins. Then, the number of trials that
% fall into each histogram bin is extracted (histobj,Values) and it is
% normalised by the overall number of type of trials.
% Bar postitions are required for further plotting of normalised values.
% To find bar positions, the center of each bin is calculated.
% The output is 3 tables of normalised values and bar positions that can be
% further plotted to demonstrate reaction time distribution.

function [all, corr, err, bar_positions] = normalise_values_from_RT_hist(data, nbins)
    figure()

    histobject1 = histogram(data.choice_rt(~isnan(data.correct)), nbins);
    all = histobject1.Values / height(data.choice_rt(~isnan(data.correct)));
    
    for i = 1:length(histobject1.BinEdges) - 1
        bar_positions(i) = (histobject1.BinEdges(i+1) + histobject1.BinEdges(i)) / 2;
    end
    figure()
    histobject2 = histogram(data.choice_rt(data.correct == 1),nbins);
    corr = histobject2.Values/ height(data.choice_rt(data.correct == 1));
    figure()
    histobject3 = histogram(data.choice_rt(data.correct == 0), nbins);
    err = histobject3.Values/ height(data.choice_rt(data.correct == 0));
    close all
end