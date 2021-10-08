function [par, metaPar, txtPar] = pars_init_Macrobrachium_amazonicum(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.384;        free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0041;       free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9935;     free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 48.7265;    free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4433.2;     free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.957e-04; free.E_Hb  = 0;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.070e-02; free.E_Hj  = 0;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.271e+00; free.E_Hp  = 0;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.037e-06;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.1445;   free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_MT_F = 0.14415;  free.del_MT_F = 1;   units.del_MT_F = '-';     label.del_MT_F = 'shape coefficient for total length for female'; 
par.del_MT_mCC = 0.096676;  free.del_MT_mCC = 1;   units.del_MT_mCC = '-';   label.del_MT_mCC = 'shape coefficient for total length for male CC'; 
par.del_MT_mGC1 = 0.1013;  free.del_MT_mGC1 = 1;   units.del_MT_mGC1 = '-';  label.del_MT_mGC1 = 'shape coefficient for total length for male GC1'; 
par.del_MT_mGC2 = 0.10127;  free.del_MT_mGC2 = 1;   units.del_MT_mGC2 = '-';  label.del_MT_mGC2 = 'shape coefficient for total length for male GC2'; 
par.del_MT_mTC = 0.09356;  free.del_MT_mTC = 1;   units.del_MT_mTC = '-';   label.del_MT_mTC = 'shape coefficient for total length for male TC'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tW = 1;         free.f_tW  = 0;   units.f_tW = '-';         label.f_tW = 'scaled functional response for tW data'; 
par.z_mCC = 0.94739;  free.z_mCC = 1;   units.z_mCC = '-';        label.z_mCC = 'zoom factor for males CC'; 
par.z_mGC1 = 1.3169;  free.z_mGC1 = 1;   units.z_mGC1 = '-';       label.z_mGC1 = 'zoom factor for males GC1'; 
par.z_mGC2 = 1.604;   free.z_mGC2 = 1;   units.z_mGC2 = '-';       label.z_mGC2 = 'zoom factor for males GC2'; 
par.z_mTC = 0.87948;  free.z_mTC = 1;   units.z_mTC = '-';        label.z_mTC = 'zoom factor for males TC'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
