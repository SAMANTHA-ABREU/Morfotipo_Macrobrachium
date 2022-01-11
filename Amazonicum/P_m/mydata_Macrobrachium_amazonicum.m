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
metaData.data_0     = {'ab';'Wdb';'tj';'Wwj';'Li_F';'Wwi_TC';'Wwi_CC';'Wwi_GC1';'Li_GC2';'Wwi_GC2';'Ri'}; 
metaData.data_1     = {'L-N_F';'L-W_F';'tW_CC';'tW_TC';'tW_GC1';'tW_GC2'};

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Samantha Santos', 'Tan Tjui-Yeuw', 'Fabio Vannucchi'};  
metaData.date_subm = [2021 11 16];  
metaData.email    = {'samanthaabreualves@gmail.com'}; 
metaData.address  = {'UNESP, Universidade Estadual Paulista "Julio de Mesquita Filho", Brazil'}; 

% metaData.curator     = {'FirstName LastName'};
% metaData.email_cur   = {'myname@myuniv.univ'}; 
% metaData.date_acc    = [yyyy mm dd]; 

%% set data
% zero-variate data;

% age 0 is at onset of embryo development
data.ab = 15; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Maci2009';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab_T28  = 'period varies from 12 to 18 days';
data.Wdb = 5.86e-6;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';       bibkey.Wdb = 'Hayd2007';

data.tj = 21; units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'Ange2009'; 
  temp.tj = C2K(29);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj  = 'In the most commonly observed developmental pathway (9 stages, taking approximately 20–22 days from hatching to the first juvenile stage';

data.Wwj = 0.068; units.Wwj = 'g'; label.Wwj = 'wet weight at metamorphosis'; bibkey.Wwj = 'Frei2019';
  temp.Wwj = C2K(28.5); units.temp.Wwj = 'K'; label.temp.Wwj = 'temperature'; 
  comment.Wwi_TC = 'Value of final wet weight from Table 2, average of T1 and T1 treatments';

data.Li_F  = 12.66;   units.Li_F  = 'cm';   label.Li_F  = 'ultimate total length';  bibkey.Li_F  = 'Silv2006';
  comment.Li_F = 'estimate made using the Appeldoorn methodology for female';
data.Wwi_TC  = 2.3;   units.Wwi_TC  = 'g';   label.Wwi_TC  = 'ultimate total weight';  bibkey.Wwi_TC  = 'Mora2005';
  comment.Wwi_TC = 'Ultimate weight of males TC';
data.Wwi_CC  = 3.8;   units.Wwi_CC  = 'g';   label.Wwi_CC  = 'ultimate total weight';  bibkey.Wwi_CC  = 'Mora2005';
  comment.Wwi_CC = 'Ultimate weight of males CC';
data.Wwi_GC1  = 11.8;   units.Wwi_GC1  = 'g';   label.Wwi_GC1  = 'ultimate total weight';  bibkey.Wwi_GC1  = 'Mora2005';
  comment.Wwi_GC1 = 'Ultimate weight of males GC1';
data.Li_GC2  = 14;   units.Li_GC2  = 'cm';   label.Li_GC2  = 'ultimate total length';  bibkey.Li_GC2  = 'Silv2006';
  comment.Li_GC2 = 'estimate made using the Appeldoorn methodology for male GC2';
data.Wwi_GC2  = 14.4;   units.Wwi_GC2  = 'g';   label.Wwi_GC2  = 'ultimate total weight';  bibkey.Wwi_GC2  = 'Mora2005';
  comment.Wwi_GC2 = 'Ultimate weight of males GC2';
  
data.Ri  = 3375 / 30;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Silv2006';   
  temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'De onde veio o 153?';

% uni-variate data

