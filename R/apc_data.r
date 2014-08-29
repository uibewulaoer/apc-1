#######################################################
#	apc package
#	Bent Nielen, 27 August 2014, version 1
#	Data examples
#######################################################

###############################
#	JAPANESE BREAST CANCER DATA
###############################
data.Japanese.breast.cancer	<- function()
#	BN, 17 oct 2013
#	An example with A,P,C effects
#
#	Taken from table I of
#	Clayton, D. and Schifflers, E. (1987b)
#	Models for temperoral variation in cancer rates. II: age-period-cohort models.
#	Statistics in Medicine 6, 469-481.
#
#	Original Table caption:
#	age-specific mortality rates (per 100,000 person-years observation) of breast cancer in Japan,
#	during the period 1955-1979. Numbers of cases on which rates are based are in parentheses
#	(source: WHO mortality data base).  
{	#	data.Japanese.breast.cancer
v.rates		<- c( 0.44, 0.38, 0.46, 0.55, 0.68,
			 	  1.69, 1.69, 1.75, 2.31, 2.52,
				  4.01, 3.90, 4.11, 4.44, 4.80,
				  6.59, 6.57, 6.81, 7.79, 8.27,
				  8.51, 9.61, 9.96,11.68,12.51,
				 10.49,10.80,12.36,14.59,16.56,
				 11.36,11.51,12.98,14.97,17.79,
				 12.03,10.67,12.67,14.46,16.42,
				 12.55,12.03,12.10,13.81,16.46,
				 15.81,13.87,12.65,14.00,15.60,
				 17.97,15.62,15.83,15.71,16.52)
v.cases		<- c(   88,   78,  101,  127,  179,
				   299,  330,  363,  509,  588,
				   596,  680,  798,  923, 1056,
				   874,  962, 1171, 1497, 1716,
				  1022, 1247, 1429, 1987, 2398,
				  1035, 1258, 1560, 2079, 2794,
				   970, 1087, 1446, 1828, 2465,
				   820,  861, 1126, 1549, 1962,
				   678,  738,  878, 1140, 1683,
				   640,  628,  656,  900, 1162,
				   497,  463,  536,  644,  865)				 
row.names	<- c("25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79")
col.names	<- c("1955-1959","1960-1964","1965-1969","1970-1974","1975-1979")
rates	<- matrix(data=v.rates,nrow=11, ncol=5,byrow=TRUE,dimnames=list(row.names,col.names))
cases	<- matrix(data=v.cases,nrow=11, ncol=5,byrow=TRUE,dimnames=list(row.names,col.names))
return(list(rates		=rates			,
			response	=cases			,
			dose		=cases/rates	,
			data.format	="AP"			,
			age1		=25				,
			per1		=1955			,
			coh1		=NULL			,
			unit		=5				,
			per.zero	=NULL			,
			per.max	=NULL				,
			time.adjust	=0				))
}	#	data.Japanese.breast.cancer



##################################
#	ITALIAN BLADDER CANCER DATA
##################################
data.Italian.bladder.cancer	<- function()
#	BN, 17 oct 2013
#	An example with A,C effects
#
#	Taken from table IV of
#	Clayton, D. and Schifflers, E. (1987a)
#	Models for temperoral variation in cancer rates. I: age-period and age-cohort models.
#	Statistics in Medicine 6, 449-467.
#
#	Original Table caption:
#	age-specific incidence rates (per 100,000 person-years observation) of bladder cancer in
#	Italian males during the period 1955-1979. Numerators are in parentheses
#	(source of data: WHO mortality database).  
{	#	data.Italian.bladder.cancer
v.rates		<- c( 0.03, 0.03, 0.01, 0.04,  0.12,
				  0.17, 0.18, 0.12, 0.08,  0.09,
				  0.32, 0.31, 0.35, 0.42,  0.32,
				  1.04, 1.05, 0.91, 1.04,  1.27,
				  2.86, 2.52, 2.61, 3.04,  3.16,
				  6.64, 7.03, 6.43, 6.46,  8.47,
				 12.71,13.39,14.59,14.64, 16.38,
				 20.11,23.98,26.69,27.55, 28.53,
				 24.40,33.16,42.12,47.77, 50.37,
				 32.81,42.31,52.87,66.01, 74.64,
				 45.54,47.94,62.05,84.65,104.21)
v.cases		<- c(   3,   3,   1,   4,  12,
  				   16,  17,  11,   8,   8,
				   24,  29,  33,  39,  30,
				   79,  76,  82,  95, 115,
				  234, 185, 183, 267, 285,
				  458, 552, 450, 431, 723,
				  720, 867,1069, 974,1004,
				  890,1230,1550,1840,1811,
				  891,1266,1829,2395,3028,
				  920,1243,1584,2292,3176,
				  831, 937,1285,1787,2659)
				 			 
row.names	<- c("25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79")
col.names	<- c("1955-1959","1960-1964","1965-1969","1970-1974","1975-1979")

rates	<- matrix(data=v.rates,nrow=11, ncol=5,byrow=TRUE,dimnames=list(row.names,col.names))
cases	<- matrix(data=v.cases,nrow=11, ncol=5,byrow=TRUE,dimnames=list(row.names,col.names))

return(list(rates		=rates			,
			response	=cases			,
			dose		=cases/rates	,
			data.format	="AP"			,
			age1		=25				,
			per1		=1955			,
			coh1		=NULL			,
			unit		=5				,
			per.zero	=NULL			,
				per.max	=NULL			,
			time.adjust	=0				))
}	#	data.Italian.bladder.cancer

