function [prdData, info] = predict_Macrobrachium_rosenbergii(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
     
  % compute temperature correction factors
  TC_28 = tempcorr(temp.ab, T_ref, T_A);
  TC_tW_J = tempcorr(temp.tW_J, T_ref, T_A);
  TC_tL_F = tempcorr(temp.tL_F, T_ref, T_A);
%   TC_tW_F = tempcorr(temp.tW_F, T_ref, T_A);
  TC_tW_SM = tempcorr(temp.tW_SM, T_ref, T_A);
  TC_tW_OC = tempcorr(temp.tW_OC, T_ref, T_A);
  TC_tW_BC = tempcorr(temp.tW_BC, T_ref, T_A);
  kT_M = k_M * TC_28;                  % 1/d, som maint rate coeff

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
  aT_b = t_b/ k_M/ TC_28;           % d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
  tT_j = (t_j-t_b)/ kT_M;           % d, time since birth at metam at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
  tT_p = t_p/ k_M/ TC_28;           % d, time at puberty at f and T

  % ultimate
%   l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_F = L_i/ del_M;              % cm, ultimate total length at f for female
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
 
  % ultimate for Males BC
%   p_Am_mBC = z_BC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  p_Am_mBC = z_BC * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mBC = p_Am_mBC/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mBC = E_G/ (kap* E_m_mBC);             % -, energy investment ratio
  m_Em_mBC = y_E_V * E_m_mBC/ E_G;         % mol/mol, reserve capacity 
  w_mBC = m_Em_mBC * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmBC = v/ k_M/ g_mBC;                  % cm, max struct length
  pars_tjmBC = [g_mBC k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males
  [t_jmBC, t_pmBC, t_bmBC, l_jmBC, l_pmBC, l_bmBC, l_imBC, rho_jmBC, rho_BmBC] = get_tj(pars_tjmBC, f);
  L_i_mBC = L_mmBC * l_imBC;     % cm, ultimate structural length at f
  Lw_i_mBC = L_i_mBC/ del_MT_mBC;              % cm, ultimate total length at f

  % ultimate for Males OC
%   p_Am_mOC = z_OC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  p_Am_mOC = z_OC * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mOC = p_Am_mOC/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mOC = E_G/ (kap* E_m_mOC);             % -, energy investment ratio
  m_Em_mOC = y_E_V * E_m_mOC/ E_G;         % mol/mol, reserve capacity 
  w_mOC = m_Em_mOC * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmOC = v/ k_M/ g_mOC;                  % cm, max struct length
  pars_tjmOC = [g_mOC k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males
  [t_jmOC, t_pmOC, t_bmOC, l_jmOC, l_pmOC, l_bmOC, l_imOC, rho_jmOC, rho_BmOC] = get_tj(pars_tjmOC, f);
  L_i_mOC = L_mmOC * l_imOC;     % cm, ultimate structural length at f
  Lw_i_mOC = L_i_mOC/ del_MT_mOC;              % cm, ultimate total length at f

  % ultimate for Males SM
%   p_Am_mSM = z_SM * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  p_Am_mSM = z_SM * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mSM = p_Am_mSM/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mSM = E_G/ (kap* E_m_mSM);             % -, energy investment ratio
  m_Em_mSM = y_E_V * E_m_mSM/ E_G;         % mol/mol, reserve capacity 
  w_mSM = m_Em_mSM * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmSM = v/ k_M/ g_mSM;                  % cm, max struct length
  pars_tjmSM = [g_mSM k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males
  [t_jmSM, t_pmSM, t_bmSM, l_jmSM, l_pmSM, l_bmSM, l_imSM, rho_jmSM, rho_BmSM] = get_tj(pars_tjmSM, f);
  L_i_mSM = L_mmSM * l_imSM;     % cm, ultimate structural length at f
  Lw_i_mSM = L_i_mSM/ del_MT_mSM;              % cm, ultimate total length at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_28 * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_28;               % d, mean life span at T
  
  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.Li_F = Lw_i_F;
  prdData.Li_BC = Lw_i_mBC;
  prdData.Li_OC = Lw_i_mOC;
  prdData.Li_SM = Lw_i_mSM;
  prdData.am = aT_m;
  prdData.Ri = RT_i;
  
% uni-variate data
   
  %Juveniles
  %time-weight
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_tW_J; 
  rT_j = rho_j * kT_M; 
  rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  
  L_J = L_b * exp(rT_j * (tW_J(:,1)+ data.tj)/ 3);  
  EWw_J = L_J.^3 * (1 + f * w); % g, wet weight
    
  %Female
  %time-length
  kT_M = k_M * TC_tL_F; 
  rT_B = rho_B * kT_M; 
  rT_j = rho_j * kT_M; 
  tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  
  L_j = L_m * l_j; 
  L_i = L_m * l_i;
  L_bj = L_b * exp(tL_F((tL_F(:,1)+ data.tj) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_F((tL_F(:,1)+ data.tj) >= tT_j,1) - tT_j)); 
  ELw_F = [L_bj; L_ji]/ del_M; % cm, total length
    
  %length-weigth
  EWw_F = (LW_F(:,1) * del_M).^3 * (1 + f * w);
  
  %time-weigth
%   kT_M_f = k_M * TC_tW_F;
%   rT_j_f = rho_j * kT_M_f; 
%   rT_B_f = rho_B * kT_M_f;
%   tT_j_f = (t_j - t_b)/ kT_M_f;
%   L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
%   L_bj = L_b * exp(tW_F(((tW_F(:,1)+ data.tj) <= tT_j_f),1) *  rT_j_f/ 3);
%   L_ji_F = L_i - (L_i - L_j) * exp( - rT_B_f * (tW_F(((tW_F(:,1)+ data.tj) > tT_j_f),1) - tT_j_f)); % cm, structural length at time
%   EW_F = [L_bj; L_ji_F].^3 * (1 + f * w);
  
  %Males
  %SM
  %time-weigth
  [t_jmSM, t_pmSM, t_bmSM, l_jmSM, l_pmSM, l_bmSM, l_imSM, rho_jmSM, rho_BmSM] = get_tj(pars_tjmSM, f);
  kT_M = k_M * TC_tW_SM;
  rT_jmSM = rho_jmSM * kT_M; 
  rT_BmSM = rho_BmSM * kT_M;
  tT_jmSM = (t_jmSM - t_bmSM)/ kT_M;
  L_bmSM = L_mmSM * l_bmSM;  L_jmSM = L_mmSM * l_jmSM; L_i_mSM = L_mmSM * l_imSM;
  L_bjmSM = L_bmSM * exp(tW_SM(((tW_SM(:,1)+ data.tp)<= tT_j),1) *  rT_jmSM/ 3);
  L_ji_SM = L_i_mSM - (L_i_mSM - L_jmSM) * exp( - rT_BmSM * (tW_SM(((tW_SM(:,1)+ data.tp) > tT_jmSM),1) - tT_jmSM)); % cm, structural length at time
  EWw_SM = [L_bjmSM; L_ji_SM].^3 * (1 + f * w_mSM);

  %OC
  %time-weigth
  [t_jmOC, t_pmOC, t_bmOC, l_jmOC, l_pmOC, l_bmOC, l_imOC, rho_jmOC, rho_BmOC] = get_tj(pars_tjmOC, f);
  kT_M = k_M * TC_tW_OC;
  rT_jmOC = rho_jmOC * kT_M; 
  rT_BmOC = rho_BmOC * kT_M;
  tT_jmOC = (t_jmOC - t_bmOC)/ kT_M;
  L_bmOC = L_mmOC * l_bmOC;  L_jmOC = L_mmOC * l_jmOC; L_i_mOC = L_mmOC * l_imOC;
  L_bjmOC = L_bmOC * exp(tW_OC(((tW_OC(:,1)+ data.tp) <= tT_j),1) *  rT_jmOC/ 3);
  L_ji_OC = L_i_mOC- (L_i_mOC - L_jmOC) * exp( - rT_BmOC * (tW_OC(((tW_OC(:,1)+ data.tp) > tT_jmOC),1) - tT_jmOC)); % cm, structural length at time
  EWw_OC = [L_bjmOC; L_ji_OC].^3 * (1 + f * w_mOC);

  %BC
  %time-weigth
  [t_jmBC, t_pmBC, t_bmBC, l_jmBC, l_pmBC, l_bmBC, l_imBC, rho_jmBC, rho_BmBC] = get_tj(pars_tjmBC, f);
  kT_M = k_M * TC_tW_BC;
  rT_jmBC = rho_jmBC * kT_M; 
  rT_BmBC = rho_BmBC * kT_M;
  tT_jmBC = (t_jmBC - t_bmBC)/ kT_M;
  L_bmBC = L_mmBC * l_bmBC;  L_jmBC = L_mmBC * l_jmBC; L_i_mBC = L_mmBC * l_imBC;
  L_bjmBC = L_bmBC * exp(tW_BC(((tW_BC(:,1)+ data.tp) <= tT_j),1) *  rT_jmBC/ 3);
  L_ji_BC = L_i_mBC - (L_i_mBC - L_jmBC) * exp( - rT_BmBC * (tW_BC(((tW_BC(:,1)+ data.tp) > tT_jmBC),1) - tT_jmBC)); % cm, structural length at time
  EWw_BC = [L_bjmBC; L_ji_BC].^3 * (1 + f * w_mBC);
  
  % pack to output
  prdData.tW_J = EWw_J;
  prdData.tL_F = ELw_F;
  prdData.LW_F = EWw_F;
%   prdData.tW_F = EW_F;
  prdData.tW_SM = EWw_SM;
  prdData.tW_OC = EWw_OC;
  prdData.tW_BC = EWw_BC;