data.LN_F = [ ... % total length (cm), total number of eggs/offspring (#)
5.2045	396.67
5.39936	545.585
5.50428	429.154
5.2045	695.425
5.18951	944.423
5.51927	1059.82
5.80407	478.236
5.87901	478.058
5.98394	593.992
5.98394	842.954
5.87901	810.008
5.80407	876.576
5.66916	843.701
5.72912	63.4757
5.99893	179.019
6.1788	327.97
6.25375	195.012
6.34368	178.201
6.3137	410.637
6.38865	576.103
6.70343	476.103
6.79336	392.903
6.68844	343.359
6.61349	642.292
6.38865	974.775
6.50857	974.491
6.56852	1090.53
6.67345	1206.46
6.5985	1472.2
6.50857	1621.79
6.19379	1224.2
5.96895	1324.32
6.79336	857.633
7.0182	1056.27
6.89829	1089.75
6.89829	674.811
7.28801	723.68
7.303	524.474
7.303	375.097
7.58779	524.214
7.91756	108.079
7.00321	1421.45
7.09315	1471.03
7.19807	1072.44
7.10814	906.679
7.40792	972.358
7.48287	938.985
7.55782	889.015
7.70771	722.685
7.90257	423.468
8.00749	439.816
8.00749	290.439
7.49786	1237.71
7.303	1387.54
6.80835	3347.22
7.58779	1801.81
7.81263	1701.69
7.99251	2713.71
8.92184	2860.88
9.20664	3059.38
7.91756	1286.5
7.81263	1170.57
7.90257	937.99
7.97752	1634.91
8.18737	1750.59
8.48715	1882.66
8.72698	1915.29
8.80193	1848.72
8.71199	1782.54
8.62206	1566.99
8.32227	1119.57
8.60707	753.747
9.70128	1846.59
10.6006	832.008
 ];
data.LN_F(:,2) = data.LN_F(:,2) / 30; % convert to eggs by days (desova mensal mostrada em Silv2006 pag 
units.LN_F = {'cm', '#'}; label.LN_F = {'total length', 'total number of eggs/offspring'};  
temp.LN_F = C2K(27.5);  units.temp.LN_F = 'K'; label.temp.LN_F = 'temperature';
bibkey.LN_F = 'Silv2006';
comment.LN_F = '';

data.LW_F = [ ... % total length (cm), total weight (g)
2.7735	0.191388
2.8898	0.430622
2.8898	0.0478469
3.18367	0.047869
3.23265	0.382775
3.55102	0.0956938
3.62449	0.478469
3.94286	0.62201
4.04082	0.717703
4.0898	1.24402
4.3102	0.76555
4.43265	0.382775
4.67755	0.574163
4.92245	0.669856
4.75102	1.05263
5.33878	1.38756
5.2898	0.813397
5.73061	1.00478
5.73061	0.62201
5.26531	2.10526
5.41224	2.29665
5.58367	1.43541
5.73061	1.67464
5.87755	1.24402
6.02449	1.43541
6.26939	1.43541
6.39184	1.29187
6.51429	1.14833
6.51429	1.77033
6.07347	2.2488
6.41633	2.53589
6.00	1.86603
5.95102	2.3445
6.19592	2.67943
6.31837	2.87081
6.7102	2.44019
6.80816	2.72727
6.73469	3.11005
6.93061	2.87081
7.15102	3.15789
6.9551	2.05742
7.34694	2.20096
7.12653	1.43541
7.15102	1.62679
7.59184	1.67464
7.49388	2.72727
7.27347	2.58373
7.34694	3.25359
7.27347	3.49282
7.37143	3.63636
7.34694	3.97129
7.56735	3.82775
7.71429	2.91866
7.9102	2.29665
8.00816	2.77512
7.95918	3.11005
7.81224	3.82775
7.95918	4.40191
8.00816	4.11483
8.17959	3.44498
8.49796	3.25359
8.40	3.82775
8.35102	4.64115
8.69388	5.11962
8.66939	4.30622
8.86531	4.78469
9.03673	3.39713
8.1551	4.689
8.42449	5.11962
8.57143	5.4067
8.76735	5.45455
8.59592	5.88517
8.6449	5.93301
9.13469	4.73684
9.06122	5.11962
9.3551	5.45455
8.8898	6.98565
9.25714	6.2201
9.52653	5.98086
9.52653	6.69856
9.82041	6.50718
9.64898	6.36364
9.33061	7.55981
9.69796	6.9378
9.57551	7.84689
9.74694	7.84689
9.8449	7.7512
9.94286	7.46411
9.91837	7.17703
10.0898	7.70335
10.0898	7.99043
10.3102	7.6555
10.6041	7.84689
10.6286	7.46411
10.9224	7.79904
10.2857	9.47368
10.5551	9.09091
10.7265	9.47368
 ];
units.LW_F = {'cm', 'g'}; label.LW_F = {'total length', 'total weight'};  
temp.LW_F = C2K(27.5);  units.temp.LW_F = 'K'; label.temp.LW_F = 'temperature';
bibkey.LW_F = 'Silv2006';
comment.LW_F = '';


% Males

% Male morphotype TC
data.tW_mTC = [ ... % time since metam (months), weight (g) 
67.3	2.18
95.7	2.34
130.7	2.23
175.0	2.29
];
% data.tW_mTC(:,1) = data.tW_mTC(:,1)+25;
units.tW_mTC = {'d', 'g'}; label.tW_mTC = {'time', 'weight'};
temp.tW_mTC = C2K(28);  units.temp.tW_mTC = 'K'; label.temp.tW_mTC = 'temperature';
bibkey.tW_mTC = 'Mora2005'; comment.tW_mTC = 'data for males TC extracted from fig. 8';

%Male morphotype CC
data.tW_mCC = [ ... % time since metam (months), weight (g) 
67.3	4.36
95.7	3.69
130.7	3.90
175.0	3.79
];
% data.tW_mCC(:,1) = data.tW_mCC(:,1)+25;
units.tW_mCC = {'d', 'g'}; label.tW_mCC = {'time', 'weight'};  
bibkey.tW_mCC = 'Mora2005'; comment.tW_mCC = 'data for males CC extracted from fig. 8';

%Male morphotype GC1
data.tW_mGC1 = [ ... % time since metam (months), weight (g) 
67.3	6.81
95.7	7.43
130.7	11.48
175.0	11.84
];
% data.tW_mGC1(:,1) = data.tW_mGC1(:,1)+25;
units.tW_mGC1 = {'d', 'g'}; label.tW_mGC1 = {'time', 'weight'};  
bibkey.tW_mGC1 = 'Mora2005'; comment.tW_mGC1 = 'data for males GC1 extracted from fig. 8';

%Male morphotype GC2
data.tW_mGC2 = [ ... % time since metam (months), weight (g) 
67.3	8.31
95.7	11.38
130.7	13.30
175.0	14.44
];
% data.tW_mGC2(:,1) = data.tW_mGC2(:,1)+25;
units.tW_mGC2 = {'d', 'g'}; label.tW_mGC2 = {'time', 'weight'};  
bibkey.tW_mGC2 = 'Mora2005'; comment.tW_mGC2 = 'data for males GC2 extracted from fig. 8';


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

%% Group plots
set1 = {'LN_F'}; comment1 = {'Number of eggs by length of female'};
set2 = {'LW_F'}; comment2 = {'Weight-length for females'};
set3 = {'tW_mTC','tW_mCC','tW_mGC1','tW_mGC2'}; comment3 = {'Wet Weight for males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.comment = {comment1,comment2,comment3};


%% Discussion points
D1 = 'We are considering that, after puberty, male morphotypes are defined by different zoom factors';  
metaData.bibkey.D1 = 'Mora2002';
metaData.discussion = struct('D1', D1);
%% Facts
F1 = 'Morphological differences occur after puberty';
metaData.bibkey.F1 = 'Mora2002'; 
metaData.facts = struct('F1',F1);

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
bibkey = 'Maci2009'; type = 'Article'; bib = [ ...
'author = {Maciel, Cristiana Ramalho, and Wagner C. Valenti}, ' ...
'year = {2009}, ' ...
'title = {Biology, fisheries, and aquaculture of the Amazon River prawn Macrobrachium amazonicum: a review}, ' ...
'journal = {Nauplius}, ' ...
'volume = {17.2}, ' ...
'pages = {61-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
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
bibkey = 'Ange2009'; type = 'Article'; bib = [ ...
'author = {Klaus Anger, Liliam Hayd, Jan Knott and Uwe Nettelmann}, ' ...
'year = {2009}, ' ...
'title = {Patterns of larval growth and chemical composition in the Amazon River prawn, Macrobrachium amazonicum}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {287}, ' ...
'pages = {341-348}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Frei2019'; type = 'Dissertation'; bib = [ ...
'author = {Jessica Vieira Freire}, ' ...
'year = {2019}, ' ...
'title = {DESEMPENHO DE LARVAS DE Macrobrachium amazonicum PROVENIENTES DE CÓPULAS ENTRE FÊMEAS COM MACHOS GC1 E TC}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];