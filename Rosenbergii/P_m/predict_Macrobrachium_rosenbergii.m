function [prdData, info] = predict_Macrobrachium_rosenbergii(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
     
  % compute temperature correction factors
  TC_28 = tempcorr(temp.ab, T_ref, T_A);
  TC_tW_SM = tempcorr(temp.tW_SM, T_ref, T_A);
  TC_tW_OC = tempcorr(temp.tW_OC, T_ref, T_A);
  TC_tW_BC = tempcorr(temp.tW_BC, T_ref, T_A);
  kT_M = k_M * TC_28;                  % 1/d, som maint rate coeff

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  aT_b = t_b/ kT_M;           % d, age at birth at f and T
  
  % metam
  tT_j = (t_j-t_b)/ kT_M;           % d, time since birth at metam at f and T
  
  % puberty 
  tT_p = t_p/ kT_M;           % d, time at puberty at f and T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;               % d, mean life span at T


  % ultimate weight for females
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i_F = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_28 * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % ultimate for males BC
  k_MmBC = p_MBC/E_G;
  k_mBC = k_J/k_MmBC;
  L_mmBC = v/ k_MmBC/ g;                  % cm, max struct length
  pars_tjmBC = [g k_mBC l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males
  [t_jmBC, t_pmBC, t_bmBC, l_jmBC, l_pmBC, l_bmBC, l_imBC, rho_jmBC, rho_BmBC] = get_tj(pars_tjmBC, f);
  L_imBC = L_mmBC * l_imBC;     % cm, ultimate structural length at f
  Lw_i_mBC = L_imBC/ del_M;              % cm, ultimate total length at f
  Ww_i_mBC = L_imBC^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males OC
  k_MmOC = p_MOC/E_G;
  k_mOC = k_J/k_MmOC;
  L_mmOC = v/ k_MmOC/ g;                  % cm, max struct length
  pars_tjmOC = [g k_mOC l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males
  [t_jmOC, t_pmOC, t_bmOC, l_jmOC, l_pmOC, l_bmOC, l_imOC, rho_jmOC, rho_BmOC] = get_tj(pars_tjmOC, f);
  L_imOC = L_mmOC * l_imOC;     % cm, ultimate structural length at f
  Lw_i_mOC = L_imOC/ del_M;              % cm, ultimate total length at f
  Ww_i_mOC = L_imOC^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males SM
  k_MmSM = p_MSM/E_G;
  k_mSM = k_J/k_MmSM;
  L_mmSM = v/ k_MmSM/ g;                  % cm, max struct length
  pars_tjmSM = [g k_mSM l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males
  [t_jmSM, t_pmSM, t_bmSM, l_jmSM, l_pmSM, l_bmSM, l_imSM, rho_jmSM, rho_BmSM] = get_tj(pars_tjmSM, f);
  L_imSM = L_mmSM * l_imSM;               % cm, ultimate structural length at f
  Lw_imSM = L_imSM/ del_M;               % cm, ultimate total length at f
  Ww_i_mSM = L_imSM^3 * (1 + f * w);  % g, ultimate wet weight 

  
  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Ri = RT_i;
  prdData.Wwi_F = Ww_i_F;
  prdData.Wwi_BC = Ww_i_mBC;
  prdData.Wwi_OC = Ww_i_mOC;
  prdData.Wwi_SM = Ww_i_mSM;
  
% uni-variate data
   
  %Female
  %length-weigth
  EWw_F = (LW_F(:,1) * del_M).^3 * (1 + f * w);
  
  %Males
  % After puberty males growth with different pAm
  kT_M = k_M * TC_tW_SM;
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (t_p-t_j)/ kT_M;           % d, time since metam at puberty at f
  
  %SM
  %time-weigth
  kT_MmSM = k_MmSM * TC_tW_SM;
  rT_BmSM = rho_BmSM * kT_MmSM;
  L_ji_SM = L_imSM - (L_imSM - L_p) * exp( - rT_BmSM * (tW_SM(:,1) - tT_p)); % cm, structural length at time
  EWw_SM = L_ji_SM.^3 * (1 + f * w);

  %OC
  %time-weigth
  kT_MmOC = k_MmOC * TC_tW_OC;
  rT_BmOC = rho_BmOC * kT_MmOC;
  L_ji_OC = L_imOC - (L_imOC - L_p) * exp( - rT_BmOC * (tW_OC(:,1) - tT_p)); % cm, structural length at time
  EWw_OC = L_ji_OC.^3 * (1 + f * w);

  %BC
  %time-weigth
  kT_MmBC = k_MmBC * TC_tW_BC;
  rT_BmBC = rho_BmBC * kT_MmBC;
  L_ji_BC = L_imBC - (L_imBC - L_p) * exp( - rT_BmBC * (tW_BC(:,1) - tT_p)); % cm, structural length at time
  EWw_BC = L_ji_BC.^3 * (1 + f * w);
  
  % pack to output
  prdData.LW_F = EWw_F;
  prdData.tW_SM = EWw_SM;
  prdData.tW_OC = EWw_OC;
  prdData.tW_BC = EWw_BC;