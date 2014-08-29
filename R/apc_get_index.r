#######################################################
#	apc package
#	Bent Nielsen, 27 Aug 2014, version 1
#	function to get indices of data and to generate sub sets of data
#######################################################
#	Copyright 2014 Bent Nielsen
#	Nuffield College, OX1 1NF, UK
#	bent.nielsen@nuffield.ox.ac.uk
#
#	This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#######################################################

apc.get.index	<- function(apc.data.list)
#	BN 18 nov 2013
#	function to get indices to keep track of estimation and labelling
#	in:		apc.data.list
#	out:	list 
{	#	apc.get.index
	#########################
	#	get values
	response	<- apc.data.list$response
	dose		<- apc.data.list$dose
	data.format	<- apc.data.list$data.format	
	age1		<- apc.data.list$age1		
	per1		<- apc.data.list$per1		
	coh1		<- apc.data.list$coh1		
	unit		<- apc.data.list$unit		
	per.zero	<- apc.data.list$per.zero	
	per.max		<- apc.data.list$per.max
	time.adjust	<- apc.data.list$time.adjust
	#########################
	#	data.format SPECIFIC CODE
	#########################
	if(data.format=="AC")
	#	matrix with age/cohort as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		n.data		<- nrow*ncol
		age.max		<- nrow
		coh.max		<- ncol
		per.max		<- age.max+coh.max-1
		per.zero	<- 0
		age1		<- age1
		coh1		<- coh1
		per1		<- age1+coh1-time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(row in 1:nrow)
		{
			index.data[(col+1):(col+ncol),1]	<- row		  							#	age
			index.data[(col+1):(col+ncol),2]	<- seq(1,ncol)							#	cohort
			col	<- col + ncol
		}
		index.trap	<- index.data
		data.xlab	<- "age"
		data.ylab	<- "cohort"
		data.x1	<- age1
		data.y1	<- coh1
	}
	#########################
	if(data.format=="AP")
	#	matrix with age/period as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		n.data		<- nrow*ncol
		age.max		<- nrow
		per.max		<- ncol
		coh.max		<- age.max+per.max-1
		per.zero	<- age.max-1
		age1		<- age1
		per1		<- per1
		coh1		<- per1 - ((age.max-1)*unit+age1)+time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(row in 1:nrow)
		{
			index.data[(col+1):(col+ncol),1]	<- row		  							#	age
			index.data[(col+1):(col+ncol),2]	<- seq(1,ncol)							#	period
			index.trap[(col+1):(col+ncol),1]	<- row									#	age
			index.trap[(col+1):(col+ncol),2]	<- seq((nrow-row+1),(nrow-row+ncol))	#	cohort
			col	<- col + ncol
		}
		data.xlab	<- "age"
		data.ylab	<- "period"
		data.x1	<- age1
		data.y1	<- per1
	}
	#########################
	if(data.format=="CA")
	#	matrix with cohort/age as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		n.data		<- nrow*ncol
		age.max		<- ncol
		coh.max		<- nrow
		per.max		<- age.max+coh.max-1
		per.zero	<- 0
		age1		<- age1
		coh1		<- coh1
		per1		<- age1+coh1-time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(row in 1:nrow)
		{
			index.data[(col+1):(col+ncol),1]	<- row		  							#	age
			index.data[(col+1):(col+ncol),2]	<- seq(1,ncol)							#	cohort
			index.trap[(col+1):(col+ncol),1]	<- seq(1,ncol)							#	cohort 
			index.trap[(col+1):(col+ncol),2]	<- row		  							#	age    
			col	<- col + ncol
		}
		data.xlab	<- "cohort"
		data.ylab	<- "age"
		data.x1	<- coh1
		data.y1	<- age1
	}
	#########################
	if(data.format=="CL")
	#	square matrix with cohort/age as increasing row/column index
	#	NA: in botton right triangle so period >= age.max+period.max
	{	k	<- min(nrow(response),ncol(response))
		##############################
		#	check obligatory input
		if(ncol(response) != nrow(response))	return(cat("apc.error: Response matrix is not square \n"))
		for(age in 2:k)
			for(coh in (k+1-age):k)
				if(is.na(response[coh,age])==FALSE) return(cat("apc.error: Lower triangle of response matrix should be NA \n"))
		##############################
		nrow		<- k
		ncol		<- k
		n.data		<- k*(k+1)/2
		age.max		<- k
		coh.max		<- k
		per.max		<- k
		per.zero	<- 0
		age1		<- age1
		coh1		<- coh1
		per1		<- age1+coh1-time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(row in 1:nrow)
		{
			index.data[(col+1):(col+k+1-row),1]	<- row		  							#	cohort
			index.data[(col+1):(col+k+1-row),2]	<- seq(1,k+1-row)						#	age   
			index.trap[(col+1):(col+k+1-row),1]	<- seq(1,k+1-row)						#	age    
			index.trap[(col+1):(col+k+1-row),2]	<- row		  							#	cohort 
			col	<- col +k+1-row
		}
		data.xlab	<- "policy time (cohort)"
		data.ylab	<- "development time (age)"
		data.x1	<- coh1
		data.y1	<- age1
	}
	#########################
	if(data.format=="CL.vector.by.row")
	#	square matrix with cohort/age as increasing row/column index
	#	NA: in botton right triangle so period >= age.max+period.max
	{	##############################
		#	check obligatory input
		if(is.vector(data.matrix)==FALSE)	return(cat("apc.error: Response is not a vector \n"))
		##############################
		k			<- as.integer((sqrt(1+8*length(data.matrix))-1)/2)
		n.data		<- k*(k+1)/2
		nrow		<- 1
		ncol		<- n.data
		age.max		<- k
		coh.max		<- k
		per.max		<- k
		per.zero	<- 0
		age1		<- age1
		coh1		<- coh1
		per1		<- age1+coh1-time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.data[,1]	<- 1
		index.data[,2]	<- seq(1,n.data)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(row in 1:nrow)
		{
			index.trap[(col+1):(col+k+1-row),1]	<- seq(1,k+1-row)						#	age    
			index.trap[(col+1):(col+k+1-row),2]	<- row		  							#	cohort 
			col	<- col +k+1-row
		}
		data.xlab	<- ""
		data.ylab	<- "vec(policy/development triangle)"
		data.x1	<- NA
		data.y1	<- NA
	}
	#########################
	if(data.format=="CP")
	#	matrix with cohort/period as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		n.data		<- nrow*ncol
		coh.max		<- nrow
		per.max		<- ncol
		age.max		<- coh.max+per.max-1
		per.zero	<- coh.max-1
		per1		<- per1
		coh1		<- coh1
		age1		<- per1 - ((coh.max-1)*unit+coh1)+time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(row in 1:nrow)
		{
			index.data[(col+1):(col+ncol),1]	<- row		  							#	cohort
			index.data[(col+1):(col+ncol),2]	<- seq(1,ncol)							#	period
			index.trap[(col+1):(col+ncol),1]	<- seq((nrow-row+1),(nrow-row+ncol))	#	age
			index.trap[(col+1):(col+ncol),2]	<- row									#	cohort
			col	<- col + ncol
		}
		data.xlab	<- "cohort"
		data.ylab	<- "period"
		data.x1	<- coh1
		data.y1	<- per1
	}
	#########################
	if(data.format=="PA")
	#	matrix with period/age as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		n.data		<- nrow*ncol
		age.max		<- ncol
		per.max		<- nrow
		coh.max		<- age.max+per.max-1
		per.zero	<- age.max-1
		age1		<- age1
		per1		<- per1
		coh1		<- per1 - ((age.max-1)*unit+age1)+time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		row	<- 0
		for(col in 1:ncol)
		{
			index.data[(row+1):(row+nrow),1]	<- seq(1,nrow)		  					#	period         
			index.data[(row+1):(row+nrow),2]	<- col									#	age            
			index.trap[(row+1):(row+nrow),1]	<- col									#	age
			index.trap[(row+1):(row+nrow),2]	<- seq((ncol-col+1),(ncol-col+nrow))	#	cohort
			row	<- row + nrow
		}
		data.xlab	<- "period"
		data.ylab	<- "age"
		data.x1	<- per1
		data.y1	<- age1
	}
	#########################
	if(data.format=="PC")
	#	matrix with period/cohort as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		n.data		<- nrow*ncol
		coh.max		<- ncol
		per.max		<- nrow
		age.max		<- coh.max+per.max-1
		per.zero	<- coh.max-1
		per1		<- per1
		coh1		<- coh1
		age1		<- per1 - ((coh.max-1)*unit+coh1)+time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		index.trap	<- matrix(nrow=n.data,ncol=2)
		row	<- 0
		for(col in 1:ncol)
		{
			index.data[(row+1):(row+nrow),1]	<- seq(1,nrow)							#	period
			index.data[(row+1):(row+nrow),2]	<- col									#	cohort
			index.trap[(row+1):(row+nrow),1]	<- seq((ncol-col+1),(ncol-col+nrow))	#	age
			index.trap[(row+1):(row+nrow),2]	<- col									#	cohort
			row	<- row + nrow
		}
		data.xlab	<- "period"
		data.ylab	<- "cohort"
		data.x1	<- per1
		data.y1	<- coh1
	}
	#########################
	if(data.format=="trapezoid")
	#	trapezoid matrix with age/cohort as increasing row/column index
	#	NA: none
	{	nrow		<- nrow(response)
		ncol		<- ncol(response)
		age.max		<- nrow
		per.max		<- per.max
		coh.max		<- ncol
		per.zero	<- per.zero
		dim.lower	<- coh.max + age.max - 1 -per.zero - per.max		#	dimension of lower right triangle
		n.data		<- nrow*ncol - per.zero*(per.zero+1)/2 - dim.lower*(dim.lower+1)/2
		age1		<- age1
		coh1		<- coh1
		per1		<- age1+coh1-1+per.zero*unit-time.adjust
		index.data	<- matrix(nrow=n.data,ncol=2)
		col	<- 0
		for(age in 1:age.max)
		{
			col.zero	<- max(per.zero-age+1,0)
			col.max		<- min(coh.max,per.zero+per.max+1-age)
			index.data[ (col+1):(col+col.max-col.zero),1]	<- age					    #	age
			index.data[ (col+1):(col+col.max-col.zero),2]	<- seq(col.zero+1,col.max)	#	cohort
			col	<- col + col.max-col.zero
		}
		index.trap	<- index.data
		data.xlab	<- "age"
		data.ylab	<- "cohort"
		data.x1	<- age1
		data.y1	<- coh1
	}

	#########################
	#	GENERAL CODE
	#########################
	return(list(response	=response	,	 #	argument
				dose		=dose		,	 #	argument
				data.format	=data.format,	 #	argument
				unit		=unit		,	 #	argument
				data.xmax	=nrow		,
				data.ymax	=ncol		,
				data.xlab	=data.xlab	,
				data.ylab	=data.ylab 	,
				data.x1		=data.x1	,
				data.y1		=data.y1	,
				n.data		=n.data		,
				index.data	=index.data	,
				index.trap	=index.trap	,
				age.max		=age.max	,
				per.max		=per.max	,
				coh.max		=coh.max	,
				per.zero	=per.zero	,
				age1		=age1		,
				per1		=per1		,
				coh1		=coh1	 	))
}	#	apc.get.index

