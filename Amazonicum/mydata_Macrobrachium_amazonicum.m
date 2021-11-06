function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_amazonicum 

%% set metaData

metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_amazonicum'; 
metaData.species_en = 'Amazon River Prawn'; 
metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'O'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, typical body temp
metaData.data_0     = {'ab';'tj';'Lp';'Li_F';'Li_TC';'Li_CC';'Li_GC1';'Li_GC2';'Wdb';'Ri'}; 
metaData.data_1     = {'L-W_F';'L-N_F';'Ww-N_F';'LL_CC';'LL_TC';'LL_GC1';'LL_GC2'};

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Samantha Santos', 'Tan Tjui-Yeuw', 'Fabio Vannucchi'};  
metaData.date_subm = [2020 08 01];  
metaData.email    = {'samanthaabreualves@gmail.com'}; 
metaData.address  = {'UNESP, Universidade Estadual Paulista "Julio de Mesquita Filho", Brazil'}; 

% metaData.curator     = {'FirstName LastName'};
% metaData.email_cur   = {'myname@myuniv.univ'}; 
% metaData.date_acc    = [yyyy mm dd]; 

%% set data
% zero-variate data;

% age 0 is at onset of embryo development
data.ab_T24 = 21.5; units.ab_T24 = 'd'; label.ab_T24 = 'age at birth'; bibkey.ab_T24 = 'Gues1979'; 
  temp.ab_T24 = C2K(24);  units.temp.ab_T24 = 'K'; label.temp.ab_T24 = 'temperature'; 
  comment.ab_T24  = 'Incubation was 19-24 days at 24(2)oC';
data.ab_T30 = 13.5; units.ab_T30 = 'd'; label.ab_T30 = 'age at birth';  bibkey.ab_T30 = 'Gues1979'; 
  temp.ab_T30 = C2K(30);  units.temp.ab_T30 = 'K'; label.temp.ab_T30 = 'temperature'; 
  comment.ab_T30  = 'Incubation was 12-15 days at 30(1)oC';
data.tj = 24.5; units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'Gues1979'; 
  temp.tj = C2K(24);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj  = 'M. amazonicum larvae underwent 8-9 molts (stages) in 23-26 days at 24.0(3)oC';

data.Lp  = 2.96; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Gues1979';
  temp.Lp = C2K(26);  units.temp.Lp = 'K'; label.temp.Lp = 'temperature';
  comment.Lp = 'sexual maturity size';
data.Li_F  = 12.66;   units.Li_F  = 'cm';   label.Li_F  = 'ultimate total length';  bibkey.Li_F  = 'Silv2006';
  comment.Li_F = 'estimate made using the Appeldoorn methodology for female';
data.Li_TC  = 9.4;   units.Li_TC  = 'cm';   label.Li_TC  = 'ultimate total length';  bibkey.Li_TC  = 'Mora2002';
  comment.Li_TC = 'Ultimate length of males TC';
data.Li_CC  = 9.8;   units.Li_CC  = 'cm';   label.Li_CC  = 'ultimate total length';  bibkey.Li_CC  = 'Mora2002';
  comment.Li_CC = 'Ultimate length of males CC';
data.Li_GC1  = 13;   units.Li_GC1  = 'cm';   label.Li_GC1  = 'ultimate total length';  bibkey.Li_GC1  = 'Mora2002';
  comment.Li_GC1 = 'Ultimate length of males GC1';
data.Li_GC2  = 15.84;   units.Li_GC2  = 'cm';   label.Li_GC2  = 'ultimate total length';  bibkey.Li_GC2  = 'Silv2006';
  comment.Li_GC2 = 'estimate made using the Appeldoorn methodology for male GC2';

data.Wdb = 5.86e-6;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';       bibkey.Wdb = 'Hayd2007';

data.Ri  = 3375/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Silv2006';   
  temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% uni-variate data
% Juveniles, indoors (low temperature)
tL_JT25 = [ ... % time since hatching (d), Total length (mm)
50.6	12.3
75.4	17.7
110.5	19.7
132.3	24.2
147.5	27.1
161.5	31.6
173.9	35.4
];
data.tL_JT25 = tL_JT25(:,2)/10; % convert mm to cm
units.tL_JT25   = {'d', 'cm'};  label.tL_JT25 = {'days', 'total length'};  
temp.tL_JT25 = C2K(25);  units.temp.tL_JT25 = 'K'; label.temp.tL_JT25 = 'temperature';
bibkey.tL_JT25 = 'Gues1979'; comment.tL_JT25 = 'Data extracted from Fig.3';

