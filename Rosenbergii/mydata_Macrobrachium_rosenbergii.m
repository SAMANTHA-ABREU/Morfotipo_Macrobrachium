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
metaData.data_1     = {'t-W_J';'t-L_F';'L-W_F';'t-W_F';'t-W_SM';'t-W_OC';'t-W_BC'};

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
data.tp = 150;      units.tp = 'd';    label.tp = 'time at puberty';  bibkey.tp = 'Pinh1998';   
  temp.tp = C2K(28);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tb  = 'periodo varia de 120 a 180 dias';
data.am = 1095;    units.am = 'd';   label.am = 'life span';  bibkey.am = 'New2000';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Ri  = 100000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DaSi2004';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.Li_F  = 29;   units.Li_F  = 'cm';   label.Li_F  = 'ultimate total length';  bibkey.Li_F  = 'New2002';
  comment.Li_F = 'Ultimate length for female';
data.Li_BC  = 33;   units.Li_BC  = 'cm';   label.Li_BC  = 'ultimate total length';  bibkey.Li_BC  = 'New2002';
   comment.Li_BC = 'Ultimate length of males BC';
data.Li_OC  = 23.82;   units.Li_OC  = 'cm';   label.Li_OC  = 'ultimate total length';  bibkey.Li_OC  = 'Iket2016';
  comment.Li_OC = 'Ultimate length of males OC';
data.Li_SM  = 15.77;   units.Li_SM  = 'cm';   label.Li_SM  = 'ultimate total length';  bibkey.Li_SM  = 'Iket2016';
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
data.tW_J(:,1) = data.tW_J(:,1) * 7; % convert weeks to d
units.tW_J = {'d', 'g'}; label.tW_J = {'time (days)', 'total weight'};  
temp.tW_J = C2K(26);  units.temp.tW_J = 'K'; label.temp.tW_J = 'temperature';
bibkey.tW_J = 'Raan1984';
comment.tW_J = 'Data for juveniles'; comment.tW_J = 'Data extracted from Fig.2';

%Females
data.LW_F = [... % length (cm),weight (g)
6.52709	2.63158
6.83498	2.63158
7.69704	3.50877
8.25123	5.26316
9.17488	7.01754
10.4064	9.64912
11.3916	13.1579
12.2537	23.6842
13.2389	17.5439
12.1921	15.7895
13.1158	34.2105
13.4236	34.2105
13.67	28.9474
13.8547	21.0526
14.8399	28.0702
14.3473	32.4561
14.3473	39.4737
14.6552	38.5965
15.1478	43.8596
15.7635	47.3684
15.3941	32.4561
16.3177	38.5965
16.8719	42.1053
16.4409	50.8772
16.0099	64.0351
16.6256	71.9298
16.9951	55.2632
17.2414	48.2456
17.6724	53.5088
18.1034	58.7719
17.7956	64.0351
18.0419	73.6842
18.4729	81.5789
18.5345	57.8947
18.9039	71.9298
19.335	78.0702
19.5813	66.6667
20.3202	71.9298
19.8892	86.8421
19.9507	94.7368
20.2586	87.7193
20.936	87.7193
20.3202	99.1228
19.7044	107.018
20.0123	109.649
20.9975	103.509
21.4286	96.4912
21.6133	111.404
20.9975	118.421
21.9828	117.544
22.4138	112.281
22.4754	123.684
22.1059	129.825
21.6133	129.825
21.1207	128.947
21.6133	140.351
 ];
units.LW_F = {'cm', 'g'}; label.LW_F = {'length (cm)', 'weight (g)'};  
temp.LW_F = C2K(28);  units.temp.LW_F = 'K'; label.temp.LW_F = 'temperature';
bibkey.LW_F = 'Lalr2012'; comment.LW_F = 'Data extracted from Fig.2';

data.tL_F = [... % time (months), length (mm)
0.41276	72.0189
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
 ];
data.tL_F(:,1) = data.tL_F(:,1) * 30; % convert months to d
data.tL_F(:,2) = data.tL_F(:,2) / 10; % convert mm to cm
units.tL_F = {'d', 'cm'}; label.tL_F = {'time (days)', 'total length'};  
temp.tL_F = C2K(30);  units.temp.tL_F = 'K'; label.temp.tL_F = 'temperature';
bibkey.tL_F = 'ITAR1997'; comment.tL_F = 'Data extracted from Fig.2';

% data.tW_F = [... % time (days),Weight (g/2m²)
% 45.2735	5.2696
% 60.1264	7.65517
% 75.2474	34.9645
% 88.1679	62.3309
% 102.172	150.611
% 115.091	183.518
% 130.166	377.033
% 142.257	421.041
% 152.13	526.049
%  ];
% data.tW_F(:,1) = data.tW_F(:,1);
% data.tW_F(:,2) = data.tW_F(:,2) / 40;
% units.tW_F = {'d', 'g'}; label.tW_F = {'time (days)', 'total weight'};  
% temp.tW_F = C2K(26);  units.temp.tW_F = 'K'; label.temp.tW_F = 'temperature';
% bibkey.tW_F = 'Sagi1986'; comment.tW_F = 'Data extracted from Fig.1';

