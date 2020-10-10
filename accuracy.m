function accuracy(net,input,target)

%simulationResult = sim(net,input');
simulationResult = net(input');
[~, targetMat] = max(cell2mat(target'));
[~, outputMat] = max(cell2mat(simulationResult));

% To calculate confusion matrix we need to avoid values that are out of
% bounds.
% outputMat(outputMat>=8)=7;
% outputMat(outputMat<=1)=1;

% unique(outputMat)
numberOfClasses = 6;
targetsSize = length(targetMat);
outputsSize = length(outputMat);

cc2 = size(find(targetMat == outputMat),2) / outputsSize;

targets = zeros(numberOfClasses, targetsSize);
outputs = zeros(numberOfClasses, outputsSize);

targetsIdx = sub2ind(size(targets),targetMat,1:targetsSize);

outputsIdx = sub2ind(size(outputs),outputMat,1:outputsSize);

targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;


plotconfusion(targets, outputs)
% This is the handle for the last figure, so it needs to be configured
% after plotting it.
h = gca;
h.XTickLabel = {'angry', 'fear', 'happy', 'neutral', 'sad', 'surprise',''};
h.YTickLabel = {'angry', 'fear', 'happy', 'neutral', 'sad', 'surprise',''};

h.YTickLabelRotation = 90;


%[c,cm] = confusionCasera(targetMat,outputMat);
fprintf('Percentage Correct Classification   : %f%%\n', 100*cc2);
fprintf('Percentage Incorrect Classification : %f%%\n', 100*(1-cc2));

end