##################################
#	BELGIAN LUNG CANCER DATA
##################################
data.Belgian.lung.cancer	<- function(unbalanced=FALSE)
#	BN, 17 oct 2013
#	An example with A,drift effects
#
#	Taken from table VIII of
#	Clayton, D. and Schifflers, E. (1987a)
#	Models for temperoral variation in cancer rates. I: age-period and age-cohort models.
#	Statistics in Medicine 6, 449-467.
#
#	Original Table caption:
#	age-specific mortality rates (per 100,000 person-years observation) of lung cancer in
#	Belgian females during the period 1955-1978. Numerators are shown in parentheses
#	(source of data: WHO mortality database).
#
#	NOTE	The data are unbalanced since the last column only covers 4 years.  This is not used.
#	In:		unbalanced		logical.  If true unbalanced version includind last column
{	#	data.Belgian.lung.cancer
v.rates		<- c( 0.19, 0.13, 0.50, 0.19, 0.70,
				  0.66, 0.98, 0.72, 0.71, 0.57,
				  0.78, 1.32, 1.47, 1.64, 1.32,
				  2.67, 3.16, 2.53, 3.38, 3.93,
				  4.84, 5.60, 4.93, 6.05, 6.83,
				  6.60, 8.50, 7.65,10.59,10.42,
				 10.36,12.00,12.68,14.34,17.95,
				 14.76,16.37,18.00,17.60,23.91,
				 20.53,22.60,24.90,24.33,32.70,
				 26.24,27.70,30.47,36.94,38.47,
				 33.47,33.61,36.77,43.69,45.20)
v.cases		<- c(  3,  2,  7,  3, 10,
				  11, 16, 11, 10,  7,
				  11, 22, 24, 25, 15,
				  36, 44, 42, 53, 48,
				  77, 74, 68, 99, 88,
				 106,131, 99,142,134,
				 157,184,189,180,177,
				 193,232,262,249,239,
				 219,267,323,325,343,
				 223,250,308,412,358,
				 198,214,253,338,312)
row.names	<- c("25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79")
col.names	<- c("1955-1959","1960-1964","1965-1969","1970-1974","1975-1978")
rates	<- matrix(data=v.rates,nrow=11, ncol=5,byrow=TRUE,dimnames=list(row.names,col.names))
cases	<- matrix(data=v.cases,nrow=11, ncol=5,byrow=TRUE,dimnames=list(row.names,col.names))
index.col	<-seq(1,4);	if(unbalanced)	index.col<-seq(1:5);

return(list(rates		=rates[,index.col]			,
			response	=cases[,index.col]			,
			dose		=cases[,index.col]/rates[,index.col],
			data.format	="AP"					,
			age1		=25						,
			per1		=1955					,
			coh1		=NULL					,
			unit		=5						,
			per.zero	=NULL					,
			per.max		=NULL					,
			time.adjust	=0						))
}	#	data.Belgian.lung.cancer