%Males
%SM
data.tW_SM = [... % time (weeks),Weight (g)
0.00848351	0.256202
2.07189	0.571104
4.06606	0.795069
6.05722	0.928123
8.04592	0.986796
10.0393	1.18597
12.0302	1.31076
14.0208	1.42728
16.0051	1.35372
18.06	1.41242
20.0512	1.54548
 ];
data.tW_SM(:,1) = data.tW_SM(:,1) * 7; % convert weeks to d
data.tW_SM(:,2) = exp(data.tW_SM(:,2)); % convert logs of masses to masses
units.tW_SM = {'d', 'g'}; label.tW_SM = {'time (days)', 'total weight'};  
temp.tW_SM = C2K(27);  units.temp.tW_SM = 'K'; label.temp.tW_SM = 'temperature';
bibkey.tW_SM = 'Raan1991'; comment.tW_SM = 'Data extracted from Fig.1';

%OC
data.tW_OC = [... % time (weeks),Weight (g)
0.0301028	0.909103
2.03248	1.38101
4.03103	1.7372
6.02493	1.9529
8.02047	2.21819
10.0157	2.47521
12.0096	2.69091
14.0657	2.78267
16.0593	2.99011
18.0482	3.05704
20.0443	3.33886
 ];
data.tW_OC(:,1) = data.tW_OC(:,1) * 7; % convert weeks to d
data.tW_OC(:,2) = exp(data.tW_OC(:,2)); % convert logs of masses to masses
units.tW_OC = {'d', 'g'}; label.tW_OC = {'time (days)', 'total weight'};  
temp.tW_OC = C2K(27);  units.temp.tW_OC = 'K'; label.temp.tW_OC = 'temperature';
bibkey.tW_OC = 'Raan1991'; comment.tW_OC = 'Data extracted from Fig.1';
 
%BC
data.tW_BC = [... % time (weeks),Weight (g)
0.0804565	2.42979
2.00977	2.69505
4.0023	2.86942
6.06051	3.0273
8.05221	3.17688
10.0488	3.47523
12.0444	3.74051
14.0309	3.73307
16.1507	3.75048
18.0704	3.72648
20.0572	3.7273
];
data.tW_BC(:,1) = data.tW_BC(:,1) * 7; % convert weeks to d
data.tW_BC(:,2) = exp(data.tW_BC(:,2)); % convert logs of masses to masses
units.tW_BC = {'d', 'g'}; label.tW_BC = {'time (days)', 'total weight'};  
temp.tW_BC = C2K(27);  units.temp.tW_BC = 'K'; label.temp.tW_BC = 'temperature';
bibkey.tW_BC = 'Raan1991'; comment.tW_BC = 'Data extracted from Fig.1';

%% set weights for all real data
weights = setweights(data, []);
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
bibkey = 'New2002'; type = 'Book'; bib = [ ...
'author = {New, Michael B.}, ' ...
'year = {2002}, ' ...
'title = {Farming freshwater prawns: a manual for the culture of the giant river prawn (Macrobrachium rosenbergii).}, ' ...
'journal = {Food & Agriculture Org.}, ' ...
'volume = {428}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iket2016'; type = 'Article'; bib = [ ...
'author = {Iketani, G., Aviz, M. A. B., Maciel, C., Valenti, W., Schneider, H., & Sampaio, I.}, ' ...
'year = {2016}, ' ...
'title = {Successful invasion of the Amazon Coast by the giant river prawn, Macrobrachium rosenbergii: evidence of a reproductively viable population.}, ' ...
'journal = {Aquatic Invasions}, ' ...
'volume = {11.3}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Raan1984'; type = 'Article'; bib = [ ...
'author = {Ra´Anan, Ziva, and Dan Cohen}, ' ...
'year = {1984}, ' ...
'title = {The effect of group interactions on the development of size distribution in Macrobrachium rosenbergii (de Man) juvenile populations.}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {166}, ' ...
'pages = {22-31}'];
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
bibkey = 'ITAR1997'; type = 'Article'; bib = [ ...
'author = {M. ITARIKRTsHNAN, and B. MADHUsoooeNaiKURU}, ' ...
'year = {1997}, ' ...
'title = {Growth, mortality and exploitation of male and female populations of Macrobrachiutn rosenbergii (de Man) in the Vembanad lake, India.}, ' ...
'journal = {}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'Sagi1986'; type = 'Article'; bib = [ ...
% 'author = {Amir Sagi, Ziva Ra´anan, Dan Cohen and Yohanan Wax}, ' ...
% 'year = {1986}, ' ...
% 'title = Production of Macrobrachium rosenbergii in monosex populations: yield characteristics under intensive monoculture conditions in cages.}, ' ...
% 'journal = {Aquaculture}, ' ...
% 'volume = {51}, ' ...
% 'pages = {265-275}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Raan1991'; type = 'Article'; bib = [ ...
'author = {Ra´Anan, Z., Sagi, A., Wax, Y., Karplus, I., Hulata, G., & Kuris, A.}, ' ...
'year = {1991}, ' ...
'title = {Growth, size rank, and maturation of the freshwater prawn, Macrobrachium rosenbergii: analysis of marked prawns in an experimental population.}, ' ...
'journal = {The Biological Bulletin}, ' ...
'volume = {181}, ' ...
'pages = {379-386}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
