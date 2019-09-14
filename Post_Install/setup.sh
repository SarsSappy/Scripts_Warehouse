#!/bin/bash
#Script to quickly set-up Termux with all of packages etc after re-installation.
#Written by Sars!
#0.1 Initial release.

#########################################################
################ Vars, Helpers, Imports #################
#########################################################
source .setup/.config
source .setup/packages

#Helper Functions.
spk() {
	echo -e "\n$1"
}

bl() {
	tput bold
}

ul() {
	tput smul
}

rul() {
	tput rmul
}

rst() {
	tput sgr0
}

clr() {
	tput clear
}
#Ends.

#Functions helpful in Debugging.
err_die() {
	echo "Exiting via code $1" >> .setup/.log
	exit "$1"
}

success() {
	echo -e "\n $1 Succeeded!" >> .setup/.log
}

fail() {
	echo -e "\n$1 Failed" >> .setup/.log
}
#Ends

help() {
	clr
	bl
	echo "$(ul)SYNTAX $(rul)"
	echo "       setup {TYPE}... {FLAG}"

			spk "$(ul)TYPES $(rul)"
			rst
			echo "If no TYPE is defined script will first look for user defined packages list or else it will continue with DEFAULT."
			spk "       -D, --default     Installs the packages which comes predefined                          in packages list."
			spk "       -M, --minimal     Installs the basic packages needed to make                            Termux feel more Linux like."
			spk "$(bl) E.g, setup -D or setup -M $(rst)"

	spk "$(bl)$(ul)FLAGS $(rul)$(rst)"
			echo "Flags are optional, as of now only SILENT flag is available."
			spk "       -s, --silent      Makes the script run Silently."
	spk "That's all the help available.. for now"
} 
help