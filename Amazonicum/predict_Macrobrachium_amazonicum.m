function [prdData, info] = predict_Macrobrachium_amazonicum(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC= tempcorr(temp.ab, T_ref, T_A);
%   TC_ab_T24 = tempcorr(temp.ab_T24, T_ref, T_A);
%   TC_ab_T30 = tempcorr(temp.ab_T30, T_ref, T_A);
%   TC_tj = tempcorr(temp.tj, T_ref, T_A);
%   TC_Lp = tempcorr(temp.Lp, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
%   TC_tL_JT25 = tempcorr(temp.tL_JT25, T_ref, T_A);
  TC_LN_F = tempcorr(temp.LN_F, T_ref, T_A);
%   TC_tL_F = tempcorr(temp.tL_F, T_ref, T_A);
  TC_28 = tempcorr(temp.tW_mTC, T_ref, T_A);
  kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  t_0 = 0;
%   aT24_b = t_b/ k_M/ TC_ab_T24;     % d, age at birth at f and T 24 °C
%   aT30_b = t_b/ k_M/ TC_ab_T30;     % d, age at birth at f and T 30 °C
  aT_b = t_0 + t_b/ kT_M;        % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
%   kT_M = k_M * TC_tj;                  % 1/d, som maint rate coeff
  tT_j = (t_j-t_b)/ kT_M;           % d, time since birth at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  L_p = L_p/ del_M;                 % cm, total length at puberty at f 
%   kT_M = k_M * TC_Lp;                  % 1/d, som maint rate coeff
  tT_p = (t_p-t_j)/ kT_M;           % d, time since metam at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_F = L_i/ del_M;              % cm, ultimate total length at f for female
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males TC
  p_Am_mTC = z_mTC * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mTC = p_Am_mTC/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mTC = E_G/ (kap* E_m_mTC);             % -, energy investment ratio
  m_Em_mTC = y_E_V * E_m_mTC/ E_G;         % mol/mol, reserve capacity 
  w_mTC = m_Em_mTC * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmTC = v/ k_M/ g_mTC;                  % cm, max struct length
  pars_tjmTC = [g_mTC k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males TC
  [t_jmTC, t_pmTC, t_bmTC, l_jmTC, l_pmTC, l_bmTC, l_imTC, rho_jmTC, rho_BmTC] = get_tj(pars_tjmTC, f);   
  L_i_mTC = L_mmTC * l_imTC;    % cm, ultimate structural length at f
  Lw_i_mTC = L_i_mTC/ del_MT_mTC;              % cm, ultimate total length at f
  Ww_i_mTC = L_i_mTC^3 * (1 + f * w_mTC);       % g, ultimate wet weight 

  % ultimate for Males CC
  p_Am_mCC = z_mCC * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mCC = p_Am_mCC/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mCC = E_G/ (kap* E_m_mCC);             % -, energy investment ratio
  m_Em_mCC = y_E_V * E_m_mCC/ E_G;         % mol/mol, reserve capacity 
  w_mCC = m_Em_mCC * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmCC = v/ k_M/ g_mCC;                  % cm, max struct length
  pars_tjmCC = [g_mCC k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males CC
  [t_jmCC, t_pmCC, t_bmCC, l_jmCC, l_pmCC, l_bmCC, l_imCC, rho_jmCC, rho_BmCC] = get_tj(pars_tjmCC, f);
  L_i_mCC = L_mmCC * l_imCC;     % cm, ultimate structural length at f
  Lw_i_mCC = L_i_mCC/ del_MT_mCC;              % cm, ultimate total length at f
  Ww_i_mCC = L_i_mCC^3 * (1 + f * w_mCC);       % g, ultimate wet weight 

  % ultimate for Males GC1
  p_Am_mGC1 = z_mGC1 * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mGC1 = p_Am_mGC1/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mGC1 = E_G/ (kap* E_m_mGC1);             % -, energy investment ratio
  m_Em_mGC1 = y_E_V * E_m_mGC1/ E_G;         % mol/mol, reserve capacity 
  w_mGC1 = m_Em_mGC1 * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmGC1 = v/ k_M/ g_mGC1;                  % cm, max struct length
  pars_tjmGC1 = [g_mGC1 k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males GC1
  [t_jmGC1, t_pmGC1, t_bmGC1, l_jmGC1, l_pmGC1, l_bmGC1, l_imGC1, rho_jmGC1, rho_BmGC1] = get_tj(pars_tjmGC1, f);
  L_i_mGC1 = L_mmGC1 * l_imGC1;     % cm, ultimate structural length at f
  Lw_i_mGC1 = L_i_mGC1/ del_MT_mGC1;              % cm, ultimate total length at f
  Ww_i_mGC1 = L_i_mGC1^3 * (1 + f * w_mGC1);       % g, ultimate wet weight 

  % ultimate for Males GC2
  p_Am_mGC2 = z_mGC2 * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mGC2 = p_Am_mGC2/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mGC2 = E_G/ (kap* E_m_mGC2);             % -, energy investment ratio
  m_Em_mGC2 = y_E_V * E_m_mGC2/ E_G;         % mol/mol, reserve capacity 
  w_mGC2 = m_Em_mGC2 * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmGC2 = v/ k_M/ g_mGC2;                  % cm, max struct length
  pars_tjmGC2 = [g_mGC2 k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males GC2
  [t_jmGC2, t_pmGC2, t_bmGC2, l_jmGC2, l_pmGC2, l_bmGC2, l_imGC2, rho_jmGC2, rho_BmGC2] = get_tj(pars_tjmGC2, f);
  L_i_mGC2 = L_mmGC2 * l_imGC2;     % cm, ultimate structural length at f
  Lw_i_mGC2 = L_i_mGC2/ del_MT_mGC2;              % cm, ultimate total length at f
  Ww_i_mGC2 = L_i_mGC2^3 * (1 + f * w_mGC2);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = aT_b;
%   prdData.ab_T24 = aT24_b;
%   prdData.ab_T30 = aT30_b;
%   prdData.tj = tT_j;
%   prdData.Lp = L_p;
  prdData.Li_F = Lw_i_F;
%   prdData.Li_TC = Lw_i_mTC;
  prdData.Wwi_TC = Ww_i_mTC;
%   prdData.Li_CC = Lw_i_mCC;
  prdData.Wwi_CC = Ww_i_mCC;
%   prdData.Li_GC1 = Lw_i_mGC1;
  prdData.Wwi_GC1 = Ww_i_mGC1;
  prdData.Li_GC2 = Lw_i_mGC2;
  prdData.Wwi_GC2 = Ww_i_mGC2;
  prdData.Wdb = Wd_b;
  prdData.Ri = RT_i;

  % uni-variate data
  % We are considering that, afer puberty, males have different zoom factors
  %Juveniles
  %time-length
  %indoors (low temperature)
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
%   kT_M = k_M * TC_tL_JT25;
%   rT_B = rho_B * kT_M;
%   L_b = L_m * l_b;
%   L_j = L_m * l_j;
%   L = L_j - (L_j - L_b) * exp( - rT_B * tL_JT25(:,1)); % cm, struc length females
%   ELw_JT25 = L / del_M; % cm, length juveniles, indoors
  
  %outdoors (high temperature)
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
%   kT_M = k_M * TC_ab_T30;
%   rT_B = rho_B * kT_M;
%   L_b = L_m * l_b;
%   L_j = L_m * l_j;
%   L = L_j - (L_j - L_b) * exp( - rT_B * tL_JT30(:,1)); % cm, struc length females
%   ELw_JT30 = L / del_M; % cm, length juveniles, outdoors
  
  % Female
  % length- weight
  EW_F = (LW_F(:,1) * del_MT_F).^3 * (1 + f * w); % g, wet weight  

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_F = TC_LN_F * 365 * reprod_rate_j(LN_F(:,1) * del_MT_F, f, pars_R);% #, fecundity and length

  % length-length
%   ELw_F = LL_F(:,1) * del_MT_F/ del_M; % cm, cephalothorax length

  % time-length
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
%   kT_M = k_M * TC_tL_F; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
%   L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
%   L_bj = L_b * exp(tL_F(tL_F(:,1) < tT_j,1) * rT_j/ 3);
%   L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_F(tL_F(:,1) >= tT_j,1) - tT_j)); 
%   EL_F = [L_bj; L_ji]/ del_M; % cm, total length

 %Males
  %Male morphotype TC
  %time-weigth
  [t_jmTC, t_pmTC, t_bmTC, l_jmTC, l_pmTC, l_bmTC, l_imTC, rho_jmTC, rho_BmTC] = get_tj(pars_tjmTC, f);
  kT_M = k_M * TC_28;
  rT_jmTC = rho_jmTC * kT_M; 
  rT_BmTC = rho_BmTC * kT_M;
  tT_jmTC = (t_jmTC - t_bmTC)/ kT_M;
  L_bmTC = L_mmTC * l_bmTC;  L_jmTC = L_mmTC * l_jmTC; L_imTC = L_mmTC * l_imTC;
%   L_bjmTC = L_bmTC * exp(tW_mTC((tW_mTC(:,1) <= tT_jmTC),1) *  rT_jmTC/ 3);
  L_ji_TC = L_imTC - (L_imTC - L_jmTC) * exp( - rT_BmTC * (tW_mTC(tW_mTC(:,1) > tT_jmTC,1) + tT_jmTC)); % cm, structural length at time
%   EWw_TC = [L_bjmTC; L_ji_TC].^3 * (1 + f * w_mTC);
  EWw_TC = L_ji_TC.^3 * (1 + f * w_mTC);
  
  %length-length
%   ELw_mTC = LL_mTC(:,1) * del_MT_mTC/ del_M; % cm, carapace length

  % Male morphotype CC
  %time-weigth
  [t_jmCC, t_pmCC, t_bmCC, l_jmCC, l_pmCC, l_bmCC, l_imCC, rho_jmCC, rho_BmCC] = get_tj(pars_tjmCC, f);
  kT_M = k_M * TC_28;
  rT_jmCC = rho_jmCC * kT_M; 
  rT_BmCC = rho_BmCC * kT_M;
  tT_jmCC = (t_jmCC - t_bmCC)/ kT_M;
  L_bmCC = L_mmCC * l_bmCC;  L_jmCC = L_mmCC * l_jmCC; L_imCC = L_mmCC * l_imCC;
%   L_bjmCC = L_bmCC * exp(tW_mCC((tW_mCC(:,1) <= tT_jmCC),1) *  rT_jmCC/ 3);
  L_ji_CC = L_imCC - (L_imCC - L_jmCC) * exp( - rT_BmCC * (tW_mCC(tW_mCC(:,1) > tT_jmCC,1) + tT_jmCC)); % cm, structural length at time
%   EWw_CC = [L_bjmCC; L_ji_CC].^3 * (1 + f * w_mCC);
  EWw_CC = L_ji_CC.^3 * (1 + f * w_mCC);
  
  % length-length
%   ELw_mCC = LL_mCC(:,1) * del_MT_mCC/ del_M; % cm, carapace length

  % Male morphotype GC1
  %time-weigth
  [t_jmGC1, t_pmGC1, t_bmGC1, l_jmGC1, l_pmGC1, l_bmGC1, l_imGC1, rho_jmGC1, rho_BmGC1] = get_tj(pars_tjmGC1, f);
  kT_M = k_M * TC_28;
  rT_jmGC1 = rho_jmGC1 * kT_M; 
  rT_BmGC1 = rho_BmGC1 * kT_M;
  tT_jmGC1 = (t_jmGC1 - t_bmGC1)/ kT_M;
  L_bmGC1 = L_mmGC1 * l_bmGC1;  L_jmGC1 = L_mmGC1 * l_jmGC1; L_imGC1 = L_mmGC1 * l_imGC1;
%   L_bjmGC1 = L_bmGC1 * exp(tW_mGC1((tW_mGC1(:,1) <= tT_jmGC1),1) *  rT_jmGC1/ 3);
  L_ji_GC1 = L_imGC1 - (L_imGC1 - L_jmGC1) * exp( - rT_BmGC1 * (tW_mGC1(tW_mGC1(:,1) > tT_jmGC1,1) + tT_jmGC1)); % cm, structural length at time
%   EWw_GC1 = [L_bjmGC1; L_ji_GC1].^3 * (1 + f * w_mGC1);
  EWw_GC1 = L_ji_GC1.^3 * (1 + f * w_mGC1);

  % length-length
%   ELw_mGC1 = LL_mGC1(:,1) * del_MT_mGC1/ del_M; % cm, carapace length

  % Male morphotype GC2
  %time-weigth
  [t_jmGC2, t_pmGC2, t_bmGC2, l_jmGC2, l_pmGC2, l_bmGC2, l_imGC2, rho_jmGC2, rho_BmGC2] = get_tj(pars_tjmGC2, f);
  kT_M = k_M * TC_28;
  rT_jmGC2 = rho_jmGC2 * kT_M; 
  rT_BmGC2 = rho_BmGC2 * kT_M;
  tT_jmGC2 = (t_jmGC2 - t_bmGC2)/ kT_M;
  L_bmGC2 = L_mmGC2 * l_bmGC2;  L_jmGC2 = L_mmGC2 * l_jmGC2; L_imGC2 = L_mmGC2 * l_imTC;
%   L_bjmGC2 = L_bmGC2 * exp(tW_mGC2((tW_mGC2(:,1) <= tT_jmGC2),1) *  rT_jmGC2/ 3);
  L_ji_GC2 = L_imGC2 - (L_imGC2 - L_jmGC2) * exp( - rT_BmGC2 * (tW_mGC2(tW_mGC2(:,1) > tT_jmGC2,1) - tT_jmGC2)); % cm, structural length at time
%   EWw_GC2 = [L_bjmGC2; L_ji_GC2].^3 * (1 + f * w_mGC2);
  EWw_GC2 = L_ji_GC2.^3 * (1 + f * w_mGC2);

  % length-length
%   ELw_mGC2 = LL_mGC2(:,1) * del_MT_mGC2/ del_M; % cm, carapace length

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
%   prdData.tL_JT25 = ELw_JT25;
%   prdData.tL_JT30 = ELw_JT30;
  prdData.LW_F = EW_F;
  prdData.LN_F = EN_F;
%   prdData.LL_F = ELw_F;
%   prdData.tL_F = EL_F;
%   prdData.LL_mTC = ELw_mTC;
  prdData.tW_mTC = EWw_TC;
%   prdData.LL_mCC = ELw_mCC;
  prdData.tW_mCC = EWw_CC;
%   prdData.LL_mGC1 = ELw_mGC1;
  prdData.tW_mGC1 = EWw_GC1;
%   prdData.LL_mGC2 = ELw_mGC2;
  prdData.tW_mGC2 = EWw_GC2;
end