##################################
#	UK Asbestos data
##################################
data.asbestos	<- function(all.age.groups=FALSE)
#	BN, 17 oct 2013
#
#	Taken from
#	Martinez Miranda, Nielsen and Nielsen (2013)
#	Inference and forecasting in the age-period-cohort model with unknown exposure with
#	an application to mesothelioma mortality.
#	To appear in Journal of the Royal Statistical Society series A
#
#	
#	update of data from the Health and Safety Executive
{	#	data.asbestos
v.cases	<-c(0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,1	,1	,0	,2	,0	,1	,2	,0	,0	,1	,0	,0	,2	,1	,1	,1	,1	,4	,1	,1	,4	,5	,3	,5	,3	,3	,6	,3	,2	,3	,4	,1	,4	,1	,0	,2	,1	,0	,1	,0	,0	,0	,0	,2	,0	,0	,0	,1	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,1	,1	,0	,0	,1	,0	,0	,0	,0	,0	,1	,2	,0	,3	,0	,1	,3	,4	,1	,1	,2	,6	,1	,1	,3	,3	,5	,3	,4	,1	,5	,3	,8	,3	,4	,4	,5	,3	,1	,3	,2	,2	,3	,1	,0	,3	,1	,4	,2	,0	,1	,1	,3	,1	,0	,0	,1	,0	,1	,1	,0	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,1	,3	,2	,2	,3	,0	,1	,1	,1	,0	,3	,1	,4	,6	,8	,3	,6	,3	,10	,6	,7	,6	,4	,2	,6	,5	,8	,4	,1	,0	,2	,1	,3	,1	,1	,1	,2	,1	,0	,0	,0	,0	,1	,0	,1	,0	,0	,0	,1	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,1	,0	,1	,0	,0	,1	,1	,2	,1	,0	,1	,1	,4	,2	,1	,2	,5	,4	,6	,5	,10	,3	,4	,11	,10	,5	,9	,1	,5	,4	,7	,6	,3	,2	,4	,6	,5	,0	,1	,0	,0	,1	,2	,2	,1	,0	,1	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,2	,0	,0	,1	,1	,1	,1	,1	,3	,0	,1	,0	,3	,3	,4	,3	,2	,4	,3	,5	,5	,1	,1	,10	,7	,4	,7	,5	,2	,5	,13	,1	,5	,3	,4	,0	,6	,5	,1	,4	,2	,2	,1	,1	,1	,2	,1	,0	,0	,1	,1	,1	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,1	,0	,0	,0	,0	,0	,1	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,1	,2	,1	,6	,1	,2	,5	,2	,4	,4	,2	,3	,4	,6	,9	,7	,8	,8	,3	,6	,6	,5	,2	,6	,7	,4	,10	,5	,5	,3	,5	,6	,2	,1	,1	,2	,0	,3	,0	,1	,1	,0	,1	,1	,0	,2	,0	,0	,0	,0	,0	,0	,1,
			1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,0	,1	,0	,1	,0	,0	,1	,1	,1	,1	,1	,1	,0	,4	,4	,1	,5	,5	,6	,1	,6	,5	,2	,6	,1	,5	,8	,5	,9	,9	,6	,7	,8	,5	,3	,7	,9	,7	,4	,8	,2	,5	,4	,2	,1	,4	,2	,0	,1	,0	,1	,1	,1	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,2	,0	,0	,0	,2	,0	,1	,3	,4	,3	,5	,2	,6	,2	,5	,3	,4	,4	,11	,3	,5	,10	,10	,3	,6	,11	,7	,8	,6	,6	,4	,9	,10	,7	,5	,2	,3	,2	,0	,4	,0	,0	,2	,2	,0	,2	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,1	,1	,1	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,2	,1	,2	,2	,1	,2	,6	,2	,3	,12	,7	,5	,3	,4	,3	,4	,3	,8	,8	,6	,11	,11	,9	,11	,11	,4	,6	,10	,5	,7	,6	,9	,3	,3	,3	,3	,5	,0	,4	,2	,3	,1	,1	,0	,0	,0	,1	,0	,1	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,1	,0	,1	,1	,2	,0	,0	,2	,2	,2	,0	,1	,0	,3	,3	,3	,7	,5	,4	,5	,9	,5	,8	,9	,5	,7	,5	,14	,13	,5	,11	,9	,7	,10	,8	,9	,9	,12	,8	,2	,11	,7	,7	,3	,0	,4	,3	,3	,1	,2	,3	,1	,0	,2	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,1	,0	,0	,2	,0	,3	,2	,2	,1	,3	,3	,5	,6	,1	,5	,7	,5	,6	,5	,6	,5	,11	,9	,4	,10	,4	,9	,9	,9	,14	,13	,10	,7	,6	,8	,10	,10	,8	,7	,7	,9	,8	,2	,4	,2	,2	,1	,3	,2	,1	,1	,1	,1	,0	,0	,0	,0	,1	,0	,0	,0,
			0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,1	,1	,0	,2	,1	,0	,0	,1	,1	,2	,2	,2	,2	,1	,5	,3	,7	,5	,5	,9	,8	,9	,13	,11	,9	,8	,8	,12	,11	,9	,12	,6	,23	,5	,17	,11	,8	,4	,5	,8	,13	,12	,12	,9	,8	,3	,5	,4	,6	,3	,1	,0	,1	,1	,1	,0	,0	,2	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,1	,0	,1	,1	,1	,2	,1	,0	,1	,3	,3	,1	,0	,5	,0	,4	,8	,4	,7	,10	,10	,9	,9	,12	,11	,10	,10	,8	,8	,6	,8	,14	,10	,13	,13	,15	,15	,10	,13	,15	,8	,12	,8	,11	,6	,6	,6	,3	,1	,2	,2	,2	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,1	,0	,2	,0	,0	,3	,1	,2	,1	,1	,6	,2	,7	,3	,5	,5	,6	,11	,11	,13	,8	,8	,13	,12	,17	,9	,15	,8	,6	,10	,13	,17	,16	,14	,12	,11	,10	,9	,12	,8	,4	,9	,5	,7	,7	,4	,0	,1	,1	,2	,1	,3	,1	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,1	,1	,1	,1	,2	,4	,3	,3	,1	,1	,4	,4	,3	,6	,3	,4	,10	,3	,9	,10	,17	,12	,13	,14	,18	,17	,11	,14	,18	,12	,12	,16	,14	,12	,12	,11	,12	,5	,14	,9	,7	,11	,12	,3	,7	,7	,5	,3	,1	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,1	,2	,0	,1	,2	,1	,4	,3	,3	,4	,4	,2	,3	,5	,5	,5	,3	,4	,4	,11	,10	,7	,14	,5	,18	,13	,15	,12	,22	,11	,13	,10	,15	,21	,12	,14	,14	,16	,22	,15	,6	,14	,6	,11	,8	,5	,4	,2	,1	,3	,3	,2	,1	,1	,0	,1	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,3	,0	,1	,2	,1	,5	,6	,3	,6	,4	,4	,5	,10	,7	,9	,13	,10	,12	,16	,14	,21	,21	,18	,12	,16	,11	,11	,5	,20	,24	,14	,21	,11	,15	,20	,14	,17	,11	,9	,7	,7	,9	,6	,12	,2	,3	,1	,3	,0	,2	,0	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,2	,1	,3	,1	,2	,2	,3	,2	,6	,5	,2	,6	,9	,8	,11	,9	,4	,9	,13	,14	,20	,10	,22	,26	,12	,25	,22	,19	,14	,19	,11	,21	,20	,14	,18	,15	,14	,19	,11	,7	,12	,11	,12	,12	,12	,4	,9	,5	,3	,1	,2	,2	,1	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,1	,0	,0	,4	,1	,0	,0	,2	,3	,4	,3	,4	,6	,4	,8	,7	,2	,2	,3	,11	,15	,14	,18	,14	,12	,24	,16	,26	,27	,16	,16	,23	,8	,8	,11	,14	,16	,24	,18	,24	,17	,12	,7	,22	,12	,8	,7	,6	,8	,4	,8	,3	,3	,1	,2	,0	,0	,2	,0	,1	,0	,0,
			0	,0	,1	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,1	,0	,0	,0	,3	,2	,1	,2	,2	,2	,5	,4	,7	,9	,4	,4	,4	,6	,10	,9	,16	,9	,12	,13	,20	,24	,18	,19	,27	,25	,19	,25	,25	,21	,16	,23	,19	,25	,20	,13	,20	,18	,15	,14	,14	,12	,6	,9	,9	,9	,2	,4	,2	,1	,2	,0	,0	,1	,0	,0	,0	,1,
			0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,1	,3	,3	,3	,1	,3	,6	,4	,5	,5	,4	,7	,5	,16	,11	,9	,19	,11	,12	,18	,16	,17	,22	,30	,27	,27	,28	,25	,29	,20	,37	,23	,16	,19	,13	,16	,16	,30	,21	,20	,21	,15	,10	,18	,7	,13	,7	,6	,4	,3	,2	,1	,1	,0	,0	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,3	,1	,3	,4	,3	,3	,4	,4	,9	,10	,8	,8	,14	,9	,16	,6	,11	,11	,19	,21	,22	,29	,24	,21	,16	,27	,30	,31	,26	,36	,35	,26	,24	,20	,34	,23	,24	,19	,17	,19	,18	,17	,12	,6	,5	,4	,5	,7	,2	,2	,3	,2	,2	,2	,0	,0	,0	,1,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,1	,0	,2	,3	,2	,2	,2	,1	,5	,4	,2	,3	,8	,6	,3	,7	,14	,11	,10	,13	,12	,19	,18	,19	,23	,21	,39	,24	,33	,22	,25	,29	,29	,38	,30	,29	,17	,25	,15	,12	,30	,27	,23	,18	,15	,15	,16	,12	,7	,7	,9	,4	,4	,3	,2	,0	,2	,0	,0	,1	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,0	,6	,3	,8	,3	,3	,5	,9	,9	,10	,11	,13	,15	,13	,15	,16	,14	,23	,14	,21	,18	,27	,23	,30	,30	,29	,21	,35	,22	,31	,34	,25	,20	,32	,20	,21	,19	,22	,18	,15	,16	,12	,6	,7	,11	,8	,4	,3	,2	,0	,0	,1	,0	,0	,0	,2,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,1	,1	,1	,1	,3	,2	,10	,6	,4	,6	,10	,12	,10	,11	,13	,13	,13	,20	,23	,17	,24	,22	,26	,18	,25	,40	,28	,29	,42	,37	,35	,33	,42	,39	,30	,23	,25	,25	,19	,22	,16	,19	,14	,15	,14	,6	,11	,5	,3	,1	,2	,1	,2	,1	,0	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,2	,3	,1	,1	,4	,2	,10	,2	,3	,7	,14	,13	,14	,12	,16	,21	,23	,22	,15	,21	,22	,30	,26	,30	,32	,18	,40	,27	,37	,37	,30	,34	,46	,29	,32	,34	,22	,34	,24	,38	,28	,22	,17	,14	,8	,8	,9	,5	,7	,5	,3	,2	,0	,2	,2	,0	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,1	,1	,0	,1	,0	,0	,1	,3	,2	,5	,2	,4	,5	,6	,6	,13	,12	,19	,9	,7	,21	,19	,18	,22	,29	,18	,17	,17	,27	,29	,37	,29	,27	,30	,43	,42	,37	,38	,50	,41	,46	,26	,26	,29	,30	,26	,15	,22	,22	,17	,19	,11	,6	,6	,6	,2	,4	,0	,1	,2	,1	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,2	,3	,0	,6	,8	,10	,19	,19	,13	,24	,17	,21	,16	,23	,23	,27	,23	,26	,33	,26	,47	,49	,38	,52	,39	,40	,40	,43	,34	,35	,40	,35	,36	,25	,27	,25	,25	,23	,16	,15	,16	,9	,7	,7	,9	,8	,4	,4	,1	,2	,0	,0	,1,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,1	,0	,0	,0	,0	,1	,1	,2	,8	,3	,4	,8	,6	,11	,11	,12	,15	,18	,13	,22	,22	,25	,31	,26	,35	,28	,29	,27	,31	,45	,51	,48	,40	,44	,55	,54	,32	,43	,47	,52	,30	,30	,26	,29	,26	,15	,19	,13	,6	,7	,11	,3	,3	,5	,6	,5	,0	,2	,0	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,1	,0	,1	,0	,0	,2	,2	,1	,3	,0	,1	,5	,6	,9	,17	,13	,20	,11	,18	,15	,24	,22	,23	,30	,25	,25	,24	,38	,31	,35	,31	,51	,42	,47	,44	,55	,48	,48	,39	,44	,41	,40	,32	,17	,21	,28	,22	,20	,11	,21	,16	,13	,6	,10	,6	,2	,4	,0	,1	,0	,2,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,1	,0	,2	,3	,2	,4	,6	,5	,7	,10	,13	,15	,13	,22	,24	,21	,16	,20	,28	,30	,30	,32	,47	,29	,34	,37	,37	,43	,53	,46	,49	,49	,38	,38	,51	,36	,61	,34	,22	,21	,23	,26	,18	,19	,20	,12	,15	,3	,7	,9	,2	,1	,0	,2	,1	,0,
			0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,1	,0	,2	,0	,0	,0	,1	,1	,2	,0	,0	,2	,3	,4	,2	,7	,13	,10	,15	,15	,17	,24	,27	,24	,23	,26	,28	,24	,26	,42	,30	,29	,40	,40	,53	,46	,44	,54	,42	,50	,69	,50	,49	,38	,64	,44	,39	,30	,31	,23	,28	,23	,26	,13	,10	,7	,7	,3	,5	,4	,4	,3	,0,
			0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,2	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,1	,2	,2	,2	,2	,6	,4	,7	,9	,13	,19	,8	,17	,25	,29	,33	,36	,35	,41	,45	,39	,34	,40	,42	,43	,43	,51	,50	,42	,40	,45	,62	,56	,71	,54	,52	,49	,45	,27	,21	,26	,24	,21	,18	,12	,13	,9	,7	,5	,3	,1	,0	,1	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,1	,0	,0	,1	,0	,0	,0	,5	,1	,7	,5	,4	,8	,9	,7	,15	,23	,18	,17	,21	,26	,29	,28	,38	,43	,38	,42	,57	,42	,35	,45	,50	,52	,61	,51	,66	,54	,57	,43	,50	,61	,54	,40	,38	,22	,20	,20	,22	,25	,18	,10	,9	,5	,4	,2	,1	,2	,0	,1,
			0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,2	,0	,1	,2	,1	,6	,3	,3	,4	,5	,11	,10	,20	,13	,25	,25	,32	,30	,35	,30	,40	,36	,43	,41	,55	,41	,47	,50	,54	,51	,70	,49	,57	,57	,62	,63	,72	,57	,59	,58	,55	,52	,24	,18	,22	,24	,21	,20	,7	,8	,6	,3	,4	,1	,2	,0,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,0	,0	,0	,0	,1	,1	,1	,3	,2	,2	,9	,9	,13	,16	,21	,27	,29	,35	,34	,28	,35	,39	,37	,45	,74	,52	,41	,57	,48	,61	,51	,79	,65	,77	,62	,73	,60	,51	,45	,49	,48	,34	,39	,20	,17	,15	,19	,8	,12	,12	,8	,4	,4	,3	,0	,4,
			0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,2	,0	,0	,3	,3	,6	,4	,7	,8	,10	,13	,15	,30	,24	,26	,24	,46	,40	,37	,49	,47	,32	,53	,41	,65	,59	,58	,48	,66	,53	,53	,53	,68	,55	,64	,67	,60	,53	,47	,41	,42	,22	,25	,17	,21	,12	,11	,6	,4	,3	,4	,0	,2,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,1	,0	,0	,1	,0	,2	,4	,3	,3	,2	,6	,5	,2	,7	,6	,14	,7	,17	,26	,26	,25	,40	,30	,49	,41	,47	,59	,56	,49	,50	,64	,68	,64	,54	,74	,62	,69	,61	,59	,56	,72	,67	,53	,46	,37	,52	,39	,22	,14	,12	,13	,13	,10	,5	,7	,4	,1	,4,
			0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,1	,0	,0	,2	,0	,0	,2	,1	,1	,3	,1	,2	,3	,2	,3	,5	,7	,11	,13	,14	,13	,19	,18	,37	,32	,37	,38	,38	,55	,49	,57	,48	,54	,74	,62	,57	,57	,68	,61	,73	,60	,66	,69	,54	,61	,74	,61	,53	,42	,44	,33	,32	,21	,22	,13	,6	,10	,5	,9	,0	,1	,1,
			0	,0	,0	,0	,1	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,2	,0	,0	,1	,1	,1	,3	,4	,5	,3	,2	,9	,3	,11	,16	,4	,18	,28	,31	,33	,31	,31	,40	,58	,60	,52	,59	,63	,62	,78	,52	,57	,67	,59	,75	,81	,69	,71	,64	,56	,56	,55	,47	,39	,41	,29	,37	,19	,15	,8	,5	,10	,7	,2	,6	,5,
			0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,0	,1	,0	,0	,2	,1	,0	,1	,0	,0	,4	,0	,0	,3	,1	,6	,2	,3	,5	,4	,9	,8	,16	,14	,27	,52	,49	,46	,39	,46	,41	,65	,45	,62	,76	,80	,58	,61	,51	,75	,67	,62	,85	,84	,65	,70	,55	,60	,58	,45	,47	,38	,36	,31	,9	,11	,10	,6	,3	,5	,3	,9)
row.names	<- NULL			
for(i in 1967:2007)	row.names	<- c(row.names,as.character(i))
	col.names	<- c("5-9","10-14","15-19","20-24")
for(i in 25:94)		col.names	<- c(col.names,as.character(i))
	col.names	<- c(col.names,"95+")			
cases	<- matrix(data=v.cases,nrow=41, ncol=75, byrow=TRUE,dimnames=list(row.names,col.names))
index.columns	<- seq(5,69); if(all.age.groups)	index.columns	<- seq(1,75);
return(list(response		=cases[,index.columns]	,
			dose			=NULL			,
			data.format		="PA"			,
			age1			=25				,
			per1			=1967			,
			coh1			=NULL			,
			unit			=1				,
			per.zero		=NULL			,
			per.max			=NULL			,
			time.adjust		=0				))
}	#	data.asbestos						

