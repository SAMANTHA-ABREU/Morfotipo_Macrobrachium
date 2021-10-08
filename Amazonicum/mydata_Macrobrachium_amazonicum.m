function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_amazonicum 

%% set metaData % see http://www.debtheory.org/wiki/index.php?title=Mydata_file for metaData field descriptions

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
metaData.data_0     = {'ab';'tj';'tp';'Lp';'Li';'Wdb';'Ri'}; 
metaData.data_1     = {'L-W_F';'L-N_F';'Ww-N_F';'tW_mTC';'tW_mCC';'tW_mCG1';'tW_mGC2'};

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Samantha Santos', 'Tan Tjui-Yeuw', 'Fabio Vannucchi'};  
metaData.date_subm = [2020 08 01];  
metaData.email    = {'samanthaabreualves@gmail.com'}; 
metaData.address  = {'UNESP, Universidade Estadual Paulista "Júlio de Mesquita Filho", Brazil'}; 

% metaData.curator     = {'FirstName LastName'};
% metaData.email_cur   = {'myname@myuniv.univ'}; 
% metaData.date_acc    = [yyyy mm dd]; 

%% set data
% zero-variate data;

% Temperature dependence coded as Americamysis bahia;
% age 0 is at onset of embryo development;

data.ab_T24 = 21.5; units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Gues1979'; temp.ab_T24 = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; comment.ab_T24  = 'Incubation was 19-24 days at 24(2)oC';

data.ab_T30 = 13.5; units.ab = 'd'; label.ab = 'age at birth';  bibkey.ab = 'Gues1979'; temp.ab_T30 = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; comment.ab_T30  = 'Incubation was 12-15 days at 30(1)oC';

data.tj = 24.5; units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'Gues1979'; temp.tj = C2K(24);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; comment.tj  = 'M. amazonicum larvae underwent 8-9 molts (stages) in 23-26 days at 24.0(3)oC';

%data.tp = 168; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Gues1979'; temp.tp = C2K(30); units.temp.tp = 'K'; label.temp.tp = 'temperature'; comment.tp  = 'M. amazonicum reared outdoors reached sexual maturity in 168(2) days after hatching';
  
%data.Lp = 5.94; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Gues1979'; comment.Lp = 'Seven females which produced eggs for the first time averaged 59.4(1.8) mm (...) ';

data.Li_F = 13.58; units.Li_F = 'cm'; label.Li_F = 'ultimate total length'; bibkey.Li_F ='Silv2006'; comment.Li_F = 'Silva (2006) adopted several methods to estimate Li of females, we considered the median';

data.Li_TC = 9.4; units.Li_TC = 'cm'; label.Li_TC = 'ultimate total length'; bibkey.Li_TC = 'Mora2002'; comment.Li_TC = 'Ultimate length of males TC';

data.Li_CC = 9.8; units.Li_CC  = 'cm'; label.Li_CC  = 'ultimate total length'; bibkey.Li_CC = 'Mora2002'; comment.Li_CC = 'Ultimate length of males CC';

data.Li_GC1 = 13; units.Li_GC1  = 'cm'; label.Li_GC1  = 'ultimate total length'; bibkey.Li_GC1 = 'Mora2002'; comment.Li_GC1 = 'Ultimate length of males GC1';

data.Li_GC2 = 15.84;   units.Li_GC2  = 'cm';   label.Li_GC2  = 'ultimate total length';  bibkey.Li_GC2 = 'Silv2006'; comment.Li_GC2 = 'estimate made using the Appeldoorn methodology for male GC2';

data.Wdb = 5.86e-6; units.Wdb = 'g'; label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'Hayd2007';

%data.Wwp = 1.7; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Gues1979'; comment.Wwp = 'Seven females which produced eggs for the first time (...) weighed 1.7(0.1)g';

data.Ri  = 1700/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'Hayd2013'; temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
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
bibkey.tL_JT25 = 'Gues1979'; comment.tL_JT25 = 'Data extracted from Fig.3'

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
bibkey.tL_JT30 = 'Gues1979'; comment.tL_JT30 = 'Data extracted from Fig.3'


