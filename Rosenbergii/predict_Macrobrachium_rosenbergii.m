%% predict_Macrobrachium_rosenbergii
% Obtains predictions, using parameters and data

%%
function [prdData, info] = predict_Macrobrachium_rosenbergii(par, data, auxData)
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/01/30; 
  % last modified 2015/07/29
  
  %% Syntax
  % [prdData, info] = <../predict_my_pet.m *predict_my_pet*>(par, data, auxData)
  
  %% Description
  % Obtains predictions, using parameters and data
  %
  % Input
  %
  % * par: structure with parameters (see below)
  % * data: structure with data (not all elements are used)
  % * auxData : structure with temp data and other potential environmental data
  %  
  % Output
  %
  % * prdData: structure with predicted values for data
  % * info: identified for correct setting of predictions (see remarks)
  
  %% Remarks
  % Template for use in add_my_pet.
  % The code calls <parscomp_st.html *parscomp_st*> in order to compute
  % scaled quantities, compound parameters, molecular weights and compose
  % matrixes of mass to energy couplers and chemical indices.
  % With the use of filters, setting info = 0, prdData = {}, return, has the effect
  % that the parameter-combination is not selected for finding the
  % best-fitting combination; this setting acts as customized filter.
  
  %% Example of a customized filter
  % See the lines just below unpacking
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  %   filterChecks = k * v_Hp >= f_tL^3 || ...         % constraint required for reaching puberty with f_tL
  %                  ~reach_birth(g, k, v_Hb, f_tL);...   % constraint required for reaching birth with f_tL
  %   
  %   if filterChecks  
  %     info = 0;
  %     prdData = {};
  %     return;
  %   end  
   
%   if kap > 0.95 || z > 1.2|| k_J < 0.001 || f > 1.6 || f < 0.6
%   prdData = []; info = 0; return 
%   end
  
  % compute temperature correction factors
  TC_28 = tempcorr(temp.ab, T_ref, T_A);
  TC_tL_F = tempcorr(temp.tL_F, T_ref, T_A);
%   TC_tW_J = tempcorr(temp.tW_J, T_ref, T_A);
  TC_tW_SM = tempcorr(temp.tW_SM, T_ref, T_A);
  TC_tW_OC = tempcorr(temp.tW_OC, T_ref, T_A);
  TC_tW_BC = tempcorr(temp.tW_BC, T_ref, T_A);
  kT_M = k_M * TC_28;                  % 1/d, som maint rate coeff

