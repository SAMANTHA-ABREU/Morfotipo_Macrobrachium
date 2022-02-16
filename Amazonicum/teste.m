%%% Load estimated parameters %%%
load ('results_Macrobrachium_amazonicum.mat')

% Zoom factors (used to vary {p_Am}) change with each morphotype 
zoomfactor = [par.z, par.z_mTC, par.z_mCC, par.z_mGC1, par.z_mGC2];
data = zeros(7,length(zoomfactor));

for i = 1:length(zoomfactor)
    par.z = zoomfactor(i);
    t_experiment = 30;                                % d, experiment durantion (Augusto, 2016)

    cPar = parscomp_st(par); vars_pull(par); 
    vars_pull(cPar);  %vars_pull(data);  vars_pull(auxData);

    pars_tj = [g k l_T v_Hb v_Hj v_Hp];
    [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

    % Corrections
    t = (t_p + t_experiment);                         % d, estimated age (Augusto, 2016)
    Temp = C2K(30);
    TC = tempcorr(Temp, T_ref, T_A);

    % Mass gained
    kT_M = k_M * TC;
    rT_B = rho_B * kT_M;
    L_b = L_m * l_b;
    L_p = L_m * l_p;
    L_i = L_m * l_i;
    L = L_i - (L_i-L_b) * exp(-rT_B*t);               % growth curve
    Ww0 = L_p.^3 * (1 + f * ome);
    Ww = L.^3 * (1 + f * ome);
%     Ww = Ww0 * (L * del_M).^3 * (1 + f * ome);
    Wg = Ww/Ww0;                                      % Mass gained

    % P - daily growth
    Wg_d = (Ww-Ww0)/30;

    % Ingestion rate
    s_M=(l_j/l_b);                                    % Acceleration factor
    pT_Xm = TC * p_Xm * s_M;                          % J/d.cm^2, {p_Xm} ingestion rate (Magallana gigas)
    JT_XAm = L^2 * f * pT_Xm;                         % feeding rate per individual (Magallana gigas)
        
    %OU
    JT_XAm = p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC;  % g/d, ingested food (Fenneropenaeus chinensis)
    
    %OU
    s_M=(l_j/l_b);
    JT_XAm = L^2 * J_X_Am * f * TC * s_M;               % mol/d, ingestion rate limited by salinity (Crassostrea corteziensis)
    
    % Assimilação
    J_E_Am  = p_Am/ mu_E;          
    JT_EAm = TC * J_E_Am * L^2;                       % mol/d.cm^2, {J_EAm}, max assimilation flux per area surface

    %OU
    JT_EAm = TC * p_Am * L_m^2;                      % Mytilus edulis
    
    %OU
    JT_EAm = kap_X * pT_Xm;                            % (Kooijman, 2008)pag 35
        
    % Feces
    J_f_Am = JT_XAm - JT_EAm;                         % mol/d.cm^2, max faeces production per surface area 
    
    %OU
    TJ_X = mu_F* p_Am* TC* L^2 / kap_X;               % Hyalella azteca (Não temos o parametro mu_F, tenho que encontrar uma forma de estima-lo)
    
    % Flux data 
    pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
    p_ref = TC * p_Am * L_m^2;                        % J/d, max assimilation capacity at maximum size

    % Respiration 
    pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
    pACSJGRD(:,1) = 0 * pACSJGRD(:,1);                % exclude contribution from assimilation
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
    EJO = - J_M(3,:)' * TC * 31.98;                   % g O2/d, O2 consumption

    % Excretion
    pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
    pACSJGRD(:,1) = 0 * pACSJGRD(:,1);                % exclude contribution from assimilation
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
    EJN = J_M(4,:)' * TC * 17.031;                    % g-at NH3/d, ammonia production

    results = [Wg, Wg_d, J_E_Am, JT_XAm, J_f_Am, EJO, EJN];
    data(:, i) = results;                             % pack results output
end
