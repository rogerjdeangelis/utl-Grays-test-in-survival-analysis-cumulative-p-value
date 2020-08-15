Gray's test in survival analysis cumulative p value                                                             
                                                                                                                
This is the type of output I want                                                                               
                                                   P-Value                                                      
               RISK_TYPE                  STAT        PV      DF                                                
                                                                                                                
    Risk of cancer related mortality    5.81402    0.01590*    1                                                
    Risk of other cause mortality       0.85437    0.35532     1                                                
                                                                                                                
                                                                                                                
github                                                                                                          
https://tinyurl.com/y52gvcqk                                                                                    
https://github.com/rogerjdeangelis/utl-Grays-test-in-survival-analysis-cumulative-p-value                       
                                                                                                                
SAS Forum                                                                                                       
https://tinyurl.com/y5hzbp9r                                                                                    
https://communities.sas.com/t5/SAS-Enterprise-Guide/Gray-s-test-in-prior-version-of-SAS-STAT/m-p/676968         
                                                                                                                
Source                                                                                                          
https://tinyurl.com/y3kkd7sl                                                                                    
http://publicifsv.sund.ku.dk/~tag/Teaching/share/R-tutorials/Advanced-statistics/SurvivalAnalysis.html          
                                                                                                                
/*                   _                                                                                          
(_)_ __  _ __  _   _| |_                                                                                        
| | `_ \| `_ \| | | | __|                                                                                       
| | | | | |_) | |_| | |_                                                                                        
|_|_| |_| .__/ \__,_|\__|                                                                                       
        |_|                                                                                                     
*/                                                                                                              
                                                                                                                
options validvarname=upcase;                                                                                    
libname sd1 "d:/sd1";                                                                                           
data sd1.have;                                                                                                  
  informat sex $1. status 1. time 4.;                                                                           
  input sex time status @@;                                                                                     
cards4;                                                                                                         
M 0010 2 M 0030 2 M 0035 0 F 0099 2 M 0185 1 M 0204 1 M 0210 1 M 0232 1                                         
F 0232 2 F 0279 1 F 0295 1 F 0355 2 F 0386 1 M 0426 1 F 0469 1 M 0493 2                                         
M 0529 1 M 0621 1 M 0629 1 M 0659 1 F 0667 1 M 0718 1 M 0752 1 M 0779 1                                         
M 0793 1 F 0817 1 F 0826 2 F 0833 1 F 0858 1 F 0869 1 F 0872 1 M 0967 1                                         
M 0977 1 F 0982 1 M 1041 1 F 1055 1 M 1062 1 M 1075 1 F 1156 1 M 1228 1                                         
F 1252 1 F 1271 1 F 1312 1 M 1427 2 M 1435 1 M 1499 0 M 1506 1 M 1508 0                                         
F 1510 0 F 1512 0 M 1516 1 F 1525 2 F 1542 0 F 1548 1 F 1557 0 F 1560 1                                         
F 1563 0 M 1584 1 F 1605 0 F 1621 1 F 1627 0 F 1634 0 M 1641 0 F 1641 0                                         
F 1648 0 F 1652 0 M 1654 0 F 1654 0 F 1667 1 F 1678 0 F 1685 0 M 1690 1                                         
F 1710 0 M 1710 0 F 1726 1 F 1745 0 F 1762 0 M 1779 0 M 1787 0 F 1787 0                                         
F 1793 0 F 1804 0 M 1812 0 F 1836 0 F 1839 0 M 1839 0 F 1854 0 M 1856 0                                         
M 1860 2 F 1864 0 F 1899 0 F 1914 0 M 1919 0 M 1920 0 M 1927 0 F 1933 1                                         
F 1942 0 F 1955 0 F 1956 0 F 1958 0 F 1963 0 M 1970 0 F 2005 0 M 2007 0                                         
F 2011 0 F 2024 0 M 2028 0 F 2038 0 F 2056 0 M 2059 0 M 2061 1 F 2062 1                                         
M 2075 0 F 2085 2 M 2102 0 M 2103 1 F 2104 0 F 2108 1 F 2112 0 F 2150 0                                         
F 2156 0 M 2165 0 F 2209 0 F 2227 0 M 2227 0 F 2256 1 F 2264 0 F 2339 0                                         
M 2361 0 F 2387 0 M 2388 1 F 2403 0 F 2426 0 F 2426 0 F 2431 0 F 2460 0                                         
F 2467 1 F 2492 0 M 2493 0 F 2521 0 M 2542 0 F 2559 0 M 2565 1 F 2570 0                                         
F 2660 0 F 2666 0 F 2676 0 F 2738 0 M 2782 1 M 2787 0 M 2984 0 F 3032 0                                         
F 3040 0 F 3042 1 F 3067 0 M 3079 0 M 3101 0 M 3144 0 F 3152 0 M 3154 2                                         
F 3180 0 M 3182 2 F 3185 0 F 3199 0 F 3228 0 F 3229 0 M 3278 0 F 3297 0                                         
M 3328 0 M 3330 0 F 3338 1 F 3383 0 F 3384 0 F 3385 0 M 3388 0 M 3402 0                                         
F 3441 0 F 3458 2 F 3459 0 M 3459 0 F 3476 0 F 3523 0 F 3667 0 F 3695 0                                         
F 3695 0 M 3776 0 F 3776 0 M 3830 0 F 3856 0 F 3872 0 M 3909 0 F 3968 0                                         
F 4001 0 F 4103 0 M 4119 0 F 4124 0 M 4207 0 M 4310 0 F 4390 0 F 4479 0                                         
M 4492 0 F 4668 0 F 4688 0 F 4926 0 F 5565 0                                                                    
;;;;                                                                                                            
run;quit;                                                                                                       
                                                                                                                
