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
metaData.data_0     = {'ab';'tj';'tp';'am';'Ri';'Wwi_F';'Wwi_BC';'Wwi_OC';'Wwi_SM'}; 
metaData.data_1     = {'t-L_F';'L-W_F';'t-W_F';'t-W_SM';'t-W_OC';'t-W_BC'};

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
data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Pinh1998';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 18;      units.tj = 'd';    label.tj = 'time at end of acceleration';  bibkey.tj = 'Pinh1998';   
  temp.tj = C2K(28);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj  = 'periodo varia de 16 a 20 dias';
data.tp = 110;      units.tp = 'd';    label.tp = 'time at puberty';  bibkey.tp = 'Guess';
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data obtained from preliminary results of experiments conducted at the Unesp Aquaculture Center - Caunesp. Time ranges is 100 to 120 days';
  
data.am = 1095;    units.am = 'd';   label.am = 'life span';  bibkey.am = 'New2000';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp  = 2.5;     units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'Guess'; 
  temp.Lp = C2K(28);  units.temp.Lp = 'K'; label.temp.Lp = 'temperature'; 
  comment.Lp = 'Data obtained from preliminary results of experiments conducted at the Unesp Aquaculture Center - Caunesp'; 

data.Ri  = 100000/30;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DaSi2004';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.Wwi_F  = 21.35;   units.Wwi_F  = 'g';   label.Wwi_F  = 'ultimate total weight';  bibkey.Wwi_F  = 'Raan1991';
  comment.Wwi_F = 'Ultimate weight of female';
data.Wwi_BC  = 45;   units.Wwi_BC  = 'g';   label.Wwi_BC  = 'ultimate total weight';  bibkey.Wwi_BC  = 'Raan1991';
  comment.Wwi_BC = 'Ultimate weight of males BC';
data.Wwi_OC  = 31.2;   units.Wwi_OC  = 'g';   label.Wwi_OC  = 'ultimate total weight';  bibkey.Wwi_OC  = 'Raan1991';
  comment.Wwi_OC = 'Ultimate weight of males OC';
data.Wwi_SM  = 6.5;   units.Wwi_SM  = 'g';   label.Wwi_SM  = 'ultimate total weight';  bibkey.Wwi_SM  = 'Raan1991';
  comment.Wwi_SM = 'Ultimate weight of males SM';

  
% uni-variate data

