\name{data.loss.VNJ}
\alias{data.loss.VNJ}
\title{Motor data}
\description{
Function that organises motor data in \code{\link{apc.data.list}} format.

The data set is taken from tables 1,2 of Verrall, Nielsen and Jessen (2010).
Data from Codan, Danish subsiduary of Royal & Sun Alliance.
It is a portfolio of third party liability from motor policies. The time units are in years.
There are two run-off triangles:
"response" (X) is paid amounts (units not reported)
"counts" (N) is number of reported claims.

Data also analysed in e.g.
Martinez Miranda, Nielsen, Nielsen and Verrall (2011)
and 
Kuang, Nielsen, Nielsen (2015).

The data set is in "CL"-format.

At present \code{apc.package} does not have functions for either forecasting or for exploiting the counts.
For this one can with advantage use the \code{DCL.package}.
}
\usage{data.loss.VNJ}
\value{The value is a list in \code{\link{apc.data.list}} format.
	\item{response}{vector of paid amounts, X}
	\item{counts}{vector of number of reported claims, N}
	\item{dose}{NULL.}
	\item{data.format}{logical. Equal to "CL.vector.by.row".  Data organised in vectors.}
	\item{age1}{numeric. Equal to 1.}
	\item{per1}{NULL. Not needed when data.format="CL"}
	\item{coh1}{numeric. Equal to 1.}
	\item{unit}{numeric. Equal to 1.}
	\item{per.zero}{NULL.  Not needed when data.format="CL"} 
	\item{per.max}{NULL.  Not needed when data.format="CL"} 
	\item{time.adjust}{0.  Thus age=1 in cohort=1 corresponds to period=1+1-1+0=1.}	
	\item{label}{character. "loss VNJ".}						
}
\source{Tables 1,2 of Verrall, Nielsen and Jessen (2010).}
\references{
Verrall R, Nielsen JP, Jessen AH (2010)
Prediction of RBNS and IBNR claims using claim amounts and claim counts
\emph{ASTIN Bulletin} 40, 871-887

Martinez Miranda, M.D., Nielsen, B., Nielsen, J.P. and Verrall, R. (2011) Cash flow simulation for a model of outstanding liabilities based on claim amounts and claim numbers. \emph{ASTIN Bulletin} 41, 107-129

Kuang D, Nielsen B, Nielsen JP (2015) 
The geometric chain-ladder
\emph{Scandinavian Acturial Journal} 2015, 278-300.
}
\author{Bent Nielsen <bent.nielsen@nuffield.ox.ac.uk> 18 Mar 2015 updated 4 Jan 2016}
\seealso{General description of \code{\link{apc.data.list}} format.}
\examples{
#########################
##	It is convient to construct a data variable

data	<- data.loss.VNJ()

##	To see the content of the data

data

#########################
#	Fit chain-ladder model

fit.ac	<- apc.fit.model(data,"poisson.response","AC")
fit.ac$coefficients.canonical
id.ac	<- apc.identify(fit.ac)
id.ac$coefficients.dif

#########################
#	Compare output with	table 7.2 in
#	Kuang D, Nielsen B, Nielsen JP (2015)
#	               Estimate   Std. Error    z value      Pr(>|z|)
#	level       13.07063963 0.0000000000        Inf  0.000000e+00
#	D_age_2     -0.06543495 0.0006018694 -108.71950  0.000000e+00
#	D_age_3     -0.80332424 0.0008757527 -917.29576  0.000000e+00
#	D_age_4     -0.41906516 0.0012294722 -340.84965  0.000000e+00
#	D_age_5     -0.29097802 0.0015627740 -186.19329  0.000000e+00
#	D_age_6     -0.57299006 0.0021628918 -264.91850  0.000000e+00
#	D_age_7     -0.36101594 0.0030016569 -120.27222  0.000000e+00
#	D_age_8     -0.62706059 0.0046139466 -135.90547  0.000000e+00
#	D_age_9      0.12160793 0.0061126021   19.89463  4.529830e-88
#	D_age_10    -2.59708012 0.0245028290 -105.99103  0.000000e+00
#	D_cohort_2  -0.02591843 0.0009037977  -28.67724 7.334840e-181
#	D_cohort_3   0.18973130 0.0011301184  167.88621  0.000000e+00
#	D_cohort_4   0.12354693 0.0010508785  117.56539  0.000000e+00
#	D_cohort_5  -0.10114701 0.0010566534  -95.72392  0.000000e+00
#	D_cohort_6   0.03594882 0.0010913718   32.93912 6.056847e-238
#	D_cohort_7  -0.17175409 0.0011676536 -147.09336  0.000000e+00
#	D_cohort_8   0.20671145 0.0012098255  170.86055  0.000000e+00
#	D_cohort_9   0.04056617 0.0012325163   32.91329 1.418555e-237
#	D_cohort_10  0.06876759 0.0015336998   44.83771  0.000000e+00

#########################
#	Get deviance table.
#	APC strongly rejected => overdispersion?
#   AC (Chain-ladder) rejected against APC (inference invalid anyway)
#   	=> one should be careful with distribution forecasts

apc.fit.table(data,"poisson.response")

#########################
#	        -2logL df.residual prob(>chi_sq)  LR.vs.APC df.vs.APC prob(>chi_sq)        aic
#	APC   176030.0          28             0         NA        NA            NA   176841.7
#	AP    305784.6          36             0   129754.6         8             0   306580.3
#	AC    374155.2          36             0   198125.2         8             0   374950.9
#	PC    553555.1          36             0   377525.0         8             0   554350.7
#	Ad    486013.4          44             0   309983.4        16             0   486793.0
#	Pd    710009.6          44             0   533979.6        16             0   710789.3
#	Cd    780859.4          44             0   604829.4        16             0   781639.1
#	A     575389.6          45             0   399359.6        17             0   576167.3
#	P    9483688.1          45             0  9307658.0        17             0  9484465.7
#	C    7969034.0          45             0  7793004.0        17             0  7969811.7
#	t     898208.1          52             0   722178.1        24             0   898971.7
#	tA    987389.4          53             0   811359.4        25             0   988151.1
#	tP   9690623.4          53             0  9514593.4        25             0  9691385.1
#	tC   8079187.6          53             0  7903157.6        25             0  8079949.3
#	1   10815443.5          54             0 10639413.5        26             0 10816203.2


#########################
#	Fit geometric chain-ladder model

fit.ac	<- apc.fit.model(data,"log.normal.response","AC")
fit.ac$coefficients.canonical
id.ac	<- apc.identify(fit.ac)
id.ac$coefficients.dif

#########################
#	Compare output with	table 7.2 in
#	Kuang D, Nielsen B, Nielsen JP (2015)
#	                 Estimate Std. Error     t value     Pr(>|t|)
#	level       13.0846325168  0.1322711 98.92285585 0.000000e+00
#	D_age_2     -0.0721758004  0.1291053 -0.55904595 5.761304e-01
#	D_age_3     -0.8180698189  0.1350216 -6.05880856 1.371335e-09
#	D_age_4     -0.3945325384  0.1433094 -2.75301253 5.904964e-03
#	D_age_5     -0.3354312554  0.1538274 -2.18056918 2.921530e-02
#	D_age_6     -0.6322104515  0.1673396 -3.77800844 1.580875e-04
#	D_age_7     -0.3020293471  0.1854134 -1.62895114 1.033234e-01
#	D_age_8     -0.5225495852  0.2112982 -2.47304367 1.339678e-02
#	D_age_9      0.0078494549  0.2531172  0.03101115 9.752607e-01
#	D_age_10    -2.5601846890  0.3415805 -7.49511273 6.624141e-14
#	D_cohort_2  -0.1025686798  0.1291053 -0.79445748 4.269292e-01
#	D_cohort_3   0.0820931043  0.1350216  0.60799994 5.431875e-01
#	D_cohort_4   0.3800465893  0.1433094  2.65193088 8.003292e-03
#	D_cohort_5  -0.0920821506  0.1538274 -0.59860701 5.494350e-01
#	D_cohort_6  -0.0530061052  0.1673396 -0.31675768 7.514275e-01
#	D_cohort_7  -0.2053813051  0.1854134 -1.10769405 2.679940e-01
#	D_cohort_8   0.2705853742  0.2112982  1.28058555 2.003393e-01
#	D_cohort_9  -0.0009224552  0.2531172 -0.00364438 9.970922e-01
#	D_cohort_10  0.0736954734  0.3415805  0.21574845 8.291838e-01

#########################
#	Get deviance table.
#	AC marginally rejected against APC

apc.fit.table(data,"log.normal.response")

#########################
#	     -2logL df.residual LR.vs.APC df.vs.APC prob(>chi_sq)     aic
#	APC -28.528          28        NA        NA            NA  27.472
#	AP   -3.998          36    24.530         8         0.002  36.002
#	AC   -9.686          36    18.842         8         0.016  30.314
#	PC   31.722          36    60.250         8         0.000  71.722
#	Ad    6.251          44    34.779        16         0.004  30.251
#	Pd   41.338          44    69.866        16         0.000  65.338
#	Cd   38.919          44    67.447        16         0.000  62.919
#	A    12.765          45    41.292        17         0.001  34.765
#	P   171.283          45   199.811        17         0.000 193.283
#	C   162.451          45   190.979        17         0.000 184.451
#	t    46.300          52    74.827        24         0.000  54.300
#	tA   49.541          53    78.069        25         0.000  55.541
#	tP  171.770          53   200.298        25         0.000 177.770
#	tC  163.280          53   191.808        25         0.000 169.280
#	1   182.166          54   210.694        26         0.000 186.166

}
