% Copyright 2021 The MathWorks, Inc.
% Initialized variables used in the model
clear
% The angle of rotating the original video frames to generate a distorted
% video for the recovery task
rotateAngle = pi/6;
% Maximum number of output featrues from extraction
maxNumOfOutPutFeatures = 50;
% Size of the descriptor
descriptorSize = 64;
% Define FeatureBus object
busDefinition(maxNumOfOutPutFeatures,descriptorSize)

% Create RefFeaturesTemp and FrameFeaturesTemp based on FeatureBus
RefFeaturesTemp = Simulink.Bus.createMATLABStruct('FeatureBus');
RefFeaturesTemp.count = 0;
RefFeaturesTemp.locations = zeros(maxNumOfOutPutFeatures,2);
RefFeaturesTemp.descriptors = zeros(maxNumOfOutPutFeatures,descriptorSize);

FrameFeaturesTemp = Simulink.Bus.createMATLABStruct('FeatureBus');
FrameFeaturesTemp.count = 0;
FrameFeaturesTemp.locations = zeros(maxNumOfOutPutFeatures,2);
FrameFeaturesTemp.descriptors = zeros(maxNumOfOutPutFeatures,descriptorSize);

% Function used for initializing bus object:featureBus in the MATLAB base workspace
function busDefinition(maxNumOfOutPutFeatures,descriptorSize) 
% Bus object: featureBus 
clear elems;
elems(1) = Simulink.BusElement;
elems(1).Name = 'count';
elems(1).Dimensions = 1;
elems(1).DimensionsMode = 'Fixed';
elems(1).DataType = 'double';
elems(1).SampleTime = -1;
elems(1).Complexity = 'real';
elems(1).SamplingMode = 'Sample based';
elems(1).Min = [];
elems(1).Max = [];
elems(1).DocUnits = '';
elems(1).Description = '';

elems(2) = Simulink.BusElement;
elems(2).Name = 'locations';
elems(2).Dimensions = [maxNumOfOutPutFeatures 2];
elems(2).DimensionsMode = 'Fixed';
elems(2).DataType = 'double';
elems(2).SampleTime = -1;
elems(2).Complexity = 'real';
elems(2).SamplingMode = 'Sample based';
elems(2).Min = [];
elems(2).Max = [];
elems(2).DocUnits = '';
elems(2).Description = '';

elems(3) = Simulink.BusElement;
elems(3).Name = 'descriptors';
elems(3).Dimensions = [maxNumOfOutPutFeatures descriptorSize];
elems(3).DimensionsMode = 'Fixed';
elems(3).DataType = 'double';
elems(3).SampleTime = -1;
elems(3).Complexity = 'real';
elems(3).SamplingMode = 'Sample based';
elems(3).Min = [];
elems(3).Max = [];
elems(3).DocUnits = '';
elems(3).Description = '';

featureBus = Simulink.Bus;
featureBus.Elements = elems;
clear elems;
assignin('base','FeatureBus', featureBus);
end
