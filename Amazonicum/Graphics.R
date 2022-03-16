#Graphics
#MASS GAINED (%)
Wg=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Wg.csv" , header= FALSE, sep="," , dec=".")

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
legend("topright", ncol = 1, legend = c("DEB theory", "Augusto 2014 e 2016"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078), y =c(0.47, 0.23), pch=22, bg=c("lightblue","red"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(WgAle[,1],Wg[,1],
        WgAle[,3],Wg[,2],
        WgAle[,4],Wg[,3],
        WgAle[,5],Wg[,4],
        WgAle[,6],Wg[,5], 
        main="Mass gained (%)", col=c("red","lightblue"), at=c(1,2, 4,5, 7,8, 10,11, 13,14))

mtext("Female", side=1, line=1, at=1.5, las=1)
mtext("Males TC", side=1, line=1, at=4.5, las=1)
mtext("Males CC", side=1, line=1, at=7.5, las=1)
mtext("Males GC1", side=1, line=1, at=10.5, las=1)
mtext("Males GC2", side=1, line=1, at=13.5, las=1)

dev.off()

#DAILY GROWTH (g/d)       
Wg_d=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/Wg_d.csv" , header= FALSE, sep="," , dec=".")

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
legend("topright", ncol = 1, legend = c("DEB theory", "Augusto 2014 e 2016"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078), y =c(0.47, 0.23), pch=22, bg=c("lightblue","red"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(Wg_dAle[,1],Wg_d[,1],
        Wg_dAle[,3],Wg_d[,2],
        Wg_dAle[,4],Wg_d[,3],
        Wg_dAle[,5],Wg_d[,4],
        Wg_dAle[,6],Wg_d[,5], 
        main="Daily growth (g/d)", col=c("red","lightblue"), at=c(1,2, 4,5, 7,8, 10,11, 13,14))

mtext("Female", side=1, line=1, at=1.5, las=1)
mtext("Males TC", side=1, line=1, at=4.5, las=1)
mtext("Males CC", side=1, line=1, at=7.5, las=1)
mtext("Males GC1", side=1, line=1, at=10.5, las=1)
mtext("Males GC2", side=1, line=1, at=13.5, las=1)

dev.off()

#INGESTION RATE (mg/d)
JT_X=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/JT_X.csv" , header= FALSE, sep="," , dec=".")

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
legend("topright", ncol = 1, legend = c("DEB theory", "Augusto 2014 e 2016"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078), y =c(0.47, 0.23), pch=22, bg=c("lightblue","red"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(JT_XAle[,1],JT_X[,1],
        JT_XAle[,3],JT_X[,2],
        JT_XAle[,4],JT_X[,3],
        JT_XAle[,5],JT_X[,4],
        JT_XAle[,6],JT_X[,5], 
        main="Ingestion rate (mg/d)", col=c("red","lightblue"), at=c(1,2, 4,5, 7,8, 10,11, 13,14))

mtext("Female", side=1, line=1, at=1.5, las=1)
mtext("Males TC", side=1, line=1, at=4.5, las=1)
mtext("Males CC", side=1, line=1, at=7.5, las=1)
mtext("Males GC1", side=1, line=1, at=10.5, las=1)
mtext("Males GC2", side=1, line=1, at=13.5, las=1)

dev.off()

#FAECAL (g/d, mas tem q ser em mg/d)
JT_P=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/JT_P.csv" , header= FALSE, sep="," , dec=".")

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
legend("topright", ncol = 1, legend = c("DEB theory", "Augusto 2014 e 2016"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078), y =c(0.47, 0.23), pch=22, bg=c("lightblue","red"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(JT_PAle[,1],JT_P[,1],
        JT_PAle[,3],JT_P[,2],
        JT_PAle[,4],JT_P[,3],
        JT_PAle[,5],JT_P[,4],
        JT_PAle[,6],JT_P[,5], 
        main="Faecal", col=c("red","lightblue"), at=c(1,2, 4,5, 7,8, 10,11, 13,14))

mtext("Female", side=1, line=1, at=1.5, las=1)
mtext("Males TC", side=1, line=1, at=4.5, las=1)
mtext("Males CC", side=1, line=1, at=7.5, las=1)
mtext("Males GC1", side=1, line=1, at=10.5, las=1)
mtext("Males GC2", side=1, line=1, at=13.5, las=1)

dev.off()

#RESPIRATION (g)
EJO=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/EJO.csv" , header= FALSE, sep="," , dec=".")

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
legend("topright", ncol = 1, legend = c("DEB theory", "Augusto 2014 e 2016"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078), y =c(0.47, 0.23), pch=22, bg=c("lightblue","red"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(EJOAle[,1],EJO[,1],
        EJOAle[,3],EJO[,2],
        EJOAle[,4],EJO[,3],
        EJOAle[,5],EJO[,4],
        EJOAle[,6],EJO[,5], 
        main="Respiration (g)", col=c("red","lightblue"), at=c(1,2, 4,5, 7,8, 10,11, 13,14))

mtext("Female", side=1, line=1, at=1.5, las=1)
mtext("Males TC", side=1, line=1, at=4.5, las=1)
mtext("Males CC", side=1, line=1, at=7.5, las=1)
mtext("Males GC1", side=1, line=1, at=10.5, las=1)
mtext("Males GC2", side=1, line=1, at=13.5, las=1)

dev.off()

#EXCRETION (mg)
EJN=read.csv("C:/Users/saman/OneDrive/Documentos/MATLAB/Script/Amazonicum/Online/EJN.csv" , header= FALSE, sep="," , dec=".")

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
legend("topright", ncol = 1, legend = c("DEB theory", "Augusto 2014 e 2016"), cex = 1.5, bty = "n")
points(x = c(0.078, 0.078), y =c(0.47, 0.23), pch=22, bg=c("lightblue","red"), cex=3)

#Painel 2
par (mar=c(2.3, 2.3, 1.5, 1.5))
boxplot(EJNAle[,1],EJN[,1],
        EJNAle[,3],EJN[,2],
        EJNAle[,4],EJN[,3],
        EJNAle[,5],EJN[,4],
        EJNAle[,6],EJN[,5], 
        main="Excretion (mg)", col=c("red","lightblue"), at=c(1,2, 4,5, 7,8, 10,11, 13,14))

mtext("Female", side=1, line=1, at=1.5, las=1)
mtext("Males TC", side=1, line=1, at=4.5, las=1)
mtext("Males CC", side=1, line=1, at=7.5, las=1)
mtext("Males GC1", side=1, line=1, at=10.5, las=1)
mtext("Males GC2", side=1, line=1, at=13.5, las=1)

dev.off()