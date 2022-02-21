%%% Load estimated parameters %%%
load ('results_Macrobrachium_amazonicum.mat')

% Zoom factors (used to vary {p_Am}) change with each morphotype 
zoomfactor = [par.z, par.z_mTC, par.z_mCC, par.z_mGC1, par.z_mGC2];
data = zeros(6,length(zoomfactor));

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
    Lw_i = L_i/ del_M;                % cm, ultimate total length at f
    Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

    % Mass gained
    rT_B = rho_B * kT_M;
    L = L_i - (L_i-L_p) * exp(-rT_B*t);               % growth curve
    Ww0 = L_p.^3 * (1 + f * ome);
    Ww = L.^3 * (1 + f * ome);
    Wg = Ww/Ww0;                                      % Mass gained

    % P - daily growth
    Wg_d = (Ww-Ww0)/30;

    % Ingestion rate
    JT_X = 1000 * p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC * s_M;  % g/d, ingested food (Fenneropenaeus chinensis)
    
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

    results = [Wg, Wg_d, JT_X, JT_P, EJO, EJN];
    data(:, i) = results;                             % pack results output
end

%Results from Augusto, 2014 and 2016
Alessandra = zeros(7,6);
Nomes = [" " "Wg" "Wg_d" "JT_X" "JT_P" "EJO" "EJN"]';
Femeas = ["Femeas" 2.5 0.21 0.003 5.13 0.07 2.13]';
TC = ["TC" 3.7 0.19 0.7 1.71 0.01 3.18]';
CC = ["CC" 12.7 24.6 3.22 1.95 0.03 0.87]';
GC1 = ["GC1" 16.0 53.7 3.10 2.43 0.06 3.35]';
GC2 = ["GC2" 1.9 7.5 3.08 2.8 0.07 13.53]';
Ale = {Nomes Femeas TC CC GC1 GC2};
TabAle = [Ale{:}]; %Table with the results from Augusto, 2014 and 2016

%Graphics
GraAle = zeros(6,5);
GraAle (:,1) = Femeas(2:7);
GraAle (:,2) = TC(2:7);
GraAle (:,3) = CC(2:7);
GraAle (:,4) = GC1(2:7);
GraAle (:,5) = GC2(2:7);

%Graph comparing Augusto 2014 and 2016 results with DEB theory
%Female
Fe (:,1)= data(:,1);
Fe (:,2)= GraAle(:,1);
x=categorical({'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
categorias=reordercats(x,{'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
figure
bar(categorias,Fe,'DisplayName','Femeas') 
title('Female')
legend('DEB theory','Augusto, 2014')

%Males TC
mTC (:,1)= data(:,2);
mTC (:,2)= GraAle(:,2);
x=categorical({'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
categorias=reordercats(x,{'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
figure
bar(categorias,mTC,'DisplayName','Machos TC') 
title('Males TC')
legend('DEB theory','Augusto, 2014')

%Males CC
mCC (:,1)= data(:,3);
mCC (:,2)= GraAle(:,3);
x=categorical({'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
categorias=reordercats(x,{'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
figure
bar(categorias,mCC,'DisplayName','Machos CC') 
title('Males CC')
legend('DEB theory','Augusto, 2016')

%Males GC1
mGC1 (:,1)= data(:,4);
mGC1 (:,2)= GraAle(:,4);
x=categorical({'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
categorias=reordercats(x,{'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
figure
bar(categorias,mGC1,'DisplayName','Machos GC1') 
title('Males GC1')
legend('DEB theory','Augusto, 2016')

%Males GC2
mGC2 (:,1)= data(:,5);
mGC2 (:,2)= GraAle(:,5);
x=categorical({'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
categorias=reordercats(x,{'Wg' 'Wg_d' 'JT_X' 'JT_P' 'EJO' 'EJN'});
figure
bar(categorias,mGC2,'DisplayName','Machos GC2') 
title('Males GC2')
legend('DEB theory','Augusto, 2016')