####################################################
apc.data.list.subset <- function(apc.data.list,age.cut.lower=0,age.cut.upper=0,
											   per.cut.lower=0,per.cut.upper=0,
											   coh.cut.lower=0,coh.cut.upper=0,apc.index=NULL)										   
#	BN 9 dec 2013
#	function to get subset of data set
#	in:		apc.data.list
#	out:	list 
{	#	apc.data.list.subset
	##############################
	#	input
	cut.old	<- c(age.cut.lower,age.cut.upper,per.cut.lower,per.cut.upper,coh.cut.lower,coh.cut.upper)
	######################
	#	get index
	if(is.null(apc.index)==TRUE)
		apc.index	<- apc.get.index(apc.data.list)
	##############################
	#	get index values, that are used
	age.max		<- apc.index$age.max				
	per.max		<- apc.index$per.max				
	coh.max		<- apc.index$coh.max
	age1		<- apc.index$age1    
	per1		<- apc.index$per1    
	coh1		<- apc.index$coh1    
	unit		<- apc.index$unit
	per.zero	<- apc.index$per.zero
	index.data	<- apc.index$index.data
	index.trap	<- apc.index$index.trap
	##############################
	#	check function
	function.check	<- function()
	{
		check	<-1 
		check	<- check*isTRUE(age.max>age.cut.lower+age.cut.upper+2)
		check	<- check*isTRUE(per.max>per.cut.lower+per.cut.upper+2)
		check	<- check*isTRUE(coh.max>coh.cut.lower+coh.cut.upper+2)	
		check	<- check*isTRUE(age.cut.lower>per.zero+per.cut.lower-coh.max+coh.cut.upper)
		check	<- check*isTRUE(coh.cut.lower>per.zero+per.cut.lower-age.max+age.cut.upper)
		check	<- check*isTRUE(age.cut.upper>=age.max-per.zero-per.max+per.cut.upper+coh.cut.lower)
		check	<- check*isTRUE(coh.cut.upper>=coh.max-per.zero-per.max+per.cut.upper+age.cut.lower)
		return(check)
	}
	check	<- function.check()	
	while(check<1)	
		repeat
		{
			if(age.max<=age.cut.lower+age.cut.upper+2)	{ check <- 11; break }
			if(per.max<=per.cut.lower+per.cut.upper+2)	{ check <- 12; break }
			if(coh.max<=coh.cut.lower+coh.cut.upper+2)	{ check <- 13; break }
			if(age.cut.lower<=per.zero+per.cut.lower-coh.max+coh.cut.upper)
				{ age.cut.lower <- age.cut.lower+1; check	<- function.check(); break}
			if(coh.cut.lower<=per.zero+per.cut.lower-age.max+age.cut.upper)
				{ coh.cut.lower <- coh.cut.lower+1; check	<- function.check(); break}
			if(age.cut.upper< age.max-per.zero-per.max+per.cut.upper+coh.cut.lower)
				{ age.cut.upper <- age.cut.upper+1; check	<- function.check(); break}
			if(coh.cut.upper< coh.max-per.zero-per.max+per.cut.upper+age.cut.lower)
				{ coh.cut.upper <- coh.cut.upper+1; check	<- function.check(); break}
		}
	cut.new	<- c(age.cut.lower,age.cut.upper,per.cut.lower,per.cut.upper,coh.cut.lower,coh.cut.upper)
	if(check > 1)
	{	print("apc.data.list.subset ERROR:")
		print("cuts in argument are:") 
		print(cut.old)                 
		print("have been modified to:")
		print(cut.new)                 	
		if(check==11) return(cat("age.max<=age.cut.lower+age.cut.upper+2 \n"))
		if(check==12) return(cat("per.max<=per.cut.lower+per.cut.upper+2 \n"))
		if(check==13) return(cat("coh.max<=coh.cut.lower+coh.cut.upper+2 \n"))		
	}
	if(sum(cut.old) != sum(cut.new))
	{	print("apc.data.list.subset WARNING:")
		print("cuts in argument are:")
		print(cut.old)
		print("have been modified to:")
		print(cut.new)
		
	}

	##############################
	#	get data.list values, that are used
	response	<- apc.data.list$response
	dose		<- apc.data.list$dose
	##############################
	#	get new indices
	per.zero.new	<- per.zero+per.cut.lower-age.cut.lower-coh.cut.lower
	age.max.new		<- age.max-age.cut.upper-age.cut.lower
	coh.max.new		<- coh.max-coh.cut.upper-coh.cut.lower
	per.max.new		<- per.max-per.cut.upper-per.cut.lower
	age1.new		<- age1	+ age.cut.lower*unit
	coh1.new		<- coh1	+ coh.cut.lower*unit
	per1.new		<- per1 + (per.zero.new+age.cut.lower+coh.cut.lower-per.zero)*unit
	##############################
	#	get trapezoid
	trap.response		<- matrix(data=NA,nrow=age.max,ncol=coh.max)
	trap.response.new	<- matrix(data=NA,nrow=age.max.new,ncol=coh.max.new)
	trap.response[index.trap]	<- response[index.data]
	for(age.new in 1:age.max.new)
		for(coh.new in 1:coh.max.new)
			if(age.new+coh.new>per.zero.new+1 && age.new+coh.new<per.zero.new+per.max.new+2)
				trap.response.new[age.new,coh.new]	<- trap.response[age.new+age.cut.lower,coh.new+coh.cut.lower]
	if(is.null(dose))	trap.dose.new <- NULL
	else
	{	trap.dose			<- matrix(data=NA,nrow=age.max,ncol=coh.max)
		trap.dose.new		<- matrix(data=NA,nrow=age.max.new,ncol=coh.max.new)
		trap.dose[index.trap]		<- dose[index.data]
		for(age.new in 1:age.max.new)
			for(coh.new in 1:coh.max.new)
				if(age.new+coh.new>per.zero.new+1 && age.new+coh.new<per.zero.new+per.max.new+2)
					trap.dose.new[age.new,coh.new]	<- trap.dose[age.new+age.cut.lower,coh.new+coh.cut.lower]
	}				
	return(list(response	=trap.response.new	,
				dose		=trap.dose.new		,
				data.format	="trapezoid"		,	
				age1		=age1.new			,
				per1		=per1.new			,
				coh1		=coh1.new			,
				unit		=unit				,
				per.zero	=per.zero.new		,
				per.max		=per.max.new		,
				time.adjust	=0					))		
}	#	apc.data.list.subset


