function [prdData, info] = predict_Macrobrachium_amazonicum(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC= tempcorr(temp.ab, T_ref, T_A); 
  TC_WwN_F = tempcorr(temp.WwN_F, T_ref, T_A);
  TC_LN_F = tempcorr(temp.LN_F, T_ref, T_A);
  kT_M = k_M * TC;                  % 1/d, som maint rate coeff

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  t_0 = 0;
  aT_b = t_0 + t_b/ kT_M;        % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
  tT_j = (t_j-t_b)/ kT_M;           % d, time since birth at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  L_p = L_p/ del_M;                 % cm, total length at puberty at f 
  tT_p = (t_p-t_j)/ kT_M;           % d, time since metam at puberty at f


  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_F = L_i/ del_M;              % cm, ultimate total length at f for female
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % ultimate for Males TC
  p_Am_mTC = z_mTC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mTC = f * kap * p_Am_mTC / p_M;     % cm, ultimate structural length at f
  Lw_i_mTC = L_i_mTC/ del_MT_mTC;              % cm, ultimate total length at f

  % ultimate for Males CC
  p_Am_mCC = z_mCC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mCC = f * kap * p_Am_mCC / p_M;     % cm, ultimate structural length at f
  Lw_i_mCC = L_i_mCC/ del_MT_mCC;              % cm, ultimate total length at f

  % ultimate for Males GC1
  p_Am_mGC1 = z_mGC1 * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mGC1 = f * kap * p_Am_mGC1 / p_M;     % cm, ultimate structural length at f
  Lw_i_mGC1 = L_i_mGC1/ del_MT_mGC1;              % cm, ultimate total length at f

  % ultimate for Males GC2
  p_Am_mGC2 = z_mGC2 * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mGC2 = f * kap * p_Am_mGC2 / p_M;     % cm, ultimate structural length at f
  Lw_i_mGC2 = L_i_mGC2/ del_MT_mGC2;              % cm, ultimate total length at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                  % d, mean life span at T

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.Lp = L_p;
  prdData.Li_F = Lw_i_F;
  prdData.Li_TC = Lw_i_mTC;
  prdData.Li_CC = Lw_i_mCC;
  prdData.Li_GC1 = Lw_i_mGC1;
  prdData.Li_GC2 = Lw_i_mGC2;
  prdData.Wdb = Wd_b;
  prdData.Ri = RT_i;

  % uni-variate data
  % We are considering that, afer puberty, males have different zoom factors
  % Female
  % wet weight-fecundity
  L_F = (WwN_F(:,1)./ (1 + f * w)).^(1/3);   % cm, structural length
  WwE_F = TC_WwN_F * 365 * reprod_rate_j(L_F, f, pars_R);  % annual fecundity

  % length-wet weight
  EWw_F = (LW_F(:,1) * del_MT_F).^3 * (1 + f * w); % g, wet weight  

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_F = TC_LN_F * 365 * reprod_rate_j(LN_F(:,1) * del_MT_F, f, pars_R);% #, fecundity and length

  % Males
  % Male morphotype TC
  % length-length
  ELw_mTC = LL_mTC(:,1) * del_MT_mTC/ del_M; % cm, carapace length

  % Male morphotype CC
  % length-length
  ELw_mCC = LL_mCC(:,1) * del_MT_mCC/ del_M; % cm, carapace length

  % Male morphotype GC1
  % length-length
  ELw_mGC1 = LL_mGC1(:,1) * del_MT_mGC1/ del_M; % cm, carapace length

  % Male morphotype GC2
  % length-length
  ELw_mGC2 = LL_mGC2(:,1) * del_MT_mGC2/ del_M; % cm, carapace length

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.WwN_F = WwE_F;
  prdData.LW_F = EWw_F;
  prdData.LN_F = EN_F;
  prdData.LL_mTC = ELw_mTC;
  prdData.LL_mCC = ELw_mCC;
  prdData.LL_mGC1 = ELw_mGC1;
  prdData.LL_mGC2 = ELw_mGC2;
end