%Females
data.LW_F = [... % length (cm),weight (g)
6.5	5.4
6.9	5.4
7.4	7.0
7.5	7.0
7.6	7.0
7.6	7.0
7.7	7.0
8.1	8.7
8.1	8.7
8.2	8.7
8.3	8.7
8.7	10.3
8.7	10.3
8.9	12.0
8.9	10.3
9.1	10.3
9.2	12.0
9.3	12.0
9.3	12.0
9.4	12.0
9.4	13.6
9.4	13.6
9.5	12.0
9.7	13.6
9.8	13.6
9.8	15.3
10.0	15.3
10.0	13.6
10.0	15.3
10.0	15.3
10.1	15.3
10.2	15.3
10.3	17.0
10.5	18.6
10.5	18.6
10.6	18.6
10.8	20.3
10.8	18.6
10.9	20.3
11.0	21.9
11.1	23.6
11.2	23.6
11.3	21.9
11.3	20.3
11.3	23.6
11.4	23.6
11.4	23.6
11.4	21.9
11.5	26.9
11.5	21.9
11.5	25.2
11.6	23.6
11.6	25.2
11.7	23.6
11.7	25.2
11.7	21.9
11.8	25.2
12.0	28.5
12.1	26.9
12.2	26.9
12.3	38.5
12.3	26.9
12.3	30.2
12.3	30.2
12.3	33.5
12.3	28.5
12.4	30.2
12.4	30.2
12.4	31.8
12.5	36.9
12.5	36.9
12.5	35.2
12.5	30.2
12.6	31.8
12.6	31.8
12.6	30.2
12.6	31.8
12.7	40.2
12.7	33.5
12.8	36.9
12.8	31.8
13.0	38.5
13.0	38.5
13.0	36.9
13.0	33.5
13.0	30.2
13.1	36.9
13.1	30.2
13.1	36.9
13.1	41.8
13.1	41.8
13.2	58.4
13.2	36.9
13.2	36.9
13.2	31.8
13.3	41.8
13.3	36.9
13.4	43.5
13.4	41.8
13.4	36.9
13.4	43.5
13.4	33.5
13.5	58.4
13.5	41.8
13.5	38.5
13.5	40.2
13.5	43.5
13.5	40.2
13.6	41.8
13.6	43.5
13.6	40.2
13.7	43.5
13.7	46.8
13.7	50.1
13.7	40.2
13.7	40.2
13.8	48.4
13.8	43.5
13.8	41.8
13.8	38.5
13.8	45.1
13.9	53.4
13.9	38.5
13.9	41.8
13.9	43.5
14.0	53.4
14.0	38.5
14.0	46.8
14.0	56.7
14.0	43.5
14.0	45.1
14.0	40.2
14.0	43.5
14.0	48.4
14.0	48.4
14.0	58.4
14.0	43.5
14.0	46.8
14.0	41.8
14.0	51.8
14.0	48.4
14.1	53.4
14.1	45.1
14.1	50.1
14.1	53.4
14.1	58.4
14.1	51.8
14.1	50.1
14.2	51.8
14.2	61.7
14.2	46.8
14.2	50.1
14.2	45.1
14.2	41.8
14.2	55.1
14.2	43.5
14.3	50.1
14.3	50.1
14.3	50.1
14.3	41.8
14.4	53.4
14.4	48.4
14.4	48.4
14.4	70.0
14.4	43.5
14.5	50.1
14.5	51.8
14.5	51.8
14.6	53.4
14.6	61.7
14.6	50.1
14.6	50.1
14.6	65.0
14.6	60.0
14.6	74.9
14.6	51.8
14.7	53.4
14.7	51.8
14.7	55.1
14.7	63.3
14.7	61.7
14.7	63.3
14.7	50.1
14.7	81.5
14.8	53.4
14.8	50.1
14.8	55.1
14.9	66.6
14.9	65.0
14.9	58.4
14.9	48.4
14.9	55.1
14.9	50.1
15.0	68.3
15.0	55.1
15.0	51.8
15.0	61.7
15.0	63.3
15.0	68.3
15.0	74.9
15.0	58.4
15.0	56.7
15.0	58.4
15.1	65.0
15.1	55.1
15.1	50.1
15.1	65.0
15.1	51.8
15.1	51.8
15.2	60.0
15.2	70.0
15.2	65.0
15.2	68.3
15.2	88.2
15.2	60.0
15.3	55.1
15.3	53.4
15.3	60.0
15.4	68.3
15.4	60.0
15.4	68.3
15.4	74.9
15.5	70.0
15.5	65.0
15.5	68.3
15.5	56.7
15.5	51.8
15.5	60.0
15.5	51.8
15.5	91.5
15.5	68.3
15.5	71.6
15.5	60.0
15.5	78.2
15.5	66.6
15.6	70.0
15.6	65.0
15.6	81.5
15.6	73.3
15.6	65.0
15.6	84.9
15.7	61.7
15.7	58.4
15.7	65.0
15.7	71.6
15.7	68.3
15.7	74.9
15.7	91.5
15.7	83.2
15.7	68.3
15.8	74.9
15.8	65.0
15.8	78.2
15.8	68.3
15.8	63.3
15.8	74.9
15.8	66.6
15.8	68.3
15.8	98.1
15.9	70.0
15.9	66.6
15.9	60.0
15.9	66.6
15.9	65.0
15.9	61.7
15.9	86.5
16.0	101.5
16.0	84.9
16.0	81.5
16.0	84.9
16.0	76.6
16.0	84.9
16.0	60.0
16.0	84.9
16.1	78.2
16.1	104.8
16.1	70.0
16.2	73.3
16.2	68.3
16.2	81.5
16.3	76.6
16.3	84.9
16.4	86.5
16.4	68.3
16.4	76.6
16.5	88.2
16.5	68.3
16.5	84.9
16.5	88.2
16.5	68.3
16.5	91.5
16.6	91.5
16.6	88.2
16.6	91.5
16.6	84.9
16.6	78.2
16.6	74.9
16.6	76.6
16.6	78.2
16.6	91.5
16.6	84.9
16.6	84.9
16.6	76.6
16.7	118.0
16.7	91.5
16.7	84.9
16.7	76.6
16.8	81.5
16.8	84.9
16.8	81.5
16.9	81.5
16.9	81.5
16.9	84.9
16.9	86.5
17.0	94.8
17.0	88.2
17.0	94.8
17.0	74.9
17.0	98.1
17.0	104.8
17.0	94.8
17.0	88.2
17.1	93.2
17.1	88.2
17.1	68.3
17.1	81.5
17.2	93.2
17.2	94.8
17.3	84.9
17.3	94.8
17.3	76.6
17.3	91.5
17.4	104.8
17.4	88.2
17.4	83.2
17.4	89.8
17.5	93.2
17.5	121.3
17.5	99.8
17.5	89.8
17.5	98.1
17.5	88.2
17.5	91.5
17.5	91.5
17.5	114.7
17.6	99.8
17.6	111.4
17.6	104.8
17.6	84.9
17.6	108.1
17.7	96.5
17.7	88.2
17.7	104.8
17.7	84.9
17.8	91.5
17.8	103.1
17.8	84.9
17.9	127.9
17.9	118.0
18.0	114.7
18.0	93.2
18.0	111.4
18.0	108.1
18.0	94.8
18.0	123.0
18.1	118.0
18.1	101.5
18.1	118.0
18.1	106.4
18.1	111.4
18.2	124.6
18.2	114.7
18.3	137.9
18.3	108.1
18.3	121.3
18.4	111.4
18.4	126.3
18.4	98.1
18.4	106.4
18.5	131.2
18.5	114.7
18.5	104.8
18.5	118.0
18.5	141.2
18.6	124.6
18.6	93.2
18.6	118.0
18.7	131.2
18.7	91.5
18.7	96.5
18.8	124.6
18.8	116.3
18.9	113.0
19.0	118.0
19.0	136.2
19.1	121.3
19.1	127.9
19.1	132.9
19.2	142.8
19.2	139.5
19.2	114.7
19.4	123.0
19.5	151.1
19.5	109.7
19.5	132.9
19.6	137.9
19.6	152.8
19.6	104.8
19.6	180.9
19.6	157.8
19.7	127.9
19.7	141.2
19.7	142.8
19.7	116.3
19.8	161.1
19.8	177.6
19.8	149.4
19.8	146.1
19.8	129.6
19.8	152.8
19.8	147.8
19.9	159.4
20.0	142.8
20.0	152.8
20.0	185.9
20.0	169.4
20.1	136.2
20.2	142.8
20.2	185.9
20.2	169.4
20.2	121.3
20.2	124.6
20.3	151.1
20.4	164.4
20.5	126.3
20.5	139.5
20.5	147.8
20.9	174.3
21.0	202.4
21.0	144.5
21.0	195.8
21.1	174.3
21.1	199.1
21.1	164.4
21.2	217.4
21.3	161.1
21.5	185.9
21.5	185.9
21.5	166.0
21.6	219.0
21.6	166.0
21.7	235.6
21.7	182.6
22.0	215.7
22.0	195.8
22.0	215.7
22.1	195.8
22.4	189.2
22.4	205.8 
];
units.LW_F = {'cm', 'g'}; label.LW_F = {'length (cm)', 'weight (g)'};  
temp.LW_F = C2K(28);  units.temp.LW_F = 'K'; label.temp.LW_F = 'temperature';
bibkey.LW_F = 'Lalr2012'; comment.LW_F = 'Data extracted from Fig.2';