% Juveniles, outdoors (high temperature)
tL_JT30 = [ ... % time since hatching (d), Total length (mm)
35.6	8.6
49.2	11.5
75.4	20.3
112.2	35.3
135.0	48.0
168.0	58.9
224.3	64.4
251.9	66.8
];
data.tL_JT30 = tL_JT30(:,2)/10; % convert mm to cm
units.tL_JT30 = {'d', 'cm'}; label.tL_JT30 = {'days', 'total length'};  
temp.tL_JT30 = C2K(30);  units.temp.tL_JT30 = 'K'; label.temp.tL_JT30 = 'temperature';
bibkey.tL_JT30 = 'Gues1979'; comment.tL_JT30 = 'Data extracted from Fig.3';

% Female
data.LL_F = [ ... % total length (cm),total cephalothorax length (cm)
2.78873	1.2
3.69014	1.64348
4.53521	2.06087
5.38028	2.47826
6.22535	2.86957
7.07042	3.28696
7.91549	3.70435
8.76056	4.12174
9.60563	4.53913
10.4507	4.95652
10.9014	5.16522
 ];
units.LL_F = {'cm', 'cm'}; label.LL_F = {'total length', 'total Cephalothorax length (cm)'};  
temp.LL_F = C2K(27.5);  units.temp.LL_F = 'K'; label.temp.LL_F = 'temperature';
bibkey.LL_F = 'Silv2006';
comment.LL_F = '';