apc.data.list	<- function(response, data.format, dose=NULL, age1=1, per1=1, coh1=1, unit=1, per.zero=NULL, per.max=NULL, time.adjust=0)
#	BN 25 oct 2013
#	This function constructs list of apc.data.list type.
#	This gives the user a single focus for entering information about the data.
#	Only response and data.format are obligatory input.
#	in:		response		matrix of responses
#			dose			NULL or matrix of dose.
#			data.format		character indicating format of data.matrix
#									"AP"		has    age/period as increasing row/column index
#									"AC"		has    age/cohort as increasing row/column index
#									"CA"		has cohort/age    as increasing row/column index
#									"CL"		has cohort/age 	  as increasing row/column index, triangular
#									"CL.vector.by.row"		row-wise vector version of "CL"
#									"CP"		has cohort/period as increasing row/column index
#									"PA"		has period/age    as increasing row/column index
#									"PC"		has period/cohort as increasing row/column index
#									"trapezoid"	has    age/period as increasing row/column index,
#													period-diagonals are NA for period <= per.zero and >per.zero+per.max 
#			age1			smallest age    index (not used for data.format="CP", "PC")
#			per1			smallest period index (not used for data.format="AC","CA","CL","CL.vector.by.row","trapezoid")
#			coh1			smallest cohort index (not used for data.format="AP","PA")
#			unit			time units for indices
#  			per.zero		Only used for data.format="trapezoid".
#									Entries in upper triangle with period <= per.zero are interpreted as NA.
#  			per.max 		Only used for data.format="trapezoid".
# 	 								Entries in lower triangle with period > per.zero+per.max are interpreted as NA.
#			time.adjust		Only two of age1, per1, coh1 are used.
#							The third is computed according to the formula
#							age1+coh1=per1+time.adjust
#	out		list including all 8 arguments.
{	#	apc.data.list
	##############################
	#	check obligatory input
	if(is.matrix(response)==FALSE)
		return(cat("apc.error: response is not a matrix \n"))
	data.format.list	<- c("AP","AC","CA","CL","CL.vector.by.row","CP","PA","PC","trap","trapezoid")
	if(isTRUE(data.format %in% data.format.list)==FALSE)
		return(cat("apc.error: model.family has wrong argument \n"))
	#	check "CL" input
	if(data.format=="CL")
	{
		if(ncol(response) != nrow(response))	return(cat("apc.error: Response matrix is not square \n"))
		k	<- nrow(response)
		for(age in 2:k)
			for(coh in (k+1-age):k)
				if(is.na(response[coh,age])==FALSE) return(cat("apc.error: Lower triangle of response matrix should be NA \n"))
	}		

	##############################
	if(data.format=="trap")			data.format	<- "trapezoid"
	if(data.format=="trapezoid")
	{
		if(is.null(per.zero))	per.zero	<-0;
		if(is.null(per.max))	per.max	<-nrow(response)+ncol(response)-1-per.zero;
	}
	else
	{	per.zero	<- NULL;
		per.max	<- NULL;
	}
	return(list(response	=response	,
				dose		=dose		,
				data.format	=data.format,
				age1		=age1		,
				per1		=per1		,
				coh1		=coh1		,
				unit		=unit		,
				per.zero	=per.zero	,
				per.max		=per.max	,
				time.adjust	=time.adjust))
}	#	apc.data.list