% Female
data.LW_F = [ ... % total length (mm), total weight (g)
29.89	0.23
31.78	0.26
33.18	0.30
34.25	0.33
36.71	0.39
38.27	0.43
39.18	0.46
41.64	0.54
44.11	0.63
46.33	0.71
49.04	0.83
50.77	0.90
52.00	0.96
53.97	1.06
56.44	1.19
57.34	1.25
58.90	1.34
60.47	1.43
61.62	1.50
62.93	1.58
63.84	1.65
65.07	1.73
 ];
data.LW_F(:,1) = data.LW_F(:,1) / 10; % convert mm to cm
units.LW_F = {'cm', 'g'}; label.LW_F = {'total length', 'total weight'};  
temp.LW_F = C2K(30);  units.temp.LW_F = 'K'; label.temp.LW_F = 'temperature';
bibkey.LW_F = 'Hayd2013';
comment.LW_F = '';

data.LN_F = [ ... % total length (mm), total number of eggs/offspring (#)
29.60	90.30
30.40	90.30
32.20	104.00
33.90	119.00
35.70	138.00
37.40	157.00
39.20	175.00
41.00	196.00
42.70	220.00
44.50	244.00
46.20	269.00
48.00	297.00
49.80	325.00
51.50	355.00
53.30	388.00
55.00	422.00
56.80	456.00
58.60	494.00
60.30	533.00
62.10	575.00
63.80	617.00
65.00	647.00
 ];
data.LN_F(:,1) = data.LN_F(:,1) / 10; % convert mm to cm
data.LN_F(:,2) = data.LN_F(:,2) * 365 / 153; % convert to eggs by days
units.LN_F = {'cm', '#'}; label.LN_F = {'total length', 'total number of eggs/offspring'};  
temp.LN_F = C2K(30);  units.temp.LN_F = 'K'; label.temp.LN_F = 'temperature';
bibkey.LN_F = 'Hayd2013';
comment.LN_F = '';

data.WwN_F = [ ... % total wet weight (g), total number of eggs/offspring (#)
0.23	94.84
0.24	99.35
0.32	129.46
0.40	158.06
0.48	188.17
0.57	216.77
0.65	246.88
0.73	275.48
0.81	307.10
0.90	335.70
0.98	365.81
1.06	394.41
1.14	424.52
1.22	454.62
1.31	483.23
1.39	513.33
1.47	543.44
1.55	572.04
1.63	602.15
1.72	630.75
1.80	660.86
1.88	690.97
1.91	700.00
 ];
data.WwN_F(:,2) = data.WwN_F(:,2) * 365 / 153; % convert to eggs by days
units.WwN_F = {'g', '#'}; label.WwN_F = {'total wet weight', 'total number of eggs/offspring'};  
temp.WwN_F = C2K(30);  units.temp.WwN_F = 'K'; label.temp.WwN_F = 'temperature';
bibkey.WwN_F = 'Hayd2013';
comment.WwN_F = '';

% Moraes-Riodades (2005) dates:
%Bloco 1 31/10/02 02/12/02 06/01/03 03/02/03 10/03/03 5,5 months
%Bloco 2 31/10/02 02/12/02 06/01/03 04/02/03 11/03/03 5,5 months
%Bloco 3 13/11/02 16/12/02 20/01/03 17/02/03 24/03/03 5,5 months
%Means (days): 0 32.3 67.3 95.7 130.7 175

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

%% set weights for all real data
weights = setweights(data, []);
% weights.tL_F = 0 * weights.tL_F
% weights.tW_mTC = 0 * weights.tW_mTC
% weights.tW_mCC = 0 * weights.tW_mCC
% weights.tW_mGC1 = 0 * weights.tW_mGC1
% weights.tW_mGC2 = 0 * weights.tW_mGC2

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'We considered the difference of morphotypes due to {p_Am} or [p_M]';     
metaData.bibkey.D1 = '';
D2 = 'Data of puberty from Guess (1979) is in disagreement with Moraes-Riodades (2005) and Hayd (2013), and thus was ignored';     
metaData.bibkey.D1 = '';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Males occur in four distinct morphotypes were identified: Translucent Claw (TC), Cinnamon Claw (CC), Green Claw 1 (GC1) and Green Claw 2 (GC2). They differed in cheliped morphology and some morphometric relationships.';
metaData.bibkey.F1 = 'mora2004';
F2 = 'Total lengths as the distance from the tip of rostrum to the end of telson';     
metaData.bibkey.D1 = {'Gues1979','Mora2005'};
metaData.facts = struct('F1',F1,'F2',F2);

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
%% DEB
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%% M. amazonicum
bibkey = 'Cost2019'; type = 'Article'; bib = [ ...
'author = {Raquel Costa e Silva, Marina Calixto Cunha, Emerson Contreira Mossolin and Giuliano Buzá Jacobucci}, ' ...
'year = {2019}, ' ...
'title = {Population structure of Macrobrachium amazonicum (Heller, 1862)(Decapoda: Palaemonidae) in Miranda Hydroelectric Plant Reservoir, Araguari river, Minas Gerais, Brazil.}, ' ...
'journal = {Acta Limnologica Brasiliensia}, ' ...
'volume = {31}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gues1979'; type = 'Article'; bib = [ ...
'author = {Guest, W. C.}, ' ...
'year = {1979}, ' ...
'title = {Laboratory life history of the palaemonid shrimp \emph{Macrobrachium amazonicum} (Heller)(Decapoda, Palaemonidae)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {}, ' ...
'pages = {141-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hayd2007'; type = 'Article'; bib = [ ...
'author = {Hayd, Liliam de Arruda}, ' ...
'year = {2007}, ' ...
'title = {Ciclo de muda e metabolismo durante o desenvolvimento larval do camarão-da-amazônia \emph{Macrobrachium amazonicum} (Heller, 1862)}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hayd2013'; type = 'Article'; bib = [ ...
'author = {Hayd, Liliam, and Klaus Anger}, ' ...
'year = {2013}, ' ...
'title = {Reproductive and morphometric traits of \emph{Macrobrachium amazonicum} (Decapoda: Palaemonidae) from the Pantanal, Brazil, suggests initial speciation}, ' ...
'journal = {Revista de Biología Tropical}, ' ...
'volume = {61.1}, ' ...
'pages = {39-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Maci2009'; type = 'Article'; bib = [ ...
'author = {Maciel, Cristiana Ramalho, and Wagner C. Valenti}, ' ...
'year = {2009}, ' ...
'title = {Biology, fisheries, and aquaculture of the Amazon River prawn \emph{Macrobrachium amazonicum}: a review}, ' ...
'journal = {Nauplius}, ' ...
'volume = {17.2}, ' ...
'pages = {61-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mora2002'; type = 'mastersthesis'; bib = [ ...
'author = {Patrícia Maria Contente Moraes-Riodades}, ' ...
'year = {2002}, ' ...
'title = {Diferenciação Morfotípica de Machos de Camarão de Água Doce \emph{Macrobrachium Amazonicum} (Heller, 1862) (Crustacea, Decapoda, Palaemonidae)}, ' ...
'school = {São Paulo State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mora2004'; type = 'article'; bib = [ ...
'author = {Moraes-Riodades, P.M.C. and Valenti, W.C.}, ' ...
'year = {2004}, ' ...
'title = {Morphotypes in male Amazon River Prawns, \emph{Macrobrachium amazonicum}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {236}, ' ...
'pages = {297-307}' ...
'doi = 10.1016/j.aquaculture.2004.02.015'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mora2005'; type = 'Dissertation'; bib = [ ...
'author = {Patrícia Maria Contente Moraes-Riodades}, ' ...
'year = {2005}, ' ...
'title = {Cultivo do camarão-da-amazônia, \emph{Macrobrachium amazonicum} (Heller, 1862)(Crustacea, Decapoda, Palaemonidae) em diferentes densidades: fatores ambientais, biologia populacional e sustentabilidade econômica.}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Silv2006'; type = 'Dissertation'; bib = [ ...
'author = {Márcia Cristina Nylander Silva}, ' ...
'year = {2006}, ' ...
'title = {Dinâmica populacional do camarão cascudo \emph{Macrobrachium amazonicum} (Heller, 1862) da Ilha de Combú-Belém-PA.}, ' ...
'journal = {Dissertaįão de Mestrado, Pós-Graduaįão em Cięncia Animal, Universidade Federal do Pará, Belém}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
