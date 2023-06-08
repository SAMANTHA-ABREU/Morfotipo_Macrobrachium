#z test function
z.test = function(x,mu, sigma){ one.tail.p <- NULL
z.score <- round((mean(x)-mu)/(sigma/sqrt(length(x))),5)
one.tail.p <- round(pnorm(abs(z.score),lower.tail = FALSE),5) 
cat(" z =",z.score,"\n",
    "one-tailed probability =", one.tail.p,"\n",
    "two-tailed probability =", 2*one.tail.p )}

#Results
#P_am
setwd("~/MATLAB/Script/Amazonicum/Online/Camarao/Camarao")
#MASS GAINED (%)
Wgpam=read.csv("Wg.csv" , header= FALSE, sep="," , dec=".")
#DAILY GROWTH (g/d)
Wg_dpam=read.csv("Wg_d.csv" , header= FALSE, sep="," , dec=".")
#INGESTION RATE (mg/d)
JT_Xpam=read.csv("JT_X.csv" , header= FALSE, sep="," , dec=".")
#FAECAL (mg/d)
JT_Ppam=read.csv("JT_P.csv" , header= FALSE, sep="," , dec=".")
#RESPIRATION (g)
EJOpam=read.csv("EJO.csv" , header= FALSE, sep="," , dec=".")
#EXCRETION (mg)
EJNpam=read.csv("EJN.csv" , header= FALSE, sep="," , dec=".")

