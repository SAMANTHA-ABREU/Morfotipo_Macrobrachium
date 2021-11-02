function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_rosenbergii 

%% set metaData % see http://www.debtheory.org/wiki/index.php?title=Mydata_file for metaData field descriptions

metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_rosenbergii'; 
metaData.species_en = 'Freshwater Prawn'; 
metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TP','TA'};
metaData.ecoCode.habitat = {'0bFe','bjFe','jpF','piFe','piF'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'O'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, typical body temp
metaData.data_0     = {'ab';'tj';'tp';'am';'Ri';'Li_F';'Li_BC';'Li_OC';'Li_SM'}; 
metaData.data_1     = {'t-W_J';'L-W_F';'t-L_F';'t-W_SM';'t-W_OC';'t-W_BC'};

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Samantha Santos', 'Fabio Vannucchi', 'Tan Tjui-Yeuw'};  
metaData.date_subm = [2020 08 01];  
metaData.email    = {'samanthaabreualves@gmail.com'}; 
metaData.address  = {'UNESP, Universidade Estadual Paulista "Júlio de Mesquita Filho", Brazil'}; 

% metaData.curator     = {'FirstName LastName'};
% metaData.email_cur   = {'myname@myuniv.univ'}; 
% metaData.date_acc    = [yyyy mm dd]; 

%% set data
% zero-variate data;

% age 0 is at onset of embryo development
data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'PinheiroHebling1998';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 16;      units.tj = 'd';    label.tj = 'time at end of acceleration';  bibkey.tj = 'PinheiroHebling1998';   
  temp.tj = C2K(28);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj  = 'periodo varia de 16 a 20 dias';
data.tp = 120;      units.tp = 'd';    label.tp = 'time at puberty';  bibkey.tp = 'PinheiroHebling1998';   
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tb  = 'periodo varia de 120 a 180 dias';
data.am = 1095;    units.am = 'd';   label.am = 'life span';  bibkey.am = 'New2000';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Ri  = 100000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DaSilva2004';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.Li_F  = 29;   units.Li_F  = 'cm';   label.Li_F  = 'ultimate total length';  bibkey.Li_F  = 'New2002';
  comment.Li_F = 'Ultimate length for female';
data.Li_BC  = 33;   units.Li_BC  = 'cm';   label.Li_BC  = 'ultimate total length';  bibkey.Li_BC  = 'New2002';
   comment.Li_BC = 'Ultimate length of males BC';
data.Li_OC  = 23.82;   units.Li_OC  = 'cm';   label.Li_OC  = 'ultimate total length';  bibkey.Li_OC  = 'Iketani2016';
  comment.Li_OC = 'Ultimate length of males OC';
data.Li_SM  = 15.77;   units.Li_SM  = 'cm';   label.Li_SM  = 'ultimate total length';  bibkey.Li_SM  = 'Iketani2016';
  comment.Li_SM = 'Ultimate length of males SM';

% uni-variate data

%Juveniles
data.tW_J = [... % time (weeks),Weight (g)
2.01579	0.0444486
3.01244	0.076759
4.05562	0.0948383
5.07553	0.120033
6.09952	0.214072
7.07143	0.228571
8.09155	0.257327
9.01722	0.290806
 ];
data.tW_J(:,1) = data.tW_J(:,1) * 7 + 16; % convert weeks to d
units.tW_J = {'d', 'g'}; label.tW_J = {'time for a day', 'total weight'};  
temp.tW_J = C2K(26);  units.temp.tW_J = 'K'; label.temp.tW_J = 'temperature';
bibkey.tW_J = 'Raanan1984';
comment.tW_J = 'Data for juveniles';

%Females
data.LW_F = [... % length (cm),weight (g)
6.53	6.14
7.57	7.02
8.44	8.77
9.36	10.50
10.30	12.30
11.20	14.90
12.10	18.40
13.10	21.90
14.00	26.30
14.90	32.50
15.90	40.40
16.80	50.00
17.70	60.50
18.60	74.60
19.60	93.90
20.40	114.00
21.40	142.00
22.40	174.00
 ];
units.LW_F = {'cm', 'g'}; label.LW_F = {'length (cm)', 'weight (g)'};  
temp.LW_F = C2K(28);  units.temp.LW_F = 'K'; label.temp.LW_F = 'temperature';
bibkey.LW_F = 'Lalrinsanga2012';

data.tL_F = [... % time (months), length (mm)
-0.0245759	69.743
1.05448	91.7415
2.00661	111.293
3.02182	128.468
4.00485	140.831
4.98814	155.594
5.97118	167.957
7.0178	182.743
8.03225	192.718
9.01504	202.681
10.0292	210.255
11.0118	217.818
12.121	225.428
13.0399	230.567
14.0538	235.741
15.0045	240.892
15.9867	246.055
17.1274	251.276
18.0463	256.415
19.06	259.19
20.0739	264.364
21.1195	269.55
22.1013	269.913
23.115	272.687
24.1287	275.461
25.079	278.212
25.9341	278.528
 ];
data.tL_F(:,1) = data.tL_F(:,1) * 30+16; % convert months to d
data.tL_F(:,2) = data.tL_F(:,2) / 10; % convert mm to cm
units.tL_F = {'d', 'cm'}; label.tL_F = {'time for a day', 'total length'};  
temp.tL_F = C2K(30);  units.temp.tL_F = 'K'; label.temp.tL_F = 'temperature';
bibkey.tL_F = 'ITARIKRTsHNAN1997';

data.tW_F = [... % time (days),Weight (g/2m²)
45.00	5.27
48.57	5.18
52.42	5.08
56.82	7.73
59.85	10.43
64.25	13.08
68.92	24.04
73.04	29.47
74.96	34.96
77.44	37.67
81.56	43.10
85.68	51.31
87.88	59.56
89.80	70.59
93.91	98.19
96.37	114.74
98.02	128.55
101.85	153.38
105.43	156.06
110.10	167.02
114.77	183.52
115.86	197.34
117.50	219.46
118.59	238.82
120.77	263.70
121.86	280.29
122.68	288.58
125.14	321.75
127.05	349.41
128.14	363.23
129.51	379.81
130.88	385.32
135.00	393.52
138.85	407.27
141.59	421.05
143.23	434.86
144.33	445.91
147.06	473.54
151.16	520.53
 ];
data.tW_F(:,1) = data.tW_F(:,1) + 16; 
units.tW_F = {'d', 'g'}; label.tW_F = {'time for a day', 'total weight'};  
temp.tW_F = C2K(26);  units.temp.tW_F = 'K'; label.temp.tW_F = 'temperature';
bibkey.tW_F = 'Sagi1986';
%Males
%SM
data.tW_SM = [... % time (weeks),Weight (g)
-0.0580162	0.24791
2.07189	0.571104
3.99984	0.795041
5.991	0.928095
8.04592	0.986796
9.97304	1.18594
12.0299	1.30249
14.0205	1.41902
15.8726	1.35367
17.9938	1.41239
19.9849	1.54545
 ];
data.tW_SM(:,1) = data.tW_SM(:,1) * 7 + 120; % convert weeks to d
data.tW_SM(:,2) = exp(data.tW_SM(:,2)); % convert logs of masses to masses
units.tW_SM = {'d', 'g'}; label.tW_SM = {'time for a day', 'total weight'};  
temp.tW_SM = C2K(27);  units.temp.tW_SM = 'K'; label.temp.tW_SM = 'temperature';
bibkey.tW_SM = 'Raanan1991';

%OC
data.tW_OC = [... % time (weeks),Weight (g)
0.0963288	0.909131
2.03248	1.38101
4.03076	1.72894
6.02493	1.9529
8.02047	2.21819
9.94951	2.47519
11.9434	2.69089
13.9332	2.78262
15.9928	2.98182
17.9817	3.04875
19.9781	3.33883
 ];
data.tW_OC(:,1) = data.tW_OC(:,1) * 7 + 120; % convert weeks to d
data.tW_OC(:,2) = exp(data.tW_OC(:,2)); % convert logs of masses to masses
units.tW_OC = {'d', 'g'}; label.tW_OC = {'time for a day', 'total weight'};  
temp.tW_OC = C2K(27);  units.temp.tW_OC = 'K'; label.temp.tW_OC = 'temperature';
bibkey.tW_OC = 'Raanan1991';
 
%BC
data.tW_BC = [... % time (weeks),Weight (g)
0.0139567	2.42149
2.00977	2.69505
3.93607	2.8694
5.92805	3.02724
7.91949	3.16856
9.84962	3.45862
11.9782	3.74049
13.8322	3.73299
16.0182	3.75042
18.0042	3.72645
19.991	3.72727
];
data.tW_BC(:,1) = data.tW_BC(:,1) * 7 + 120; % convert weeks to d
data.tW_BC(:,2) = exp(data.tW_BC(:,2)); % convert logs of masses to masses
units.tW_BC = {'d', 'g'}; label.tW_BC = {'time for a day', 'total weight'};  
temp.tW_BC = C2K(27);  units.temp.tW_BC = 'K'; label.temp.tW_BC = 'temperature';
bibkey.tW_BC = 'Raanan1991';

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
% set1 = {'tW_J','tW_SM','tW_OC','tW_BC'}; comment1 = {'Time line'};
% % set1 = {'tW_J','tW_BC'}; comment1 = {'Time line'};
% metaData.grp.sets = {set1};
% metaData.grp.comment = {comment1};
%% Discussion points
D1 = '';
D2 = '';     
metaData.bibkey.D2 = 'Kooy2010';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
%F1 = '';
%metaData.bibkey.F1 = 'bibkey'; 
%metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'a61a9d4f565e9418cbe32c1ad984af75'; % Cat of Life
metaData.links.id_EoL = '46515413'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium_rosenbergii'; % Wikipedia
metaData.links.id_ADW = '#Macrobrachium_rosenbergii'; % ADW
metaData.links.id_Taxo = '94420'; % Taxonomicon
metaData.links.id_WoRMS = '220137'; % WoRMS
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
bibkey = 'PinheiroHebling1998'; type = 'Article'; bib = [ ...
'author = {Pinheiro, Marcelo Antonio Amaro, and Nilton Jose Hebling}, ' ...
'year = {1998}, ' ...
'title = {Biologia de Macrobrachium rosenbergii (De Man, 1879)}, ' ...
'journal = {Brasília: Instituto Brasileiro de Meio Ambiente e dos Recursos Naturais Renováveis}, ' ...
'volume = {}, ' ...
'pages = {21-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'New2000'; type = 'Book'; bib = [ ...
'author = {Valenti, Wagner Cotroni}, ' ...
'year = {2000}, ' ...
'title = {Freshwater prawn culture: the farming of Macrobrachium rosenbergii.)}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DaSilva2004'; type = 'Book'; bib = [ ...
'author = {Da Silva, R. R., Sampaio, C. M. S., & Santos, J. A.}, ' ...
'year = {2004}, ' ...
'title = {Fecundity and fertility of Macrobrachium amazonicum (Crustacea, Palaemonidae)}, ' ...
'journal = {Brazilian Journal of Biology}, ' ...
'volume = {64}, ' ...
'pages = {489-500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'New2002'; type = 'Book'; bib = [ ...
'author = {New, Michael B.}, ' ...
'year = {2002}, ' ...
'title = {Farming freshwater prawns: a manual for the culture of the giant river prawn (Macrobrachium rosenbergii).}, ' ...
'journal = {Food & Agriculture Org.}, ' ...
'volume = {428}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iketani2016'; type = 'Article'; bib = [ ...
'author = {Iketani, G., Aviz, M. A. B., Maciel, C., Valenti, W., Schneider, H., & Sampaio, I.}, ' ...
'year = {2016}, ' ...
'title = {Successful invasion of the Amazon Coast by the giant river prawn, Macrobrachium rosenbergii: evidence of a reproductively viable population.}, ' ...
'journal = {Aquatic Invasions}, ' ...
'volume = {11.3}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Raanan1984'; type = 'Article'; bib = [ ...
'author = {Ra´Anan, Ziva, and Dan Cohen}, ' ...
'year = {1984}, ' ...
'title = {The effect of group interactions on the development of size distribution in Macrobrachium rosenbergii (de Man) juvenile populations.}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {166}, ' ...
'pages = {22-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lalrinsanga2012'; type = 'Article'; bib = [ ...
'author = {P. L. Lalrinsanga, et al.}, ' ...
'year = {2012}, ' ...
'title = {Length weight relationship and condition factor of giant freshwater prawn Macrobrachium rosenbergii (De Man, 1879) based on developmental stages, culture stages and sex.}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {12.4}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ITARIKRTsHNAN1997'; type = 'Article'; bib = [ ...
'author = {M. ITARIKRTsHNAN, and B. MADHUsoooeNaiKURU}, ' ...
'year = {1997}, ' ...
'title = {Growth, mortality and exploitation of male and female populations of Macrobrachiutn rosenbergii (de Man) in the Vembanad lake, India.}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sagi1986'; type = 'Article'; bib = [ ...
'author = {Amir Sagi, Ziva Ra´anan, Dan Cohen and Yohanan Wax}, ' ...
'year = {1986}, ' ...
'title = Production of Macrobrachium rosenbergii in monosex populations: yield characteristics under intensive monoculture conditions in cages.}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {51}, ' ...
'pages = {265-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Raanan1991'; type = 'Article'; bib = [ ...
'author = {Ra´Anan, Z., Sagi, A., Wax, Y., Karplus, I., Hulata, G., & Kuris, A.}, ' ...
'year = {1991}, ' ...
'title = {Growth, size rank, and maturation of the freshwater prawn, Macrobrachium rosenbergii: analysis of marked prawns in an experimental population.}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {181}, ' ...
'pages = {379-386}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