#####################################################
#apc.data.list.subset <- function(apc.data.list,age.cut.lower=0,age.cut.upper=0,
#											   per.cut.lower=0,per.cut.upper=0,
#											   coh.cut.lower=0,coh.cut.upper=0,apc.index=NULL)
##	BN 4 dec 2013
##	function to get subset of data set
##	in:		apc.data.list
##	out:	list 
#{	#	apc.data.list.subset
#	######################
#	#	get index
#	if(is.null(apc.index)==TRUE)
#		apc.index	<- apc.get.index(apc.data.list)
#	##############################
#	#	get data.list values, that are used
#	response	<- apc.data.list$response
#	dose		<- apc.data.list$dose
#	##############################
#	#	get index values, that are used
#	age.max		<- apc.index$age.max				
#	per.max		<- apc.index$per.max				
#	coh.max		<- apc.index$coh.max
#	age1		<- apc.index$age1    
#	per1		<- apc.index$per1    
#	coh1		<- apc.index$coh1    
#	unit		<- apc.index$unit
#	per.zero	<- apc.index$per.zero
#	index.data	<- apc.index$index.data
#	index.trap	<- apc.index$index.trap
#	##############################
#	#	get new indices
#	age.cut.lower	<- max(age.cut.lower,per.zero+per.cut.lower+1-coh.max+coh.cut.upper)
#	coh.cut.lower	<- max(coh.cut.lower,per.zero+per.cut.lower+1-age.max+age.cut.upper)
#	per.zero.new	<- max(per.zero+per.cut.lower-age.cut.lower-coh.cut.lower,0)
#	age.cut.upper	<- max(age.cut.upper,coh.cut.lower+age.max-per.zero-per.max)
#	coh.cut.upper	<- max(coh.cut.upper,age.cut.lower+coh.max-per.zero-per.max)
#	age.max.new		<- age.max-age.cut.upper-age.cut.lower
#	coh.max.new		<- coh.max-coh.cut.upper-coh.cut.lower
#	per.max.new		<- min(per.max+per.zero-per.cut.upper-age.cut.lower-coh.cut.lower,age.max.new+coh.max.new-1)-per.zero.new
#	age1.new		<- age1	+ age.cut.lower*unit
#	coh1.new		<- coh1	+ coh.cut.lower*unit
#	per1.new		<- per1 + (per.zero.new+age.cut.lower+coh.cut.lower-per.zero)*unit
#	##############################
#	#	get trapezoid
#	trap.response		<- matrix(data=NA,nrow=age.max,ncol=coh.max)
#	trap.response.new	<- matrix(data=NA,nrow=age.max.new,ncol=coh.max.new)
#	trap.response[index.trap]	<- response[index.data]
#	for(age.new in 1:age.max.new)
#		for(coh.new in 1:coh.max.new)
#			if(age.new+coh.new>per.zero.new+1 && age.new+coh.new<per.zero.new+per.max.new+2)
#				trap.response.new[age.new,coh.new]	<- trap.response[age.new+age.cut.lower,coh.new+coh.cut.lower]
#	if(is.null(dose))	trap.dose.new <- NULL
#	else
#	{	trap.dose			<- matrix(data=NA,nrow=age.max,ncol=coh.max)
#		trap.dose.new		<- matrix(data=NA,nrow=age.max.new,ncol=coh.max.new)
#		trap.dose[index.trap]		<- dose[index.data]
#		for(age.new in 1:age.max.new)
#			for(coh.new in 1:coh.max.new)
#				if(age.new+coh.new>per.zero.new+1 && age.new+coh.new<per.zero.new+per.max.new+2)
#					trap.dose.new[age.new,coh.new]	<- trap.dose[age.new+age.cut.lower,coh.new+coh.cut.lower]
#	}				
#	return(list(response	=trap.response.new	,
#				dose		=trap.dose.new		,
#				data.format	="trapezoid"		,	
#				age1		=age1.new			,
#				per1		=per1.new			,
#				coh1		=coh1.new			,
#				unit		=unit				,
#				per.zero	=per.zero.new		,
#				per.max		=per.max.new		,
#				time.adjust	=0					))		
#}	#	apc.data.list.subset
#
#