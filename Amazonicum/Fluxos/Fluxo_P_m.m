%%% Load estimated parameters %%%
load ('results_Macrobrachium_amazonicum.mat')

% Somatic maint (used to vary {p_M}) change with each morphotype 
somaticmaint = [par.p_M, par.p_MTC, par.p_MCC, par.p_MGC1, par.p_MGC2];
numbervar = 6; %Number of desired variable
len_resvector = 50; %Length of output
data = zeros(numbervar,length(somaticmaint),len_resvector);

cPar = parscomp_st(par); vars_pull(par); 
vars_pull(cPar);  %vars_pull(data);  vars_pull(auxData);

pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% Corrections                          
t_obs = 30;                         % d, experiment durantion (Augusto, 2016)
Temp = C2K(30);
TC = tempcorr(Temp, T_ref, T_A);
  
L_p = L_m * l_p;                  % cm, structural length at puberty at f
s_M=(l_j/l_b);                                    % Acceleration factor


for i = 1:length(somaticmaint)
    p_M = somaticmaint(i);
    
  
    %p_Am = z * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
    E_m = p_Am/ v;                   % J/cm^3, reserve capacity [E_m]
    g = E_G/ (kap* E_m);             % -, energy investment ratio
    m_Em = y_E_V * E_m/ E_G;         % mol/mol, reserve capacity 
    w = m_Em * w_E/ w_V;             % -, contribution of reserve to weight
    k_M = p_M/E_G;
    k = k_J/k_M;
    L_m = v/ k_M/ g;                  % cm, max struct length
    pars_tj = [g k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males TC
    [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);   
    L_i = L_m * l_i;    % cm, ultimate structural length at f
    kT_M = k_M * TC;
    rT_B = rho_B * kT_M;
    
    mu = (L_i+L_p)/2;
    sigma = (L_i-L_p)/6;
    L_init = sort(L_p + ((mu - L_p) + sigma * randn(1,50)));
    L_init(L_init>L_i) = L_i;
    L_init(L_init<L_p) = L_p;
%     L_init = sort(L_init);
%     L_init = linspace(L_p,L_i,len_resvector);
    
    % Mass gained (Augusto 2016 e 2014 - %)
    L_f = L_i - (L_i-L_init) * exp(-rT_B* t_obs);                 % growth curve
    Ww0 = L_init.^3 * (1 + f * ome);
    Ww = L_f.^3 * (1 + f * ome);
    Wg = Ww./Ww0;                                                % Mass gained (%)
    Wd = Ww * d_V;                                               % g Dry weight
    
    % P - daily growth (Augusto 2016 - g/d e Augusto 2014 - mg/d)
    Wg_d = (Ww-Ww0)./30;                                         % g/d

    % Flux data 
    pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
    p_ref = p_Am * L_m^2*TC;                        % J/d, max assimilation capacity at maximum size
    pACSJGRD = p_ref * scaled_power_j(L_f, f, pars_p, l_b, l_j, l_p); % J/d, powers
    eta_O(1,1) = -0.2989;   %food
    eta_O(4,1) = 0.005978;  %faeces
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
    J_O = eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_X, J_V, J_E + J_ER, J_P in rows
    Wd = 1e3 * L_f.^3 * (1 + f * ome) * d_V;                 % mg Dry weight
    Ww = 1e3 * L_f.^3 * (1 + f * ome);  %mg Wet weigth
    % Ingestion rate (Augusto 2016 - mg/d e Augusto 2014 - mg/d)
%     mu_X = 14000;                                                %J/gDW
    X_wd = 0.2388/0.2198;                                                    %gWW/gDW
%     JT_X = 1000 * p_Am * L_f.^2/ kap_X/ mu_X * X_wd * TC * s_M;  % mg/d, ingested food (Fenneropenaeus chinensis)
    JT_X = - X_wd * 1e3 * (1 + f * ome) * 23.9 * J_O(1,:);         %mg/d Wet weight
    % Faecal (Augusto 2016 - mg e Augusto 2014 - mg)
    JT_P =  JT_X / X_wd * (1 - kap_X);                                   % mg/d, max faeces production per surface area 
%     JT_P = X_wd * 1e3 * 23.9 * J_O(4,:);                                  %mg/d Dry weight
    % Respiration (Augusto 2016 - g e Augusto 2014 - g)
%     EJO = (- 2*16 * J_M(3,:) * TC)' * d_V;                   % g O2/d, O2 consumption 
      EJO = (- 2*16 * J_M(3,:))' * d_V;                   % g O2/d, O2 consumption
    % Excretion (Augusto 2016 - mg e Augusto 2014 - mg)
%     EJN = (1e3 * J_M(4,:) * TC * 17.031)' * d_V;          % mg-at NH3/d, ammonia production
      EJN = (1e3 * J_M(4,:) * 17.031)' * d_V;          % mg-at NH3/d, ammonia production
    results = struct;                                      % pack results output
    results.Wg = Wg;                                
    results.Wg_d = Wg_d;
    results.JT_X = JT_X;
    results.JT_P = JT_P;
    results.EJO = EJO;
    results.EJN = EJN;
    
    save('Results_'+string(somaticmaint(i))+'.mat','results')
end
%%%Results%%%
%Results Wg

Wg = zeros(50,5);
load ('Results_'+string(somaticmaint(1))+'.mat')
Wg (:,1) = results.Wg;
load ('Results_'+string(somaticmaint(2))+'.mat')
Wg (:,2) = results.Wg;
load ('Results_'+string(somaticmaint(3))+'.mat')
Wg (:,3) = results.Wg;
load ('Results_'+string(somaticmaint(4))+'.mat')
Wg (:,4) = results.Wg;
load ('Results_'+string(somaticmaint(5))+'.mat')
Wg (:,5) = results.Wg;
csvwrite ( 'WgpM.csv' , Wg)
    
%Results Wg_d
Wg_d = zeros(50,5);
load ('Results_'+string(somaticmaint(1))+'.mat')
Wg_d (:,1) = results.Wg_d;
load ('Results_'+string(somaticmaint(2))+'.mat')
Wg_d (:,2) = results.Wg_d;
load ('Results_'+string(somaticmaint(3))+'.mat')
Wg_d (:,3) = results.Wg_d;
load ('Results_'+string(somaticmaint(4))+'.mat')
Wg_d (:,4) = results.Wg_d;
load ('Results_'+string(somaticmaint(5))+'.mat')
Wg_d (:,5) = results.Wg_d;
csvwrite ( 'Wg_dpM.csv' , Wg_d)

%Results JT_X
JT_X = zeros(50,5);
load ('Results_'+string(somaticmaint(1))+'.mat')
JT_X (:,1) = results.JT_X;
load ('Results_'+string(somaticmaint(2))+'.mat')
JT_X (:,2) = results.JT_X;
load ('Results_'+string(somaticmaint(3))+'.mat')
JT_X (:,3) = results.JT_X;
load ('Results_'+string(somaticmaint(4))+'.mat')
JT_X (:,4) = results.JT_X;
load ('Results_'+string(somaticmaint(5))+'.mat')
JT_X (:,5) = results.JT_X;
csvwrite ( 'JT_XpM.csv' , JT_X)

%Results JT_P
JT_P = zeros(50,5);
load ('Results_'+string(somaticmaint(1))+'.mat')
JT_P (:,1) = results.JT_P;
load ('Results_'+string(somaticmaint(2))+'.mat')
JT_P (:,2) = results.JT_P;
load ('Results_'+string(somaticmaint(3))+'.mat')
JT_P (:,3) = results.JT_P;
load ('Results_'+string(somaticmaint(4))+'.mat')
JT_P (:,4) = results.JT_P;
load ('Results_'+string(somaticmaint(5))+'.mat')
JT_P (:,5) = results.JT_P;
csvwrite ( 'JT_PpM.csv' , JT_P)

%Results EJO
EJO = zeros(50,5);
load ('Results_'+string(somaticmaint(1))+'.mat')
EJO (:,1) = results.EJO;
load ('Results_'+string(somaticmaint(2))+'.mat')
EJO (:,2) = results.EJO;
load ('Results_'+string(somaticmaint(3))+'.mat')
EJO (:,3) = results.EJO;
load ('Results_'+string(somaticmaint(4))+'.mat')
EJO (:,4) = results.EJO;
load ('Results_'+string(somaticmaint(5))+'.mat')
EJO (:,5) = results.EJO;
csvwrite ( 'EJOpM.csv' , EJO)

%Results EJN
EJN = zeros(50,5);
load ('Results_'+string(somaticmaint(1))+'.mat')
EJN (:,1) = results.EJN;
load ('Results_'+string(somaticmaint(2))+'.mat')
EJN (:,2) = results.EJN;
load ('Results_'+string(somaticmaint(3))+'.mat')
EJN (:,3) = results.EJN;
load ('Results_'+string(somaticmaint(4))+'.mat')
EJN (:,4) = results.EJN;
load ('Results_'+string(somaticmaint(5))+'.mat')
EJN (:,5) = results.EJN;
csvwrite ( 'EJNpM.csv' , EJN)