/*           _               _                                                                                  
  ___  _   _| |_ _ __  _   _| |_                                                                                
 / _ \| | | | __| `_ \| | | | __|                                                                               
| (_) | |_| | |_| |_) | |_| | |_                                                                                
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                               
                |_|                                                                                             
*/                                                                                                              
                                                                                                                
WORK.WANT total obs=2                                                                                           
                                                                                                                
             RISK_TYPE                  STAT        PV      DF                                                  
                                                                                                                
  Risk of cancer related mortality    5.81402    0.01590*    1                                                  
  Risk of other cause mortality       0.85437    0.35532     1                                                  
                                                                                                                
* Significant                                                                                                   
                                                                                                                
                                                                                                                
The Gray test shows a significantly higher risk of cancer related death for males                               
compared to females (p-value= 0.0159).                                                                          
The Gray test shows no non-significant difference in risks of other cause mortality                             
between males and females (p-value= 0.3553).                                                                    
                                                                                                                
/*                                                                                                              
 _ __  _ __ ___   ___ ___  ___ ___                                                                              
| `_ \| `__/ _ \ / __/ _ \/ __/ __|                                                                             
| |_) | | | (_) | (_|  __/\__ \__ \                                                                             
| .__/|_|  \___/ \___\___||___/___/                                                                             
|_|                                                                                                             
*/                                                                                                              
                                                                                                                
%utl_submit_r64('                                                                                               
library(haven);                                                                                                 
library(cmprsk);                                                                                                
library(SASxport);                                                                                              
Melanoma<-read_sas("d:/sd1/have.sas7bdat");                                                                     
want <-as.data.frame(with(Melanoma,cuminc(ftime=TIME,fstatus=STATUS,group=SEX))$Tests);                         
str(want);                                                                                                      
want;                                                                                                           
write.xport(want,file="d:/xpt/want.xpt");                                                                       
');                                                                                                             
                                                                                                                
libname xpt xport "d:/xpt/want.xpt";                                                                            
data want;                                                                                                      
  retain risk_type;                                                                                             
  set xpt.want;                                                                                                 
  select(_n_);                                                                                                  
     when (1) risk_type="Risk of cancer related mortality";                                                     
     when (2) risk_type="Risk of other cause mortality";                                                        
  end; * otherwise not needed;                                                                                  
run;quit;                                                                                                       
libname xpt clear;                                                                                              
                                                                                                                
                                                                                                                
                                                                                                                