#P_M
setwd("~/MATLAB/Script/Amazonicum/P_m/FluxoP_m")
#MASS GAINED (%)
Wgpm=read.csv("WgpM.csv" , header= FALSE, sep="," , dec=".")
#DAILY GROWTH (g/d)
Wg_dpm=read.csv("Wg_dpM.csv" , header= FALSE, sep="," , dec=".")
#INGESTION RATE (mg/d)
JT_Xpm=read.csv("JT_XpM.csv" , header= FALSE, sep="," , dec=".")
#FAECAL (mg/d)
JT_Ppm=read.csv("JT_PpM.csv" , header= FALSE, sep="," , dec=".")
#RESPIRATION (g)
EJOpm=read.csv("EJOpM.csv" , header= FALSE, sep="," , dec=".")
#EXCRETION (mg)
EJNpm=read.csv("EJNpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
#MASS GAINED (%)
WgAle <- data.frame(Female = c(0.05, 0.07, 0.09),
                    MalesTC = c(0.5, 0.7, 0.9), 
                    MalesCC = c(9.5, 12.7, 15.9), 
                    MalesGC1 = c((16 - 3.7), 16, (16 + 3.7)), 
                    MalesGC2 = c((1.9-1.5), 1.9, (1.9+1.5)))
#DAILY GROWTH (g/d)
Wg_dAle <- data.frame(Female = c((0.0036-0.001), 0.0036, (0.0036+0.001)), 
                      MalesTC = c((0.015-0.005), 0.015, (0.015+0.005)), 
                      MalesCC = c((0.0246-0.0246), 0.0246, (0.0246+0.0246)), 
                      MalesGC1 = c((0.0537-0.0182), 0.0537, (0.0537+0.0182)), 
                      MalesGC2 = c((0.0075-0.0058), 0.0075, (0.0075+0.0058)))
#INGESTION RATE (mg/d)
JT_XAle <- data.frame(Female = c((2140-180), 2140, (2140+180)), 
                      MalesTC = c((190-100), 190, (190+100)), 
                      MalesCC = c((198-11.9), 198, (198+11.9)), 
                      MalesGC1 = c((316-30.1), 316, (316+30.1)), 
                      MalesGC2 = c((445-88), 445, (445+88)))
#FAECAL (mg/d)
JT_PAle <- data.frame(Female = c((4.91-0.57), 4.91, (4.91+0.57)), 
                      MalesTC = c((1.71-0.258), 1.71, (1.71+0.258)), 
                      MalesCC = c((2.95-0.47), 2.95, (2.95+0.47)), 
                      MalesGC1 = c((5.8-0.88), 5.8, (5.8+0.88)), 
                      MalesGC2 = c((8.85-1.78), 8.85, (8.85+1.78)))
#RESPIRATION (g)
EJOAle <- data.frame(Female = c((0.03-0.002), 0.03,(0.03+0.002)), 
                     MalesTC = c((0.01-0.003), 0.01, (0.01+0.003)), 
                     MalesCC = c((0.03-0.001), 0.03, (0.03+0.001)), 
                     MalesGC1 = c((0.06-0.01), 0.06, (0.06+0.01)), 
                     MalesGC2 = c((0.07-0.003), 0.07, (0.07+0.003)))
#EXCRETION (mg)
EJNAle <- data.frame(Female2 = c((4.65-0.29), 4.65, (4.65+0.29)), 
                     MalesTC = c((3.18-0.73), 3.18, (3.18+0.73)), 
                     MalesCC = c((0.87-0.18), 0.87, (0.87+0.18)), 
                     MalesGC1 = c((3.35-0.48), 3.35, (3.35+0.48)), 
                     MalesGC2 = c((13.53-0.54), 13.53, (13.53+0.54)))

#Teste z
#P_Am
#MASS GAINED (%)
z.test(Wgpam[,1], mean(WgAle[,1]), sd(WgAle[,1]))
z.test(Wgpam[,2], mean(WgAle[,2]), sd(WgAle[,2]))
z.test(Wgpam[,3], mean(WgAle[,3]), sd(WgAle[,3]))
z.test(Wgpam[,4], mean(WgAle[,4]), sd(WgAle[,4]))
z.test(Wgpam[,5], mean(WgAle[,5]), sd(WgAle[,5]))
#DAILY GROWTH (g/d)
z.test(Wg_dpam[,1], mean(Wg_dAle[,1]), sd(Wg_dAle[,1]))
z.test(Wg_dpam[,2], mean(Wg_dAle[,2]), sd(Wg_dAle[,2]))
z.test(Wg_dpam[,3], mean(Wg_dAle[,3]), sd(Wg_dAle[,3]))
z.test(Wg_dpam[,4], mean(Wg_dAle[,4]), sd(Wg_dAle[,4]))
z.test(Wg_dpam[,5], mean(Wg_dAle[,5]), sd(Wg_dAle[,5]))
#INGESTION RATE (mg/d)
z.test(JT_Xpam[,1], mean(JT_XAle[,1]), sd(JT_XAle[,1]))
z.test(JT_Xpam[,2], mean(JT_XAle[,2]), sd(JT_XAle[,2]))
z.test(JT_Xpam[,3], mean(JT_XAle[,3]), sd(JT_XAle[,3]))
z.test(JT_Xpam[,4], mean(JT_XAle[,4]), sd(JT_XAle[,4]))
z.test(JT_Xpam[,5], mean(JT_XAle[,5]), sd(JT_XAle[,5]))
#FAECAL (mg/d)
z.test(JT_Ppam[,1], mean(JT_PAle[,1]), sd(JT_PAle[,1]))
z.test(JT_Ppam[,2], mean(JT_PAle[,2]), sd(JT_PAle[,2]))
z.test(JT_Ppam[,3], mean(JT_PAle[,3]), sd(JT_PAle[,3]))
z.test(JT_Ppam[,4], mean(JT_PAle[,4]), sd(JT_PAle[,4]))
z.test(JT_Ppam[,5], mean(JT_PAle[,5]), sd(JT_PAle[,5]))
#RESPIRATION (g)
z.test(EJOpam[,1], mean(EJOAle[,1]), sd(EJOAle[,1]))
z.test(EJOpam[,2], mean(EJOAle[,2]), sd(EJOAle[,2]))
z.test(EJOpam[,3], mean(EJOAle[,3]), sd(EJOAle[,3]))
z.test(EJOpam[,4], mean(EJOAle[,4]), sd(EJOAle[,4]))
z.test(EJOpam[,5], mean(EJOAle[,5]), sd(EJOAle[,5]))
#EXCRETION (mg)
z.test(EJNpam[,1], mean(EJNAle[,1]), sd(EJNAle[,1]))
z.test(EJNpam[,2], mean(EJNAle[,2]), sd(EJNAle[,2]))
z.test(EJNpam[,3], mean(EJNAle[,3]), sd(EJNAle[,3]))
z.test(EJNpam[,4], mean(EJNAle[,4]), sd(EJNAle[,4]))
z.test(EJNpam[,5], mean(EJNAle[,5]), sd(EJNAle[,5]))

#Teste z
#P_m
#MASS GAINED (%)
z.test(Wgpm[,1], mean(WgAle[,1]), sd(WgAle[,1]))
z.test(Wgpm[,2], mean(WgAle[,2]), sd(WgAle[,2]))
z.test(Wgpm[,3], mean(WgAle[,3]), sd(WgAle[,3]))
z.test(Wgpm[,4], mean(WgAle[,4]), sd(WgAle[,4]))
z.test(Wgpm[,5], mean(WgAle[,5]), sd(WgAle[,5]))
#DAILY GROWTH (g/d)
z.test(Wg_dpm[,1], mean(Wg_dAle[,1]), sd(Wg_dAle[,1]))
z.test(Wg_dpm[,2], mean(Wg_dAle[,2]), sd(Wg_dAle[,2]))
z.test(Wg_dpm[,3], mean(Wg_dAle[,3]), sd(Wg_dAle[,3]))
z.test(Wg_dpm[,4], mean(Wg_dAle[,4]), sd(Wg_dAle[,4]))
z.test(Wg_dpm[,5], mean(Wg_dAle[,5]), sd(Wg_dAle[,5]))
#INGESTION RATE (mg/d)
z.test(JT_Xpm[,1], mean(JT_XAle[,1]), sd(JT_XAle[,1]))
z.test(JT_Xpm[,2], mean(JT_XAle[,2]), sd(JT_XAle[,2]))
z.test(JT_Xpm[,3], mean(JT_XAle[,3]), sd(JT_XAle[,3]))
z.test(JT_Xpm[,4], mean(JT_XAle[,4]), sd(JT_XAle[,4]))
z.test(JT_Xpm[,5], mean(JT_XAle[,5]), sd(JT_XAle[,5]))
#FAECAL (mg/d)
z.test(JT_Ppm[,1], mean(JT_PAle[,1]), sd(JT_PAle[,1]))
z.test(JT_Ppm[,2], mean(JT_PAle[,2]), sd(JT_PAle[,2]))
z.test(JT_Ppm[,3], mean(JT_PAle[,3]), sd(JT_PAle[,3]))
z.test(JT_Ppm[,4], mean(JT_PAle[,4]), sd(JT_PAle[,4]))
z.test(JT_Ppm[,5], mean(JT_PAle[,5]), sd(JT_PAle[,5]))
#RESPIRATION (g)
z.test(EJOpm[,1], mean(EJOAle[,1]), sd(EJOAle[,1]))
z.test(EJOpm[,2], mean(EJOAle[,2]), sd(EJOAle[,2]))
z.test(EJOpm[,3], mean(EJOAle[,3]), sd(EJOAle[,3]))
z.test(EJOpm[,4], mean(EJOAle[,4]), sd(EJOAle[,4]))
z.test(EJOpm[,5], mean(EJOAle[,5]), sd(EJOAle[,5]))
#EXCRETION (mg)
z.test(EJNpm[,1], mean(EJNAle[,1]), sd(EJNAle[,1]))
z.test(EJNpm[,2], mean(EJNAle[,2]), sd(EJNAle[,2]))
z.test(EJNpm[,3], mean(EJNAle[,3]), sd(EJNAle[,3]))
z.test(EJNpm[,4], mean(EJNAle[,4]), sd(EJNAle[,4]))
z.test(EJNpm[,5], mean(EJNAle[,5]), sd(EJNAle[,5]))

#Graphics
setwd("~/MATLAB/Script/Amazonicum")
x11(width=12, height=10)
png("Graficos08-06-2023-1pm.png", width= 1100, height = 1200, pointsize= 12)
layout(matrix(c(1, 2, 3, 4, 5, 6, 7, 4),ncol=2, nrow=4), width=c(0.2, 0.2), heights = c(0.8, 0.8, 0.8, 0.1))
layout.show(7)


#Painel 1 - MASS GAINED (%)
par (mar=c(2.3, 4.7, 1.5, 1.5))
boxplot(WgAle[,1], Wgpam[,1], Wgpm[,1],
        WgAle[,2], Wgpam[,2], Wgpm[,2],
        WgAle[,3], Wgpam[,3], Wgpm[,3],
        WgAle[,4], Wgpam[,4], Wgpm[,4],
        WgAle[,5], Wgpam[,5], Wgpm[,5], 
        main="Mass gained (%)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19), ylab="Percent (%)", cex.main = 2, cex.axis = 2, cex.lab = 2.5)

text(0.1,19,"A", font=2, cex = 2.5)
# mtext("Females", side=1, line=1, at=2, las=1)
# mtext("Males TC", side=1, line=1, at=6, las=1)
# mtext("Males CC", side=1, line=1, at=10, las=1)
# mtext("Males GC1", side=1, line=1, at=14, las=1)
# mtext("Males GC2", side=1, line=1, at=18, las=1)
text(2, max(Wgpam[,1])*1.3, "*", cex = 2.5)
text(3, max(Wgpm[,1])*1.3, "*", cex = 2.5)
text(6, max(Wgpam[,2])*1.3, "*", cex = 2.5)
text(7, max(Wgpm[,2])*1.3, "*", cex = 2.5)
text(10, max(Wgpam[,3])*1.3, "*", cex = 2.5)
text(11, max(Wgpm[,3])*1.3, "*", cex = 2.5)
text(14, max(Wgpam[,4])*1.3, "*", cex = 2.5)
text(15, max(Wgpm[,4])*1.3, "*", cex = 2.5)

#Painel 2 - #INGESTION RATE (mg/d)
par (mar=c(2.3, 4.7, 1.5, 1.5))
boxplot(JT_XAle[,1], JT_Xpam[,1], JT_Xpm[,1],
        JT_XAle[,2], JT_Xpam[,2], JT_Xpm[,2],
        JT_XAle[,3], JT_Xpam[,3], JT_Xpm[,3],
        JT_XAle[,4], JT_Xpam[,4], JT_Xpm[,4],
        JT_XAle[,5], JT_Xpam[,5], JT_Xpm[,5], 
        main="Ingestion rate (mg/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19), ylab="Milligrams per day (mg/d)", cex.main = 2, cex.axis = 2, cex.lab = 2.5)

text(0.1,2300,"C", font=2, cex = 2.5)
# mtext("Females", side=1, line=1, at=2, las=1)
# mtext("Males TC", side=1, line=1, at=6, las=1)
# mtext("Males CC", side=1, line=1, at=10, las=1)
# mtext("Males GC1", side=1, line=1, at=14, las=1)
# mtext("Males GC2", side=1, line=1, at=18, las=1)
text(2, max(JT_Xpam[,1])*1.5, "*", cex = 2.5)
text(3, max(JT_Xpm[,1])*1.5, "*", cex = 2.5)
text(6, max(JT_Xpam[,2])*1.5, "*", cex = 2.5)
text(7, max(JT_Xpm[,2])*1.5, "*", cex = 2.5)
text(10, max(JT_Xpam[,3])*1.5, "*", cex = 2.5)
text(11, max(JT_Xpm[,3])*1.5, "*", cex = 2.5)
text(14, max(JT_Xpam[,4])*1.5, "*", cex = 2.5)
text(15, max(JT_Xpm[,4])*1.5, "*", cex = 2.5)
text(18, max(JT_Xpam[,5])*1.5, "*", cex = 2.5)
text(19, max(JT_Xpm[,5])*1.5, "*", cex = 2.5)

#Painel 3 - RESPIRATION (g)
par (mar=c(2.3, 4.7, 1.5, 1.5))
boxplot(EJOAle[,1], EJOpam[,1], EJOpm[,1],
        EJOAle[,2], EJOpam[,2], EJOpm[,2],
        EJOAle[,3], EJOpam[,3], EJOpm[,3],
        EJOAle[,4], EJOpam[,4], EJOpm[,4],
        EJOAle[,5], EJOpam[,5], EJOpm[,5], 
        main="Respiration (g/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19), ylab="Grams per day (g/d)", cex.main = 2, cex.axis = 2, cex.lab = 2.5)

text(0.1,0.125,"E", font=2, cex = 2.5)
mtext("Females", side=1, line=1, at=2, las=1, cex = 1.5)
mtext("Males TC", side=1, line=1, at=6, las=1, cex = 1.5)
mtext("Males CC", side=1, line=1, at=10, las=1, cex = 1.5)
mtext("Males GC1", side=1, line=1, at=14, las=1, cex = 1.5)
mtext("Males GC2", side=1, line=1, at=18, las=1, cex = 1.5)
text(2, max(EJOpam[,1])*1.05, "*", cex = 2.5)
text(3, max(EJOpm[,1])*1.05, "*", cex = 2.5)
text(6, max(EJOpam[,2])*1.05, "*", cex = 2.5)
text(7, max(EJOpm[,2])*1.05, "*", cex = 2.5)
text(10, max(EJOpam[,3])*1.05, "*", cex = 2.5)
text(11, max(EJOpm[,3])*1.05, "*", cex = 2.5)
text(14, max(EJOpam[,4])*1.05, "*", cex = 2.5)
text(18, max(EJOpam[,5])*1.03, "*", cex = 2.5)
text(19, max(EJOpm[,5])*1.05, "*", cex = 2.5)

#Painel 4
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
text(x = 0.0105, y = 0.27, "Experimental data", cex = 2.5, bty = "n")
text(x = 0.04, y = 0.27, "Morphotype-specific assimilation model", cex = 2.5, bty = "n")
text(x = 0.082, y = 0.27, "Morphotype-specific somatic maintenance model", cex = 2.5, bty = "n")
points(x = c(0.001, 0.0215, 0.0592), y = c(0.3, 0.3, 0.3), pch=22, bg=c("red", "lightblue", "orange"), cex=5)


#Painel 5 - DAILY GROWTH (g/d)
par (mar=c(2.3, 4.7, 1.5, 1.5))
boxplot(Wg_dAle[,1], Wg_dpam[,1], Wg_dpm[,1],
        Wg_dAle[,2], Wg_dpam[,2], Wg_dpm[,2],
        Wg_dAle[,3], Wg_dpam[,3], Wg_dpm[,3],
        Wg_dAle[,4], Wg_dpam[,4], Wg_dpm[,4],
        Wg_dAle[,5], Wg_dpam[,5], Wg_dpm[,5], 
        main="Daily growth (g/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19), ylab="Grams per day (g/d)", cex.main = 2, cex.axis = 2, cex.lab = 2.5)

text(0.1,0.145,"B", font=2, cex = 2.5)
# mtext("Females", side=1, line=1, at=2, las=1)
# mtext("Males TC", side=1, line=1, at=6, las=1)
# mtext("Males CC", side=1, line=1, at=10, las=1)
# mtext("Males GC1", side=1, line=1, at=14, las=1)
# mtext("Males GC2", side=1, line=1, at=18, las=1)
text(2, max(Wg_dpam[,1])*1.05, "*", cex = 2.5)
text(3, max(Wg_dpm[,1])*1.05, "*", cex = 2.5)
text(6, max(Wg_dpam[,2])*1.05, "*", cex = 2.5)
text(10, max(Wg_dpam[,3])*1.05, "*", cex = 2.5)
text(14, max(Wg_dpam[,4])*1.05, "*", cex = 2.5)
text(15, max(Wg_dpm[,4])*1.05, "*", cex = 2.5)
text(18, max(Wg_dpam[,5])*1.05, "*", cex = 2.5)
text(19, max(Wg_dpm[,5])*1.03, "*", cex = 2.5)

#Painel 6 - #FAECAL (mg/d)
par (mar=c(2.3, 4.7, 1.5, 1.5))
boxplot(JT_PAle[,1], JT_Ppam[,1], JT_Ppm[,1],
        JT_PAle[,2], JT_Ppam[,2], JT_Ppm[,2],
        JT_PAle[,3], JT_Ppam[,3], JT_Ppm[,3],
        JT_PAle[,4], JT_Ppam[,4], JT_Ppm[,4],
        JT_PAle[,5], JT_Ppam[,5], JT_Ppm[,5], 
        main="Production of faeces (mg/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19), ylab="Milligrams per day (mg/d)", cex.main = 2, cex.axis = 2, cex.lab = 2.5)

text(0.1,10.5,"D", font=2, cex = 2.5)
# mtext("Females", side=1, line=1, at=2, las=1)
# mtext("Males TC", side=1, line=1, at=6, las=1)
# mtext("Males CC", side=1, line=1, at=10, las=1)
# mtext("Males GC1", side=1, line=1, at=14, las=1)
# mtext("Males GC2", side=1, line=1, at=18, las=1)
text(2, max(JT_Ppam[,1])*1.05, "*", cex = 2.5)
text(3, max(JT_Ppm[,1])*1.05, "*", cex = 2.5)
text(6, max(JT_Ppam[,2])*1.08, "*", cex = 2.5)
text(10, max(JT_Ppam[,3])*1.05, "*", cex = 2.5)
text(11, max(JT_Ppm[,3])*1.05, "*", cex = 2.5)
text(14, max(JT_Ppam[,4])*1.05, "*", cex = 2.5)
text(15, max(JT_Ppm[,4])*1.05, "*", cex = 2.5)
text(18, max(JT_Ppam[,5])*1.05, "*", cex = 2.5)
text(19, max(JT_Ppm[,5])*1.05, "*", cex = 2.5)

#Painel 7 - #EXCRETION (mg)
par (mar=c(2.3, 4.7, 1.5, 1.5))
boxplot(EJNAle[,1], EJNpam[,1], EJNpm[,1],
        EJNAle[,2], EJNpam[,2], EJNpm[,2],
        EJNAle[,3], EJNpam[,3], EJNpm[,3],
        EJNAle[,4], EJNpam[,4], EJNpm[,4],
        EJNAle[,5], EJNpam[,5], EJNpm[,5], 
        main="Excretion (mg/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19), ylab="Milligrams per day (mg/d)", cex.main = 2, cex.axis = 2, cex.lab = 2.5)

text(0.1,14,"F", font=2, cex = 2.5)
mtext("Females", side=1, line=1, at=2, las=1, cex = 1.5)
mtext("Males TC", side=1, line=1, at=6, las=1, cex = 1.5)
mtext("Males CC", side=1, line=1, at=10, las=1, cex = 1.5)
mtext("Males GC1", side=1, line=1, at=14, las=1, cex = 1.5)
mtext("Males GC2", side=1, line=1, at=18, las=1, cex = 1.5)
text(6, max(EJNpam[,2])*1.1, "*", cex = 2.5)
text(7, max(EJNpm[,2])*1.1, "*", cex = 2.5)
text(10, max(EJNpam[,3])*1.1, "*", cex = 2.5)
text(11, max(EJNpm[,3])*1.1, "*", cex = 2.5)
text(14, max(EJNpam[,4])*1.1, "*", cex = 2.5)
text(15, max(EJNpm[,4])*1.1, "*", cex = 2.5)
text(18, max(EJNpam[,5])*1.1, "*", cex = 2.5)
text(19, max(EJNpm[,5])*1.1, "*", cex = 2.5)

dev.off()
