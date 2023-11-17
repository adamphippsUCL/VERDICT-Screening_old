% MATLAB script to define VERDICT scheme and simulate signal

function [signals, Vscheme] = SimulateSignal(Vs, fIC, fVASC, Rs, fRs)

arguments
    Vs % VERDICT scheme parameters
    fIC % Intracellular volume fraction
    fVASC % Vascular volume fraction
    Rs % Cell radii
    fRs % Volume fraction distribution of radii (Not normalised)

end

%% Define tissue parameters
fEES = 1-fIC-fVASC;

% Normalise fRs by fIC

fRs = fIC*fRs/sum(fRs);


tissue_params = [fIC, fEES, fVASC];


%% Simulate signal over scheme

[signals, Vscheme] = verdict_simulate_Adam(Vs, tissue_params, Rs, fRs);


end