%Males
%SM
data.tW_SM = [... % time since metam (days), weight (g)
 0.0	1.3
14.0	1.8
28.0	2.2
42.0	2.5
56.0	2.7
70.0	3.3
84.0	3.7
98.0	4.2
112.0	3.9
126.0	4.1
140.0	4.7
 ];
data.tW_SM(:,1) = data.tW_SM(:,1) + 138; % Add nursing period
units.tW_SM = {'d', 'g'}; label.tW_SM = {'time (days)', 'total weight'};  
temp.tW_SM = C2K(27);  units.temp.tW_SM = 'K'; label.temp.tW_SM = 'temperature';
bibkey.tW_SM = 'Raan1991'; comment.tW_SM = 'Data extracted from Fig.1, medians of the lnW distributions of individual males for each morphotype against time. The nursing period was 4 months.';

%OC
data.tW_OC = [... % time since metam (days), weight (g)
 0.0	2.5
14.0	4.0
28.0	5.7
42.0	7.0
56.0	9.2
70.0	11.9
84.0	14.7
98.0	16.2
112.0	19.9
126.0	21.3
140.0	28.2
 ];
data.tW_OC(:,1) = data.tW_OC(:,1) + 138; % Add nursing period
units.tW_OC = {'d', 'g'}; label.tW_OC = {'time (days)', 'total weight'};  
temp.tW_OC = C2K(27);  units.temp.tW_OC = 'K'; label.temp.tW_OC = 'temperature';
bibkey.tW_OC = 'Raan1991'; comment.tW_OC = 'Data extracted from Fig.1, medians of the lnW distributions of individual males for each morphotype against time. The nursing period was 4 months.';
 