data.LN_F = [ ... % total length (cm), total number of eggs/offspring (#)
5.2045	414.938
5.65418	564.315
6.10385	697.095
6.55353	829.876
7.00321	979.253
7.45289	1112.03
7.90257	1228.22
8.35225	1377.59
8.80193	1510.37
9.25161	1643.15
9.70128	1775.93
10.151	1925.31
10.6006	2058.09
 ];
data.LN_F(:,2) = data.LN_F(:,2) * 365 / 153; % convert to eggs by days
units.LN_F = {'cm', '#'}; label.LN_F = {'total length', 'total number of eggs/offspring'};  
temp.LN_F = C2K(27.5);  units.temp.LN_F = 'K'; label.temp.LN_F = 'temperature';
bibkey.LN_F = 'Silv2006';
comment.LN_F = '';

data.LW_F = [ ... % total length (cm), total weight (g)
2.79184	0.143541
2.98776	0.191388
3.72245	0.382775
4.45714	0.669856
5.19184	1.05263
5.92653	1.5311
6.66122	2.2488
7.39592	2.96651
8.13061	3.92344
8.86531	5.07177
9.6	    6.36364
10.3347	7.89474
10.9224	9.2823
 ];
units.LW_F = {'cm', 'g'}; label.LW_F = {'total length', 'total weight'};  
temp.LW_F = C2K(27.5);  units.temp.LW_F = 'K'; label.temp.LW_F = 'temperature';
bibkey.LW_F = 'Silv2006';
comment.LW_F = '';

% data.tL_F = [ ... % time (months), total length (cm)
% 2 7.7094
% 3 11.1734
% 4 12.7299
% 5 13.4293
% 6 13.7436
% 7 13.8848
% 8 13.9482
% 9 13.9767
% 10 13.9895
% 11 13.9953
% 12 13.9979
%  ];
% data.tL_F(:,1) = data.tL_F(:,1) * 30; % convert months to days by days
% units.tL_F = {'d', 'cm'}; label.tL_F = {'time', 'total length'};  
% temp.tL_F = C2K(27.5);  units.temp.tL_F = 'K'; label.temp.tL_F = 'temperature';
% bibkey.tL_F = 'Silv2006';
% comment.tL_F = '';
% Males
% Male morphotype TC
data.tW_mTC = [ ... % time since metam (months), weight (g) 
67.3	2.18
95.7	2.34
130.7	2.23
175.0	2.29
];
units.tW_mTC = {'d', 'g'}; label.tW_mTC = {'time', 'weight'};  
temp.tW_mTC = C2K(28);  units.temp.tW_mTC = 'K'; label.temp.tW_mTC = 'temperature';
bibkey.tW_mTC = 'Mora2005'; comment.tW_mTC = 'data for males TC extracted from fig. 8';

LL_mTC = [ ... % Log carapace length (mm), Log total length (mm)
1.05497	1.74315
1.08304	1.72030
1.08187	1.73299
1.09006	1.73046
1.09591	1.72792
1.09708	1.71396
1.08421	1.74822
1.08421	1.76853
1.09123	1.79137
1.09240	1.80787
1.10058	1.75457
1.12398	1.74061
1.11930	1.80914
1.12281	1.81294
1.14035	1.81929
1.14971	1.81294
1.16257	1.81294
1.17076	1.80533
1.17427	1.81041
1.18129	1.80787
1.17778	1.77868
1.18246	1.82056
1.16959	1.83071
1.16725	1.83706
1.17778	1.83452
1.16491	1.86878
1.19064	1.84340
1.20000	1.84467
1.21170	1.85355
1.20585	1.84975
1.20117	1.85736
1.20702	1.88147
1.21170	1.88782
1.21988	1.87640
1.21170	1.86878
1.21170	1.86117
1.22807	1.86371
1.23626	1.86878
1.23860	1.89289
1.24561	1.88782
1.25263	1.89289
1.26082	1.88782
1.24561	1.90178
1.24678	1.90431
1.29825	1.90431
1.29825	1.91320
1.29474	1.91827
1.31813	1.93604
1.33567	1.95381
1.33333	1.97284
1.36023	1.96904
];
data.LL_mTC(:,[2 1]) = 10.^(LL_mTC(:,[2 1]));
data.LL_mTC = LL_mTC(:,[2 1])/10;
units.LL_mTC   = {'cm', 'cm'};  label.LL_mTC = {'total length', 'carapace length'};  
bibkey.LL_mTC = 'Mora2002';

%Male morphotype CC
data.tW_mCC = [ ... % time since metam (months), weight (g) 
67.3	4.36
95.7	3.69
130.7	3.90
175.0	3.79
];
units.tW_mCC = {'d', 'g'}; label.tW_mCC = {'time', 'weight'};  
temp.tW_mCC = C2K(28);  units.temp.tW_mCC = 'K'; label.temp.tW_mCC = 'temperature';
bibkey.tW_mCC = 'Mora2005'; comment.tW_mCC = 'data for males CC extracted from fig. 8';

LL_mCC = [ ... % Log carapace length (mm), Log total length (mm)
1.12515	1.81421
1.13684	1.80533
1.15673	1.77868
1.18947	1.84467
1.19532	1.83959
1.21988	1.87640
1.23041	1.82563
1.26433	1.86371
1.25614	1.87640
1.27719	1.90305
1.28655	1.90431
1.28772	1.90939
1.26901	1.91320
1.27368	1.91320
1.27953	1.91447
1.27602	1.92335
1.29942	1.89289
1.30526	1.92970
1.31462	1.93985
1.32164	1.93604
1.32281	1.93096
1.35906	1.90939
1.32398	1.97284
1.35088	1.96015
1.34386	1.99061
];
data.LL_mCC(:,[2 1]) = 10.^(LL_mCC(:,[2 1]));
data.LL_mCC = LL_mCC(:,[2 1])/10;
units.LL_mCC   = {'cm', 'cm'};  label.LL_mCC = {'total length', 'carapace length'};  
bibkey.LL_mCC = 'Mora2002';

%Male morphotype GC1
data.tW_mGC1 = [ ... % time since metam (months), weight (g) 
67.3	6.81
95.7	7.43
130.7	11.48
175.0	11.84
];
units.tW_mGC1 = {'d', 'g'}; label.tW_mGC1 = {'time', 'weight'};  
temp.tW_mGC1 = C2K(28);  units.temp.tW_mGC1 = 'K'; label.temp.tW_mGC1 = 'temperature';
bibkey.tW_mGC1 = 'Mora2005'; comment.tW_mGC1 = 'data for males GC1 extracted from fig. 8';

LL_mGC1 = [ ... % Log carapace length (mm), Log total length (mm)
1.30409	1.94112
1.31696	1.92843
1.37544	1.95254
1.36842	1.98553
1.40585	1.99949
1.40585	2.00330
1.41287	2.00711
1.43158	2.06548
1.43860	2.05279
1.47251	2.04391
1.45731	2.10102
1.47719	2.09594
1.48421	2.08452
1.49825	2.08198
1.49708	2.11497
1.49825	2.14797
1.50994	2.14797
];
data.LL_mGC1(:,[2 1]) = 10.^(LL_mGC1(:,[2 1]));
data.LL_mGC1 = LL_mGC1(:,[2 1])/10;
units.LL_mGC1   = {'cm', 'cm'};  label.LL_mGC1 = {'total length', 'carapace length'};  
bibkey.LL_mGC1 = 'Mora2002';

%Male morphotype GC2
data.tW_mGC2 = [ ... % time since metam (months), weight (g) 
67.3	8.31
95.7	11.38
130.7	13.30
175.0	14.44
];
units.tW_mGC2 = {'d', 'g'}; label.tW_mGC2 = {'time', 'weight'};  
temp.tW_mGC2 = C2K(28);  units.temp.tW_mGC2 = 'K'; label.temp.tW_mGC2 = 'temperature';
bibkey.tW_mGC2 = 'Mora2005'; comment.tW_mGC2 = 'data for males GC2 extracted from fig. 8';

LL_mGC2 = [ ... % Log carapace length (mm), Log total length (mm)
1.29825	1.94492
1.33450	1.93350
1.32865	1.94492
1.32632	1.95761
1.33567	1.97157
1.35205	1.96269
1.34620	1.98680
1.36374	1.98173
1.37076	1.98173
1.37544	2.00711
1.39415	1.99442
1.39415	2.01218
1.42339	2.00584
1.43041	2.02360
1.44678	2.05279
1.44795	2.06041
1.46433	2.05787
1.46433	2.05660
1.47018	2.05787
1.46199	2.06929
1.45380	2.09721
1.45731	2.09086
1.46316	2.08325
1.47018	2.07690
1.47602	2.07310
1.47368	2.09213
1.48538	2.08706
1.48538	2.09467
1.49591	2.08325
1.47251	2.11244
1.48304	2.10736
1.50175	2.10482
1.49708	2.10482
1.50175	2.11497
1.53450	2.11624
];
data.LL_mGC2(:,[2 1]) = 10.^LL_mGC2(:,[2 1]);
data.LL_mGC2 = LL_mGC2(:,[2 1])/10;
units.LL_mGC2   = {'cm', 'cm'};  label.LL_mGC2 = {'total length', 'carapace length'};  
bibkey.LL_mGC2 = 'Mora2002';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'We are considering that, afer puberty, male morphotypes are defined by different zoom factors';  
metaData.bibkey.D2 = 'Mora2002';
metaData.discussion = struct('D1', D1);
%% Facts
%F1 = '';
%metaData.bibkey.F1 = 'bibkey'; 
%metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '894740fb9cd8342bf10138209be507f3'; % Cat of Life
metaData.links.id_EoL = '1021792'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium_amazonicum'; % Wikipedia
metaData.links.id_ADW = '#Macrobrachium_amazonicum'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '587088'; % WoRMS
metaData.links.id_fishbase = ''; % fishbase

%% Acknowledgment
metaData.acknowledgment = '';

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'Maci2009'; type = 'Article'; bib = [ ...
% 'author = {Maciel, Cristiana Ramalho, and Wagner C. Valenti}, ' ...
% 'year = {2009}, ' ...
% 'title = {Biology, fisheries, and aquaculture of the Amazon River prawn Macrobrachium amazonicum: a review}, ' ...
% 'journal = {Nauplius}, ' ...
% 'volume = {17.2}, ' ...
% 'pages = {61-79}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gues1979'; type = 'Article'; bib = [ ...
'author = {Guest, W. C.}, ' ...
'year = {1979}, ' ...
'title = {Laboratory life history of the palaemonid shrimp Macrobrachium amazonicum (Heller)(Decapoda, Palaemonidae)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {}, ' ...
'pages = {141-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'Hayd2013'; type = 'Article'; bib = [ ...
% 'author = {Hayd, Liliam, and Klaus Anger}, ' ...
% 'year = {2013}, ' ...
% 'title = {Reproductive and morphometric traits of Macrobrachium amazonicum (Decapoda: Palaemonidae) from the Pantanal, Brazil, suggests initial speciation}, ' ...
% 'journal = {Revista de Biología Tropical}, ' ...
% 'volume = {61.1}, ' ...
% 'pages = {39-57}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Silv2006'; type = 'Dissertation'; bib = [ ...
'author = {Márcia Cristina Nylander Silva}, ' ...
'year = {2006}, ' ...
'title = {Dinâmica populacional do camarão cascudo Macrobrachium amazonicum (Heller, 1862) da Ilha de Combú-Belém-PA.}, ' ...
'journal = {Dissertaįão de Mestrado, Pós-Graduaįão em Cięncia Animal, Universidade Federal do Pará, Belém}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mora2005'; type = 'Dissertation'; bib = [ ...
'author = {Patrícia Maria Contente Moraes-Riodades}, ' ...
'year = {2005}, ' ...
'title = {Cultivo do camarão-da-amazônia, Macrobrachium amazonicum (Heller, 1862)(Crustacea, Decapoda, Palaemonidae) em diferentes densidades: fatores ambientais, biologia populacional e sustentabilidade econômica.}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mora2002'; type = 'Dissertation'; bib = [ ...
'author = {Patrícia Maria Contente Moraes-Riodades}, ' ...
'year = {2002}, ' ...
'title = {Diferenciação morfotípica de machos de camarão de água doce Macrobrachium amazonicum (HELLER, 1862)(CRUSTACEA, DECAPODA, PALAEMONIDAE)}, ' ...Dissertaįão de Mestrado, Pós-Graduaįão em Cięncia Animal, Universidade Federal do Pará, Belém}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hayd2007'; type = 'Article'; bib = [ ...
'author = {Hayd, Liliam de Arruda}, ' ...
'year = {2007}, ' ...
'title = {Ciclo de muda e metabolismo durante o desenvolvimento larval do camarão-da-amazônia Macrobrachium amazonicum (Heller, 1862)}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
