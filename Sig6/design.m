%% design.m
function design(D,T,name)
%Plots a design matrix against a time vector with a name.

    %Initialize vectors and variables
    s = size(D,2);
    slots = 1:(s-1)*2;
    rslots = find(mod(slots,2)==0);
    lslots = find(mod(slots,2)~=0);
    
    %Plot the regression variables/signals.
    for i=1:s-1
        subplot(s-1,2,lslots(i));
        hold on;
        title(name + " regressor " + i);
        plot(T,D(:,i+1),'Marker', 'o', 'MarkerSize', 4);
        xlabel("Time(sec)");
        ylabel("Amplitude");
        hold off;
    end
    %Plot the design matrix.
    subplot(s-1,2,rslots);
    hold on;
    title(name + " Design");
    imagesc(D(:,2:end));
    xlabel("Stimuli");
    ylabel("Stimuli Activity");
    ylim([0,size(D,1)]);
    colormap gray;
    hold off;
end
