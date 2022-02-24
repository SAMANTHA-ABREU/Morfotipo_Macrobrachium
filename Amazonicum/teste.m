%%% Load estimated parameters %%%
load ('results_Macrobrachium_amazonicum.mat')

% Zoom factors (used to vary {p_Am}) change with each morphotype 
zoomfactor = [par.z, par.z_mTC, par.z_mCC, par.z_mGC1, par.z_mGC2];
numbervar = 6; %Number of desired variable
len_resvector = 50; %Length of output
data = zeros(numbervar,length(zoomfactor),len_resvector);

cPar = parscomp_st(par); vars_pull(par); 
vars_pull(cPar);  %vars_pull(data);  vars_pull(auxData);

pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% Corrections
t_experiment = 30;                                % d, experiment durantion (Augusto, 2016)
t = (t_experiment);                         % d, estimated age (Augusto, 2016)
Temp = C2K(30);
TC = tempcorr(Temp, T_ref, T_A);
  
L_p = L_m * l_p;                  % cm, structural length at puberty at f
kT_M = k_M * TC;
s_M=(l_j/l_b);                                    % Acceleration factor

%ultimate length per morphotype(Moraes-Riodades, 2002)
Lmax = [9.4, 9.4, 9.8, 13.0, 14.06];


for i = 1:length(zoomfactor)
    par.z = zoomfactor(i);
    
  
    p_Am = zoomfactor(i) * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
    E_m = p_Am/ v;                   % J/cm^3, reserve capacity [E_m]
    g = E_G/ (kap* E_m);             % -, energy investment ratio
    m_Em = y_E_V * E_m/ E_G;         % mol/mol, reserve capacity 
    w = m_Em * w_E/ w_V;             % -, contribution of reserve to weight
    L_m = v/ k_M/ g;                  % cm, max struct length
    pars_tj = [g k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males TC
    [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);   
    L_i = L_m * l_i;    % cm, ultimate structural length at f
    
    % Mass gained
    rT_B = rho_B * kT_M;
    
    L_p_physical = L_p/del_M;
    L_i_physical = L_i/del_M;
    t_L =  log((L_p_physical-L_i_physical)/(Lmax(i)-L_i_physical))/rT_B; % d, Estimated growth time at f=1 for with morphotype from puberty to ultimate
    t = linspace(t_p,t_L,len_resvector);
    
    L = L_i - (L_i-L_p) * exp(-rT_B*t);               % growth curve
    Ww0 = L_p.^3 * (1 + f * ome);
    Ww = L.^3 * (1 + f * ome);
    Wg = Ww./Ww0;                                      % Mass gained

    % P - daily growth
    Wg_d = (Ww-Ww0)./30;

    % Ingestion rate
    JT_X = p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC * s_M;  % g/d, ingested food (Fenneropenaeus chinensis)
    
    % Faecal
    JT_P = JT_X * (1 - kap_X);                         % g/d, max faeces production per surface area 
    
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

    results = struct;
    results.Wg = Wg;                                % pack results output
    results.Wg_d = Wg_d;
    results.JT_X = JT_X;
    results.JT_P = JT_P;
    results.EJO = EJO;
    results.EJN = EJN;
    
    save('Results_'+string(zoomfactor(i))+'.mat','results')
end
