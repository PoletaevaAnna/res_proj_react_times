function [cfd, cfd_corr, cfd_err] = cfd_sanity_check(data)
    height_all = height(data.confidence(~isnan(data.confidence)));
    height_corr = height(data.confidence(data.correct == 1));
    height_err = height(data.confidence(data.correct ==0));

    cfd = height(data.confidence(data.confidence == 2))/height_all;
    cfd_corr = height(data.confidence((data.correct == 1)&(data.confidence == 2))) / height_corr;
    cfd_err = height(data.confidence((data.correct == 0)&(data.confidence == 2))) / height_err;

end