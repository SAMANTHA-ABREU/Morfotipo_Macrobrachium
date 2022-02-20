function [prdData, info] = predict_Macrobrachium_amazonicum(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_LN_F = tempcorr(temp.LN_F, T_ref, T_A);
  TC_tW_mTC = tempcorr(temp.tW_mTC, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w);  % g, dry weight at birth
  aT_b = t_b/ k_M/ TC_ab;     % d, age at birth at f and T 24 °C
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Ww_j = L_j^3 *(1 + f * w);        % g, wet weight at metam
  tT_j = (t_j-t_b)/ k_M/ TC_tj; % d, time since birth at metam at f and T

  % puberty 
  % We are considering that, after puberty, males have different pAm

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_F = L_i/ del_M;              % cm, ultimate total length at f for female

  % ultimate for Males TC
  k_MmTC = p_MTC/E_G;
  k_mTC = k_J/k_MmTC;
  L_mmTC = v/ k_MmTC/ g;                  % cm, max struct length
  pars_tjmTC = [g k_mTC l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males TC
  [t_jmTC, t_pmTC, t_bmTC, l_jmTC, l_pmTC, l_bmTC, l_imTC, rho_jmTC, rho_BmTC] = get_tj(pars_tjmTC, f);   
  L_imTC = L_mmTC * l_imTC;    % cm, ultimate structural length at f
  Lw_i_mTC = L_imTC/ del_M;                % cm, ultimate total length at f
  Ww_i_mTC = L_imTC^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males CC
  k_MmCC = p_MCC/E_G;
  k_mCC = k_J/k_MmCC;
  L_mmCC = v/ k_MmCC/ g;                  % cm, max struct length
  pars_tjmCC = [g k_mCC l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males CC
  [t_jmCC, t_pmCC, t_bmCC, l_jmCC, l_pmCC, l_bmCC, l_imCC, rho_jmCC, rho_BmCC] = get_tj(pars_tjmCC, f);
  L_imCC = L_mmCC * l_imCC;     % cm, ultimate structural length at f
  Lw_i_mCC = L_imCC/ del_M;              % cm, ultimate total length at f
  Ww_i_mCC = L_imCC^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males GC1
  k_MmGC1 = p_MGC1/E_G;
  k_mGC1 = k_J/k_MmGC1;
  L_mmGC1 = v/ k_MmGC1/ g;                  % cm, max struct length
  pars_tjmGC1 = [g k_mGC1 l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males GC1
  [t_jmGC1, t_pmGC1, t_bmGC1, l_jmGC1, l_pmGC1, l_bmGC1, l_imGC1, rho_jmGC1, rho_BmGC1] = get_tj(pars_tjmGC1, f);
  L_imGC1 = L_mmGC1 * l_imGC1;     % cm, ultimate structural length at f
  Lw_i_mGC1 = L_imGC1/ del_M;              % cm, ultimate total length at f
  Ww_i_mGC1 = L_imGC1^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males GC2
  k_MmGC2 = p_MGC2/E_G;
  k_mGC2 = k_J/k_MmGC2;
  L_mmGC2 = v/ k_MmGC2/ g;                  % cm, max struct length
  pars_tjmGC2 = [g k_mGC2 l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males GC2
  [t_jmGC2, t_pmGC2, t_bmGC2, l_jmGC2, l_pmGC2, l_bmGC2, l_imGC2, rho_jmGC2, rho_BmGC2] = get_tj(pars_tjmGC2, f);
  L_imGC2 = L_mmGC2 * l_imGC2;     % cm, ultimate structural length at f
  Lw_i_mGC2 = L_imGC2/ del_M;              % cm, ultimate total length at f
  Ww_i_mGC2 = L_imGC2^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = aT_b;
  prdData.Wdb = Wd_b;
  prdData.tj = tT_j;
  prdData.Wwj = Ww_j;
  prdData.Li_F = Lw_i_F;
  prdData.Wwi_TC = Ww_i_mTC;
  prdData.Wwi_CC = Ww_i_mCC;
  prdData.Wwi_GC1 = Ww_i_mGC1;
  prdData.Li_GC2 = Lw_i_mGC2;
  prdData.Wwi_GC2 = Ww_i_mGC2;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % Female
  % length- weight
  EW_F = (LW_F(:,1) * del_M).^3 * (1 + f * w); % g, wet weight  

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_F = TC_LN_F * reprod_rate_j(LN_F(:,1) * del_M, f, pars_R);% #, fecundity and length

  % Males
  % After puberty males growth with different pAm
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (t_p-t_j)/ kT_M;           % d, time since metam at puberty at f

  % Male morphotype TC
  % time-weight
  kT_MmTC = k_MmTC * TC_tW_mTC;
  rT_BmTC = rho_BmTC * kT_MmTC;
  L_ji_TC = L_imTC - (L_imTC - L_p) * exp( - rT_BmTC * (tW_mTC(:,1) - tT_p)); % cm, structural length at time
  EWw_TC = L_ji_TC.^3 * (1 + f * w);
  
  % Male morphotype CC
  %time-weigth
  kT_MmCC = k_MmCC * TC_tW_mTC;
  rT_BmCC = rho_BmCC * kT_MmCC;
  L_ji_CC = L_imCC - (L_imCC - L_p) * exp( - rT_BmCC * (tW_mCC(:,1) - tT_p)); % cm, structural length at time
  EWw_CC = L_ji_CC.^3 * (1 + f * w);
  
  % Male morphotype GC1
  % time-weight
  kT_MmGC1 = k_MmGC1 * TC_tW_mTC;
  rT_BmGC1 = rho_BmGC1 * kT_MmGC1;
  L_ji_GC1 = L_imGC1 - (L_imGC1 - L_p) * exp( - rT_BmGC1 * (tW_mGC1(:,1) - tT_p)); % cm, structural length at time
  EWw_GC1 = L_ji_GC1.^3 * (1 + f * w);

  % Male morphotype GC2
  %time-weigth
  kT_MmGC2 = k_MmGC2 * TC_tW_mTC;
  rT_BmGC2 = rho_BmGC2 * kT_MmGC2;
  L_ji_GC2 = L_imGC2 - (L_imGC2 - L_p) * exp( - rT_BmGC2 * (tW_mGC2(:,1) - tT_p)); % cm, structural length at time
  EWw_GC2 = L_ji_GC2.^3 * (1 + f * w);

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.LN_F = EN_F;
  prdData.LW_F = EW_F;
  prdData.tW_mTC = EWw_TC;
  prdData.tW_mCC = EWw_CC;
  prdData.tW_mGC1 = EWw_GC1;
  prdData.tW_mGC2 = EWw_GC2;
end
