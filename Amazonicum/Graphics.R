#RMSE = sqrt(mean((WgAle[,1] - Wg[,1])^2))

#Graphics
#MASS GAINED (%)
#P_am
Wgpam=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Camarao/Camarao/Wg.csv" , header= FALSE, sep="," , dec=".")

#P_M
Wgpm=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/P_m/FluxoP_m/WgpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
WgAle <- data.frame(Female1 = c(0.001, 0.003, 0.005), 
                    Female2 = c(0.05, 0.07, 0.09),
                    MalesTC = c(0.5, 0.7, 0.9), 
                    MalesCC = c(9.5, 12.7, 15.9), 
                    MalesGC1 = c(12.3, 16, (16 + 3.7)), 
                    MalesGC2 = c((1.9-1.5), 1.9, (1.9+1.5)))

x11(12, 10)
png("Mass gained.png", width= 800, height = 600, pointsize= 12)
layout(matrix(c(1, 2),ncol=1, nrow=2), width=c(0.8, 0.2), heights = c(0.1, 0.8))
layout.show(2)

#Painel 1
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
legend("right", ncol = 1, legend = c("Augusto 2014 e 2016", "DEB theory P_am", "DEB theory P_m"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078, 0.078), y =c(0.58, 0.34, 0.1), pch=22, bg=c("red", "lightblue", "orange"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(WgAle[,1], Wgpam[,1], Wgpm[,1],
        WgAle[,3], Wgpam[,2], Wgpm[,2],
        WgAle[,4], Wgpam[,3], Wgpm[,3],
        WgAle[,5], Wgpam[,4], Wgpm[,4],
        WgAle[,6], Wgpam[,5], Wgpm[,5], 
        main="Mass gained (%)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19))

mtext("Female", side=1, line=1, at=2, las=1)
mtext("Males TC", side=1, line=1, at=6, las=1)
mtext("Males CC", side=1, line=1, at=10, las=1)
mtext("Males GC1", side=1, line=1, at=14, las=1)
mtext("Males GC2", side=1, line=1, at=18, las=1)

dev.off()

#DAILY GROWTH (g/d) 
#P_am      
Wg_dpam=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Camarao/Camarao/Wg_d.csv" , header= FALSE, sep="," , dec=".")

#P_M
Wg_dpm=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/P_m/FluxoP_m/Wg_dpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
Wg_dAle <- data.frame(Female1 = c((0.00025-0.00025), 0.00025, (0.00025+0.00025)), 
                      Female2 = c((0.0036-0.001), 0.0036, (0.0036+0.001)), 
                      MalesTC = c((0.015-0.005), 0.015, (0.015+0.005)), 
                      MalesCC = c((0.0246-0.0246), 0.0246, (0.0246+0.0246)), 
                      MalesGC1 = c((0.0537-0.0182), 0.0537, (0.0537+0.0182)), 
                      MalesGC2 = c((0.0075-0.0058), 0.0075, (0.0075+0.0058)))
x11(12, 10)
png("Daily growth.png", width= 800, height = 600, pointsize= 12)
layout(matrix(c(1, 2),ncol=1, nrow=2), width=c(0.8, 0.2), heights = c(0.1, 0.8))
layout.show(2)

#Painel 1
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
legend("right", ncol = 1, legend = c("Augusto 2014 e 2016", "DEB theory P_am", "DEB theory P_m"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078, 0.078), y =c(0.58, 0.34, 0.1), pch=22, bg=c("red", "lightblue", "orange"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(Wg_dAle[,1], Wg_dpam[,1], Wg_dpm[,1],
        Wg_dAle[,3], Wg_dpam[,2], Wg_dpm[,2],
        Wg_dAle[,4], Wg_dpam[,3], Wg_dpm[,3],
        Wg_dAle[,5], Wg_dpam[,4], Wg_dpm[,4],
        Wg_dAle[,6], Wg_dpam[,5], Wg_dpm[,5], 
        main="Daily growth (g/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19))

mtext("Female", side=1, line=1, at=2, las=1)
mtext("Males TC", side=1, line=1, at=6, las=1)
mtext("Males CC", side=1, line=1, at=10, las=1)
mtext("Males GC1", side=1, line=1, at=14, las=1)
mtext("Males GC2", side=1, line=1, at=18, las=1)

dev.off()

#INGESTION RATE (mg/d)
#P_am
JT_Xpam=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Camarao/Camarao/JT_X.csv" , header= FALSE, sep="," , dec=".")

#P_M
JT_Xpm=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/P_m/FluxoP_m/JT_XpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
JT_XAle <- data.frame(Female1 = c((210-46), 210, (210+46)), 
                      Female2 = c((2140-180), 2140, (2140+180)), 
                      MalesTC = c((190-100), 190, (190+100)), 
                      MalesCC = c((198-11.9), 198, (198+11.9)), 
                      MalesGC1 = c((316-30.1), 316, (316+30.1)), 
                      MalesGC2 = c((445-88), 445, (445+88)))
x11(12, 10)
png("Ingestion rate.png", width= 800, height = 600, pointsize= 12)
layout(matrix(c(1, 2),ncol=1, nrow=2), width=c(0.8, 0.2), heights = c(0.1, 0.8))
layout.show(2)

#Painel 1
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
legend("right", ncol = 1, legend = c("Augusto 2014 e 2016", "DEB theory P_am", "DEB theory P_m"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078, 0.078), y =c(0.58, 0.34, 0.1), pch=22, bg=c("red", "lightblue", "orange"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(JT_XAle[,1], JT_Xpam[,1], JT_Xpm[,1],
        JT_XAle[,3], JT_Xpam[,2], JT_Xpm[,2],
        JT_XAle[,4], JT_Xpam[,3], JT_Xpm[,3],
        JT_XAle[,5], JT_Xpam[,4], JT_Xpm[,4],
        JT_XAle[,6], JT_Xpam[,5], JT_Xpm[,5], 
        main="Ingestion rate (mg/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19))

mtext("Female", side=1, line=1, at=2, las=1)
mtext("Males TC", side=1, line=1, at=6, las=1)
mtext("Males CC", side=1, line=1, at=10, las=1)
mtext("Males GC1", side=1, line=1, at=14, las=1)
mtext("Males GC2", side=1, line=1, at=18, las=1)

dev.off()

#FAECAL (g/d, mas tem q ser em mg/d)
#P_am
JT_Ppam=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Camarao/Camarao/JT_P.csv" , header= FALSE, sep="," , dec=".")

#P_M
JT_Ppm=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/P_m/FluxoP_m/JT_PpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
JT_PAle <- data.frame(Female1 = c((5.13-1.39), 5.13, (5.13+1.39)), 
                      Female2 = c((4.91-0.57), 4.91, (4.91+0.57)), 
                      MalesTC = c((1.71-0.258), 1.71, (1.71+0.258)), 
                      MalesCC = c((2.95-0.47), 2.95, (2.95+0.47)), 
                      MalesGC1 = c((5.8-0.88), 5.8, (5.8+0.88)), 
                      MalesGC2 = c((8.85-1.78), 8.85, (8.85+1.78)))
x11(12, 10)
png("Faecal.png", width= 800, height = 600, pointsize= 12)
layout(matrix(c(1, 2),ncol=1, nrow=2), width=c(0.8, 0.2), heights = c(0.1, 0.8))
layout.show(2)

#Painel 1
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
legend("right", ncol = 1, legend = c("Augusto 2014 e 2016", "DEB theory P_am", "DEB theory P_m"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078, 0.078), y =c(0.58, 0.34, 0.1), pch=22, bg=c("red", "lightblue", "orange"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(JT_PAle[,1], JT_Ppam[,1], JT_Ppm[,1],
        JT_PAle[,3], JT_Ppam[,2], JT_Ppm[,2],
        JT_PAle[,4], JT_Ppam[,3], JT_Ppm[,3],
        JT_PAle[,5], JT_Ppam[,4], JT_Ppm[,4],
        JT_PAle[,6], JT_Ppam[,5], JT_Ppm[,5], 
        main="Faecal (mg/d)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19))

mtext("Female", side=1, line=1, at=2, las=1)
mtext("Males TC", side=1, line=1, at=6, las=1)
mtext("Males CC", side=1, line=1, at=10, las=1)
mtext("Males GC1", side=1, line=1, at=14, las=1)
mtext("Males GC2", side=1, line=1, at=18, las=1)

dev.off()

#RESPIRATION (g)
#P_am
EJOpam=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Camarao/Camarao/EJO.csv" , header= FALSE, sep="," , dec=".")

#P_M
EJOpm=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/P_m/FluxoP_m/EJOpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
EJOAle <- data.frame(Female1 = c((0.07-0.003), 0.07, (0.07+0.003)), 
                     Female2 = c((0.03-0.002), 0.03,(0.03+0.002)), 
                     MalesTC = c((0.01-0.003), 0.01, (0.01+0.003)), 
                     MalesCC = c((0.03-0.001), 0.03, (0.03+0.001)), 
                     MalesGC1 = c((0.06-0.01), 0.06, (0.06+0.01)), 
                     MalesGC2 = c((0.07-0.003), 0.07, (0.07+0.003)))
x11(12, 10)
png("Respiration.png", width= 800, height = 600, pointsize= 12)
layout(matrix(c(1, 2),ncol=1, nrow=2), width=c(0.8, 0.2), heights = c(0.1, 0.8))
layout.show(2)

#Painel 1
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
legend("right", ncol = 1, legend = c("Augusto 2014 e 2016", "DEB theory P_am", "DEB theory P_m"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078, 0.078), y =c(0.58, 0.34, 0.1), pch=22, bg=c("red", "lightblue", "orange"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(EJOAle[,1], EJOpam[,1], EJOpm[,1],
        EJOAle[,3], EJOpam[,2], EJOpm[,2],
        EJOAle[,4], EJOpam[,3], EJOpm[,3],
        EJOAle[,5], EJOpam[,4], EJOpm[,4],
        EJOAle[,6], EJOpam[,5], EJOpm[,5], 
        main="Respiration (g)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19))

mtext("Female", side=1, line=1, at=2, las=1)
mtext("Males TC", side=1, line=1, at=6, las=1)
mtext("Males CC", side=1, line=1, at=10, las=1)
mtext("Males GC1", side=1, line=1, at=14, las=1)
mtext("Males GC2", side=1, line=1, at=18, las=1)

dev.off()

#EXCRETION (mg)
#P_am
EJNpam=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Camarao/Camarao/EJN.csv" , header= FALSE, sep="," , dec=".")

#P_M
EJNpm=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/P_m/FluxoP_m/EJNpM.csv" , header= FALSE, sep="," , dec=".")

#Augusto 2014, 2016
EJNAle <- data.frame(Female1 = c((2.13-0.29), 2.13, (2.13+0.29)), 
                     Female2 = c((4.65-0.29), 4.65, (4.65+0.29)), 
                     MalesTC = c((3.18-0.73), 3.18, (3.18+0.73)), 
                     MalesCC = c((0.87-0.18), 0.87, (0.87+0.18)), 
                     MalesGC1 = c((3.35-0.48), 3.35, (3.35+0.48)), 
                     MalesGC2 = c((13.53-0.54), 13.53, (13.53+0.54)))

x11(12, 10)
png("Excretion.png", width= 800, height = 600, pointsize= 12)
layout(matrix(c(1, 2),ncol=1, nrow=2), width=c(0.8, 0.2), heights = c(0.1, 0.8))
layout.show(2)

#Painel 1
par (mar=c(0, 0, 0, 0))
plot(x=NULL,y=NULL, xlim=c(0, 0.1), ylim=c(0.0, 0.7),type="n", xaxt="n", yaxt="n",xlab="", ylab="", bty="n")
legend("right", ncol = 1, legend = c("Augusto 2014 e 2016", "DEB theory P_am", "DEB theory P_m"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078, 0.078), y =c(0.58, 0.34, 0.1), pch=22, bg=c("red", "lightblue", "orange"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(EJNAle[,1], EJNpam[,1], EJNpm[,1],
        EJNAle[,3], EJNpam[,2], EJNpm[,2],
        EJNAle[,4], EJNpam[,3], EJNpm[,3],
        EJNAle[,5], EJNpam[,4], EJNpm[,4],
        EJNAle[,6], EJNpam[,5], EJNpm[,5], 
        main="Excretion (mg)", col=c("red","lightblue","orange"), at=c(1,2,3, 5,6,7, 9,10,11, 13,14,15, 17,18,19))

mtext("Female", side=1, line=1, at=2, las=1)
mtext("Males TC", side=1, line=1, at=6, las=1)
mtext("Males CC", side=1, line=1, at=10, las=1)
mtext("Males GC1", side=1, line=1, at=14, las=1)
mtext("Males GC2", side=1, line=1, at=18, las=1)

dev.off()