%BC
data.tW_BC = [... % time since metam (days), weight (g)
 0.0	11.4
14.0	14.8
28.0	17.6
42.0	20.6
56.0	24.0
70.0	32.3
84.0	42.1
98.0	41.8
112.0	42.5
126.0	41.5
140.0	41.6
];
data.tW_BC(:,1) = data.tW_BC(:,1) + 138; % Add nursing period
units.tW_BC = {'d', 'g'}; label.tW_BC = {'time (days)', 'total weight'};  
temp.tW_BC = C2K(27);  units.temp.tW_BC = 'K'; label.temp.tW_BC = 'temperature';
bibkey.tW_BC = 'Raan1991'; comment.tW_BC = 'Data extracted from Fig.1, medians of the lnW distributions of individual males for each morphotype against time. The nursing period was 4 months.';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0.1 * weights.tp;
% weights.tW_J = 0.2 * weights.tW_J;
% weights.LW_F = 10 * weights.LW_F;
% weights.tL_F = 0.2 *weights.tL_F;
weights.tW_BC = 10 * weights.tW_BC;
weights.tW_OC = 10 * weights.tW_OC;
weights.tW_SM = 10 * weights.tW_SM;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_F'}; comment1 = {'Weight-length for females'};
set2 = {'tW_SM','tW_OC','tW_BC'}; comment2 = {'Wet weight for males'};
metaData.grp.sets = {set1,set2};
metaData.grp.comment = {comment1,comment2};

%% Discussion points
D1 = 'We are considering that, after puberty, male morphotypes are defined by different zoom factors';
metaData.bibkey.D1 = 'Raan1991';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Morphological differences occur after puberty';
metaData.bibkey.F1 = 'Raan1991'; 
metaData.facts = struct('F1',F1);

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
bibkey = 'Pinh1998'; type = 'Article'; bib = [ ...
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
bibkey = 'DaSi2004'; type = 'Book'; bib = [ ...
'author = {Da Silva, R. R., Sampaio, C. M. S., & Santos, J. A.}, ' ...
'year = {2004}, ' ...
'title = {Fecundity and fertility of Macrobrachium amazonicum (Crustacea, Palaemonidae)}, ' ...
'journal = {Brazilian Journal of Biology}, ' ...
'volume = {64}, ' ...
'pages = {489-500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lalr2012'; type = 'Article'; bib = [ ...
'author = {P. L. Lalrinsanga, et al.}, ' ...
'year = {2012}, ' ...
'title = {Length weight relationship and condition factor of giant freshwater prawn Macrobrachium rosenbergii (De Man, 1879) based on developmental stages, culture stages and sex.}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {12.4}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Raan1991'; type = 'Article'; bib = [ ...
'author = {Ra´Anan, Z., Sagi, A., Wax, Y., Karplus, I., Hulata, G., & Kuris, A.}, ' ...
'year = {1991}, ' ...
'title = {Growth, size rank, and maturation of the freshwater prawn, Macrobrachium rosenbergii: analysis of marked prawns in an experimental population.}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {181}, ' ...
'pages = {379-386}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
