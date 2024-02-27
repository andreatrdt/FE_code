function [discounts, dates] = discount_Depos(datesSet, ratesSet, DeposDate)

    % date notation 
    ACT_360 = 2;

    %   retrive data 
    deposDates = datesSet.depos(1:DeposDate); % first 3 deposit dates
    deposRates = ratesSet.depos(1:DeposDate); % first 3 deposit rates
    deposRates = 0.5 * (deposRates(:,1) + deposRates(:,2));
    % fix settlement date
    t0 = datesSet.settlement;
    
    dates = [t0];
    discounts = [1];

    depoDeltas = yearfrac(t0, deposDates, ACT_360);
    dates = [dates; deposDates];
    discounts = [discounts; 1 ./ (1 + deposRates .* depoDeltas)];

end