% uncomment if you need this for computing moles of a gas to a volume of gas
% - else feel free to delete  these lines
% molar volume of gas at 1 bar and 20 C is 24.4 L/mol
% T = C2K(20); % K, temp of measurement equipment- apperently this is
% always the standard unless explicitely stated otherwise in a paper (pers.
% comm. Mike Kearney).
% X_gas = T_ref/ T/ 24.4;  % M,  mol of gas per litre at T_ref and 1 bar;
  
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
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_F = L_i/ del_M;              % cm, ultimate total length at f for female
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
 
  % ultimate for Males BC
  p_Am_mBC = z_BC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mBC = f * kap * p_Am_mBC / p_M;     % cm, ultimate structural length at f
  Lw_i_mBC = L_i_mBC/ del_MT_mBC;              % cm, ultimate total length at f

  % ultimate for Males OC
  p_Am_mOC = z_OC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mOC = f * kap * p_Am_mOC / p_M;     % cm, ultimate structural length at f
  Lw_i_mOC = L_i_mOC/ del_MT_mOC;              % cm, ultimate total length at f

  % ultimate for Males SM
  p_Am_mSM = z_SM * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
  L_i_mSM = f * kap * p_Am_mSM / p_M;     % cm, ultimate structural length at f
  Lw_i_mSM = L_i_mSM/ del_MT_mSM;              % cm, ultimate total length at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_28 * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_28;               % d, mean life span at T
  
  % males
  %BC
  p_Am_mBC = z_BC * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mBC = p_Am_mBC/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mBC = E_G/ (kap* E_m_mBC);             % -, energy investment ratio
  m_Em_mBC = y_E_V * E_m_mBC/ E_G;         % mol/mol, reserve capacity 
  w_mBC = m_Em_mBC * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmBC = v/ k_M/ g_mBC;                  % cm, max struct length
  pars_tjmBC = [g_mBC k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males

  %OC
  p_Am_mOC = z_OC * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mOC = p_Am_mOC/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mOC = E_G/ (kap* E_m_mOC);             % -, energy investment ratio
  m_Em_mOC = y_E_V * E_m_mOC/ E_G;         % mol/mol, reserve capacity 
  w_mOC = m_Em_mOC * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmOC = v/ k_M/ g_mOC;                  % cm, max struct length
  pars_tjmOC = [g_mOC k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males

  %SM
  p_Am_mSM = z_SM * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mSM = p_Am_mSM/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mSM = E_G/ (kap* E_m_mSM);             % -, energy investment ratio
  m_Em_mSM = y_E_V * E_m_mSM/ E_G;         % mol/mol, reserve capacity 
  w_mSM = m_Em_mSM * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmSM = v/ k_M/ g_mSM;                  % cm, max struct length
  pars_tjmSM = [g_mSM k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males

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
%     [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
%     kT_M = k_M * TC_tW_J; 
%     rT_j = rho_j * kT_M; 
%     rT_B = rho_B * kT_M;        
%     L_b = L_m * l_b;  
%     L_J = L_b * exp(rT_j * tW_J(:,1)/ 3);  
%     EWw_J = L_J.^3 * (1 + f * w) * 1e6; % g, wet weight
    
    %Female
    %time-length
    [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
    kT_M = k_M * TC_tL_F; 
    rT_B = rho_B * kT_M; 
    rT_j = rho_j * kT_M; 
    tT_j = (t_j - t_b)/ kT_M;
    L_b = L_m * l_b;  
    L_j = L_m * l_j; 
    L_i = L_m * l_i;
    L_bj = L_b * exp(tL_F(tL_F(:,1) < tT_j,1) * rT_j/ 3);
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_F(tL_F(:,1) >= tT_j,1) - tT_j)); 
    ELw_F = [L_bj; L_ji]/ del_M; % cm, total length
    
    %length-weigth
    EWw_F = (LW_F(:,1) * del_M).^3 * (1 + f * w);
   
    %Males
    %SM
    %time-weigth
%     [t_jmSM, t_pmSM, t_bmSM, l_jmSM, l_pmSM, l_bmSM, l_imSM, rho_jmSM, rho_BmSM] = get_tj(pars_tjmSM, f);
%     kT_M = k_M * TC_tW_SM; 
%     rT_jmSM = rho_jmSM * kT_M; 
%     rT_BmSM = rho_BmSM * kT_M; 
%     tT_jmSM = (t_jmSM - t_bmSM)/ kT_M;
%     L_jmSM = L_mmSM * l_jmSM;  
%     p_Am_mSM = z_SM * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
%     L_i_SM = f * kap * p_Am_mSM / p_M;     % cm, ultimate structural length at f
%     L_SM = L_i_SM - (L_i_SM - L_jmSM) * exp( - rT_BmSM * tW_SM(:,1)); % cm, struct length
%     EWw_SM = L_SM.^3 * (1 + f * w_mSM); % g, wet weight
  
    [t_jmSM, t_pmSM, t_bmSM, l_jmSM, l_pmSM, l_bmSM, l_imSM, rho_jmSM, rho_BmSM] = get_tj(pars_tjmSM, f);
    kT_M = k_M * TC_tW_SM;
    rT_jmSM = rho_jmSM * kT_M; 
    rT_BmSM = rho_BmSM * kT_M;
    tT_jmSM = (t_jmSM - t_bmSM)/ kT_M;
    L_bmSM = L_mmSM * l_bmSM;  L_jmSM = L_mmSM * l_jmSM; L_imSM = L_mmSM * l_imSM;
    L_bjmSM = L_bmSM * exp(tW_SM((tW_SM(:,1) <= tT_j),1) *  rT_j/ 3);
    p_Am_SM = z_SM * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
    L_i_SM = f * kap * p_Am_SM / p_M;     % cm, ultimate structural length at f
    L_ji_SM = L_i_SM - (L_i_SM - L_jmSM) * exp( - rT_BmSM * (tW_SM((tW_SM(:,1) > tT_jmSM),1) - tT_jmSM)); % cm, structural length at time
    EWw_SM = [L_bjmSM; L_ji_SM].^3 * (1 + f * w_mSM);

    %OC
    %time-weigth
%     [t_jmOC, t_pmOC, t_bmOC, l_jmOC, l_pmOC, l_bmOC, l_imOC, rho_jmOC, rho_BmOC] = get_tj(pars_tjmOC, f);
%     kT_M = k_M * TC_tW_OC; 
%     rT_jmOC = rho_jmOC * kT_M; 
%     rT_BmOC = rho_BmOC * kT_M; 
%     tT_jmOC = (t_jmOC - t_bmOC)/ kT_M;
%     L_jmOC = L_mmOC * l_jmOC;  
%     p_Am_mOC = z_OC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
%     L_i_OC = f * kap * p_Am_mOC / p_M;     % cm, ultimate structural length at f
%     L_OC = L_i_OC - (L_i_OC - L_jmOC) * exp( - rT_BmOC * tW_OC(:,1)); % cm, struct length
%     EWw_OC = L_OC.^3 * (1 + f * w_mOC); % g, wet weight
  
    [t_jmOC, t_pmOC, t_bmOC, l_jmOC, l_pmOC, l_bmOC, l_imOC, rho_jmOC, rho_BmOC] = get_tj(pars_tjmOC, f);
    kT_M = k_M * TC_tW_OC;
    rT_jmOC = rho_jmOC * kT_M; 
    rT_BmOC = rho_BmOC * kT_M;
    tT_jmOC = (t_jmOC - t_bmOC)/ kT_M;
    L_bmOC = L_mmOC * l_bmOC;  L_jmOC = L_mmOC * l_jmOC; L_imOC = L_mmOC * l_imOC;
    L_bjmOC = L_bmOC * exp(tW_OC((tW_OC(:,1) <= tT_j),1) *  rT_j/ 3);
    p_Am_OC = z_OC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
    L_i_OC = f * kap * p_Am_OC / p_M;     % cm, ultimate structural length at f
    L_ji_OC = L_i_OC- (L_i_OC - L_jmOC) * exp( - rT_BmOC * (tW_OC((tW_OC(:,1) > tT_jmOC),1) - tT_jmOC)); % cm, structural length at time
    EWw_OC = [L_bjmOC; L_ji_OC].^3 * (1 + f * w_mOC);


    %BC
    %time-weigth
%     [t_jmBC, t_pmBC, t_bmBC, l_jmBC, l_pmBC, l_bmBC, l_imBC, rho_jmBC, rho_BmBC] = get_tj(pars_tjmBC, f);
%     kT_M = k_M * TC_tW_BC; 
%     rT_jmBC = rho_jmBC * kT_M; 
%     rT_BmBC = rho_BmBC * kT_M; 
%     tT_jmBC = (t_jmBC - t_bmBC)/ kT_M;
%     L_jmBC = L_mmBC * l_jmBC;  
%     p_Am_mBC = z_BC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
%     L_i_BC = f * kap * p_Am_mBC / p_M;     % cm, ultimate structural length at f
%     L_BC = L_i_BC - (L_i_BC - L_jmBC) * exp( - rT_BmBC * tW_BC(:,1)); % cm, struct length
%     EWw_BC = L_BC.^3 * (1 + f * w_mBC); % g, wet weight
    
    [t_jmBC, t_pmBC, t_bmBC, l_jmBC, l_pmBC, l_bmBC, l_imBC, rho_jmBC, rho_BmBC] = get_tj(pars_tjmBC, f);
    kT_M = k_M * TC_tW_BC;
    rT_jmBC = rho_jmBC * kT_M; 
    rT_BmBC = rho_BmBC * kT_M;
    tT_jmBC = (t_jmBC - t_bmBC)/ kT_M;
    L_bmBC = L_mmBC * l_bmBC;  L_jmBC = L_mmBC * l_jmBC; L_imBC = L_mmBC * l_imBC;
    L_bjmBC = L_bmBC * exp(tW_BC((tW_BC(:,1) <= tT_j),1) *  rT_j/ 3);
    p_Am_BC = z_BC * p_M/ kap;            % J/d.cm^2, {p_Am} spec assimilation flux  
    L_i_BC = f * kap * p_Am_BC / p_M;     % cm, ultimate structural length at f
    L_ji_BC = L_i_BC - (L_i_BC - L_jmBC) * exp( - rT_BmBC * (tW_BC((tW_BC(:,1) > tT_jmBC),1) - tT_jmBC)); % cm, structural length at time
    EWw_BC = [L_bjmBC; L_ji_BC].^3 * (1 + f * w_mBC);
  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
 %   prdData.tW_J = EWw_J;
  prdData.tL_F = ELw_F;
  prdData.LW_F = EWw_F;
  prdData.tW_SM = EWw_SM;
  prdData.tW_OC = EWw_OC;
  prdData.tW_BC = EWw_BC;
  
  