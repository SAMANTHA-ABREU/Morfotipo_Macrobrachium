%%% Load estimated parameters %%%
load ('results_Macrobrachium_amazonicum.mat')

% Zoom factors (used to vary {p_Am}) change with each morphotype 
zoomfactor = [par.z, par.z_mTC, par.z_mCC, par.z_mGC1, par.z_mGC2];
data = zeros(7,length(zoomfactor));

for i = 1:length(zoomfactor)
    par.z = zoomfactor(i);
    %L_po = [5.5, 5.5, 6.3, 8.7, 8.7]; % cm, comprimento póstorbital
    %L = L_po(1);
    t_experiment = 30; % d, experiment durantion (Augusto, 2016)

    cPar = parscomp_st(par); vars_pull(par); 
    vars_pull(cPar);  %vars_pull(data);  vars_pull(auxData);

    pars_tj = [g k l_T v_Hb v_Hj v_Hp];
    [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

    % Corrections
    t = t_p + t_experiment; % d, estimated age (Augusto, 2016)
    Temp = C2K(30);
    TC = tempcorr(Temp, T_ref, T_A);

    % Massa ganha
    kT_M = k_M * TC;
    rT_B = rho_B * kT_M;
    %L_m = v/ k_M/ g;
    %L_i = L_m * l_i;
    L = l_i - (l_i-l_p) * exp(-rT_B*t); % growth curve
    Ww0 = L.^3 * (1 + f * ome);
    Ww = Ww0 * (L * del_M).^3 * (1 + f * ome);
    Wg = Ww/Ww0;                  % Massa ganha

    % P - massa ganha diária
    Wg_d = (Ww-Ww0)/30;

    % Assimilação
    J_E_Am  = p_Am/ mu_E;          % mol/d.cm^2, {J_EAm}, fluxo máximo de assimilação por superficie aréa 

    % Taxa de ingestão
    y_E_X  = kap_X * mu_X/ mu_E;  % mol/mol, rendimento de reserva em alimentos
    y_X_E  = 1/ y_E_X;            % mol/mol, rendimento de alimentos em reserva
    J_X_Am = y_X_E * J_E_Am;      % mol/d.cm^2, {J_XAm}, fluxo máximo de digestão por superficie aréa 

    % Fezes
    J_f_Am = J_X_Am - J_E_Am;     %mol/d.cm^2, fluxo máximo de produção de fezes por superficie aréa 

    % flux data 
    pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
    p_ref = p_Am * L_m^2; % J/d, capacidade de assimilação máxima no tamanho máximo

    % respiration 
    pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
    pACSJGRD(:,1) = 0 * pACSJGRD(:,1);                % exclui a contribuição da assimilação
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N em linhas
    EJO = - J_M(3,:)' * TC * 31.98;         % g O2/d, consumo de O2

    % excretion
    pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
    pACSJGRD(:,1) = 0 * pACSJGRD(:,1); % exclui a contribuição da assimilação
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N em linhas
    EJN = J_M(4,:)' * TC * 14e3;             % µg-at NH3/d, produção de amonia

    results = [Wg, Wg_d, J_E_Am, J_X_Am, J_f_Am, EJO, EJN];
    data(:, i) = results; % pack results output
end
