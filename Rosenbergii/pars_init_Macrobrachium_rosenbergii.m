function [par, metaPar, txtPar] = pars_init_Macrobrachium_rosenbergii(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.2187;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0012873;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.66857;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 529.6147;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002018;   free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4446.2427;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.086e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.990e-01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.295e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.500e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.Ww_0 = 0.123;     free.Ww_0  = 0;   units.Ww_0 = 'g';         label.Ww_0 = 'wet weight at time zero in tW data'; 
par.del_M = 0.041025;  free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_MT_mBC = 0.23766;  free.del_MT_mBC = 0;   units.del_MT_mBC = '-';   label.del_MT_mBC = 'shape coefficient for total length for male BC'; 
par.del_MT_mOC = 0.23084;  free.del_MT_mOC = 0;   units.del_MT_mOC = '-';   label.del_MT_mOC = 'shape coefficient for total length for male OC'; 
par.del_MT_mSM = 0.15914;  free.del_MT_mSM = 0;   units.del_MT_mSM = '-';   label.del_MT_mSM = 'shape coefficient for total length for male SM'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.z_BC = 7.8007;    free.z_BC  = 0;   units.z_BC = '-';         label.z_BC = 'zoom factor for males BC'; 
par.z_OC = 5.4961;    free.z_OC  = 0;   units.z_OC = '-';         label.z_OC = 'zoom factor for males OC'; 
par.z_SM = 2.4732;    free.z_SM  = 0;   units.z_SM = '-';         label.z_SM = 'zoom factor for males SM'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
