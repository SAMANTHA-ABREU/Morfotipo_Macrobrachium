function [par, metaPar, txtPar] = pars_init_Macrobrachium_amazonicum(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.058604;     free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0017205;    free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99104;    free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 2688.5626;  free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4443.4092;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.534e-04; free.E_Hb  = 0;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 6.932e-01; free.E_Hj  = 0;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.158e+01; free.E_Hp  = 0;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.037e-06;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.066914;  free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.p_MCC = 3555.3586;  free.p_MCC = 1;   units.p_MCC = 'J/d.cm^3';  label.p_MCC = '[p_M], vol-spec somatic maint for males CC'; 
par.p_MGC1 = 2488.7247;  free.p_MGC1 = 1;   units.p_MGC1 = 'J/d.cm^3';  label.p_MGC1 = '[p_M], vol-spec somatic maint for males GC1'; 
par.p_MGC2 = 2303.9942;  free.p_MGC2 = 1;   units.p_MGC2 = 'J/d.cm^3';  label.p_MGC2 = '[p_M], vol-spec somatic maint for males GC2'; 
par.p_MTC = 4272.6886;  free.p_MTC = 1;   units.p_MTC = 'J/d.cm^3';  label.p_MTC = '[p_M], vol-spec somatic maint for males TC'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
