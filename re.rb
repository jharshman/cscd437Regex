#!/usr/bin/ruby
###############################
#################################
#				##
#	Secure Coding		###
#	Regex Assignment	####
#	~ Josh Harshman		#####
#				######
#####################################
####################################
require "rubygems"
require "highline/import"

@R_SSN = /^(?!666|000)\d{3}[-\s]?(?!00)\d{2}[-\s]?(?!0000)\d{4}$/
@R_PHN = /^\(?(?!000)\d{3}\)?[-\s]?(?!000)\d{3}[-\s]?\d{4}$/
@R_EML = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+[\.a-zA-Z0-9]*\.\w{2,}$/
@R_NME = /^(?![0-9])\w{2,}[,\s]+(?![0-9])\w{2,}[,\s]+(?![0-9])\w{1,}$/
@R_DTE = /^(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])-(19|20)\d\d$/
@R_HAD = /^\d{1,6}\s\w{1,6}\s[a-zA-Z]{1,20}\s[a-zA-Z]{2,15}$/
@R_CSZ = /^\w{2,15},\s\w{2},\s\d{5}(-\d{5})?$/
@R_MIL = /^([01]\d|2[0-3]):?([0-5]\d):?([0-5]\d)$/ 
@R_CUR = /^\$[0-9]{1,3}(,?[0-9]{3})*(\.[0-9]{2})?$/
@R_URL = /^((http|https|ftp|ftps):\/\/)?(www\.)?[a-zA-Z0-9]+[\.a-zA-Z0-9]*\.\w{2,}$/ 
@R_PWD = /^(?=.*\d)(?=.*[_\W])(?!.*[a-z]{3}).+$/
@R_ODD = /^([a-zA-Z]{2})*ion$/

########
# regular_expression(toscrub,flag)
# @PARAM input to scrub
# @PARAM regex flag identifier
# @RETURN returns boolean 
#
def regular_expression(text,flag)
	
	_match = false 

	case flag
	when "R_SSN"
		_match = true unless !( text =~ @R_SSN )
	when "R_PHN"
		_match = true unless !( text =~ @R_PHN )
	when "R_EML"
		_match = true unless !( text =~ @R_EML )
	when "R_NME"
		_match = true unless !( text =~ @R_NME )
	when "R_DTE"
		_match = true unless !( text =~ @R_DTE )
	when "R_HAD"
		_match = true unless !( text =~ @R_HAD )
	when "R_CSZ"
		_match = true unless !( text =~ @R_CSZ )
	when "R_MIL"
		_match = true unless !( text =~ @R_MIL )
	when "R_CUR"
		_match = true unless !( text =~ @R_CUR )
	when "R_URL"
		_match = true unless !( text =~ @R_URL )
	when "R_PWD"
		_match = true unless !( text =~ @R_PWD )
	when "R_ODD"
		_match = true unless !( text =~ @R_ODD )
	end

	return _match 

end

######
# userinput
# @RETURN returns user input
#
def userinput() 
	print("Enter: ")
	STDOUT.flush
	return gets.chomp
end

#########
# Main Program Execution
#
begin
	puts
	loop do
		choose do |menu|
		puts "Please select from the following..."
		menu.index=:letter
		menu.choice(:"Social Security Number") { regular_expression(text=userinput(),"R_SSN")?puts("Matched for "+text):puts("No Matches for "+text) }
		menu.choice(:"US Phone Number") { regular_expression(text=userinput(),"R_PHN")?puts("Matched for "+text):puts("No Matches for "+text) }
		menu.choice(:"E-mail address") { regular_expression(text=userinput(),"R_EML")?puts("Matched for "+text):puts("No Matches for "+text) }
		menu.choice(:"Name on class roster") { regular_expression(text=userinput(),"R_NME")?puts("Matched for "+text):puts("No Matches for "+text) }
		menu.choice(:"Date in MM-DD-YYYY format") { regular_expression(text=userinput(),"R_DTE")?puts("Matched for "+text):puts("No Matches for "+text) }
		menu.choice(:"House address") { regular_expression(text=userinput(),"R_HAD")?puts("Matched for "+text):puts("No Matches for "+text) }
		menu.choice(:"City, State, and Zip Code") { regular_expression(text=userinput(),"R_CSZ")?puts("Matched for "+text):puts("No Matches for "+text) } 
		menu.choice(:"Military time including seconds") { regular_expression(text=userinput(),"R_MIL")?puts("Matched for "+text):puts("No Matches for "+text) } 
		menu.choice(:"US currency down to the penny") { regular_expression(text=userinput(),"R_CUR")?puts("Matched for "+text):puts("No Matches for "+text) } 
		menu.choice(:"URL including http:// or https://") { regular_expression(text=userinput(),"R_URL")?puts("Matched for "+text):puts("No Matches for "+text) } 
		menu.choice(:"A password") { regular_expression(text=userinput(),"R_PWD")?puts("Matches for "+text):puts("No Matches for "+text) }
		menu.choice(:"All words containing an odd number of characters ending in ion") { regular_expression(text=userinput(),"R_ODD")?puts("Matched for "+text):puts("No Matches for "+text) } 
		menu.choice(:q) { say(" ^.^ bye")
				exit 0}
		end
	end
end
