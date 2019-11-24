% This function is used to calculate an expected correction vector 
% Angles should be given in degree 
% Translations mm or cm depending on what we want as output
function CV = ExpectedCorrectionVector(CVInit, Disp)

MInit = ieCtotransform(CVInit(5), CVInit(6), CVInit(4), CVInit(1), CVInit(2), CVInit(3));

M = ieCtotransform(Disp(5), Disp(6), Disp(4), Disp(1), Disp(2), Disp(3));

% Expected Cv: M = displacement applied (e.g 0,0,0,1,0,0); MInit = initial correction vector
[Pitch, Roll, Yaw, Tx, Ty, Tz] = iecPosition (inv((M) * (inv(MInit))));
CV = [Tx, Ty, Tz, Yaw, Pitch, Roll];

