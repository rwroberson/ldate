#!/bin/bash

# This script prints the name of next Sunday on the church calendar. The script 
# is designed for my own church's Reformed focus on the five evangelical feast 
# days, but it may be edited for other traditions.

cal="2019" # options: custom, 2019
data="data.yaml"

# Define key days
EAS=$(date -d $(ncal -e) +%j)
EAS=${EAS#0}

epiphany=$(date -d "Jan 6" +%a)
case $epiphany in
	Mon) EPI=$(date -d "Jan 6 + 6 days" +%j) ;;
	Tue) EPI=$(date -d "Jan 6 + 5 days" +%j) ;;
	Wed) EPI=$(date -d "Jan 6 + 4 days" +%j) ;;
	Thu) EPI=$(date -d "Jan 6 + 3 days" +%j) ;;
	Fri) EPI=$(date -d "Jan 6 + 2 days" +%j) ;;
	Sat) EPI=$(date -d "Jan 6 + 1 days" +%j) ;;
	Sun) EPI=$(date -d "Jan 6" +%j) ;;
esac
EPI=${EPI#00}

christmas=$(date -d "Dec 25" +%a)
case $christmas in
	Mon) CHR=$(date -d "Dec 25 + 6 days" +%j) ;;
	Tue) CHR=$(date -d "Jan 6 + 5 days" +%j) ;;
	Wed) CHR=$(date -d "Jan 6 + 4 days" +%j) ;;
	Thu) CHR=$(date -d "Jan 6 + 3 days" +%j) ;;
	Fri) CHR=$(date -d "Jan 6 + 2 days" +%j) ;;
	Sat) CHR=$(date -d "Jan 6 + 1 days" +%j) ;;
	Sun) CHR=$(date -d "Jan 6" +%j) ;;
esac

ASH=$(( $EAS - 47 ))
TRI=$(( $EAS + 56 ))

# Find next Sunday's Date
DOW=$(date +%a)
case $DOW in
	Sun) SUN=$(date -d "7 days" +%j) ;;
	Mon) SUN=$(date -d "6 days" +%j) ;;
	Tue) SUN=$(date -d "5 days" +%j) ;;
	Wed) SUN=$(date -d "4 days" +%j) ;;
	Thu) SUN=$(date -d "3 days" +%j) ;;
	Fri) SUN=$(date -d "2 days" +%j) ;;
	Sat) SUN=$(date -d "1 days" +%j) ;;
esac

SUN=${SUN#00}
#SUN="300"

# Special days

# TODO: build a test for null cases
case $SUN in
	29[7-9] | 30[0-4]) yq -r ".reformation.\"$cal\"" $data && exit ;;
	30[5-9] | 31[0-2]) yq -r ".saints.\"$cal\"" $data && exit ;;
esac
	

if [[ $SUN -lt $EAS ]]; then

	if [[ $SUN -lt $EPI ]]; then
		yq -r ".christmas2.\"$cal\"" $data
		exit

	elif [[ $SUN -ge $EPI ]]; then
		if [[ $SUN -lt $ASH ]]; then

			# dates after Epiphany
			WEEK=$(( $SUN - $EPI ))
			case $WEEK in
				0)  yq -r ".epiphany1.\"$cal\"" $data ;;
				7)  yq -r ".epiphany2.\"$cal\"" $data ;;
				14) yq -r ".epiphany3.\"$cal\"" $data ;;
				21) yq -r ".epiphany4.\"$cal\"" $data ;;
				28) yq -r ".epiphany5.\"$cal\"" $data ;;
				35) yq -r ".epiphany6.\"$cal\"" $data ;;
				42) yq -r ".epiphany7.\"$cal\"" $data ;;
				49) yq -r ".epiphany8.\"$cal\"" $data ;;
				56) yq -r ".epiphany9.\"$cal\"" $data ;;
				63) yq -r ".epiphany10.\"$cal\"" $data ;;
			esac
			exit

		elif [[ $SUN -gt $ASH ]]; then

			# dates in Lent
			WEEK=$(( $SUN - $ASH ))
			case $WEEK in
				5)  yq -r ".lent1.\"$cal\"" $data ;;
				12) yq -r ".lent2.\"$cal\"" $data ;;
				19) yq -r ".lent3.\"$cal\"" $data ;;
				26) yq -r ".lent4.\"$cal\"" $data ;;
				33) yq -r ".lent5.\"$cal\"" $data ;;
				40) yq -r ".lent6.\"$cal\"" $data ;;
			esac
			exit
		fi
	fi

elif [[ $SUN -eq $EAS ]]; then
	yq -r ".easter1.\"$cal\"" $data
	exit

elif [[ $SUN -gt $EAS ]]; then

	# dates after Easter
	if [[ $SUN -lt $TRI ]]; then
		WEEK=$(( $SUN - $EAS ))
		case $WEEK in
			7)  yq -r ".easter2.\"$cal\"" $data ;;
			14) yq -r ".easter3.\"$cal\"" $data ;;
			21) yq -r ".easter4.\"$cal\"" $data ;;
			28) yq -r ".easter5.\"$cal\"" $data ;;
			35) yq -r ".easter6.\"$cal\"" $data ;;
			42) yq -r ".ascension.\"$cal\"" $data ;;
			49) yq -r ".pentecost.\"$cal\"" $data ;;
		esac
		exit
	
	# dates after Trinity
	else
		if [[ $SUN -gt 324 ]]; then
			WEEK=$(( $CHR - $SUN ))
			case $WEEK in
				35) yq -r ".king.\"$cal\"" $data ;;
				28) yq -r ".advent1.\"$cal\"" $data ;;
				21) yq -r ".advent2.\"$cal\"" $data ;;
				14) yq -r ".advent3.\"$cal\"" $data ;;
				7)  yq -r ".advent4.\"$cal\"" $data ;;
				0)  yq -r ".christmas1.\"$cal\"" $data ;;
			esac
			exit
		else
			WEEK=$(( $SUN - $TRI ))
			case $WEEK in
				0)   yq -r ".trinity1.\"$cal\"" $data ;;
				7)   yq -r ".trinity2.\"$cal\"" $data ;;
				14)  yq -r ".trinity3.\"$cal\"" $data ;;
				21)  yq -r ".trinity4.\"$cal\"" $data ;;
				28)  yq -r ".trinity5.\"$cal\"" $data ;;
				35)  yq -r ".trinity6.\"$cal\"" $data ;;
				42)  yq -r ".trinity7.\"$cal\"" $data ;;
				49)  yq -r ".trinity8.\"$cal\"" $data ;;
				56)  yq -r ".trinity9.\"$cal\"" $data ;;
				63)  yq -r ".trinity10.\"$cal\"" $data ;;
				70)  yq -r ".trinity11.\"$cal\"" $data ;;
				77)  yq -r ".trinity12.\"$cal\"" $data ;;
				84)  yq -r ".trinity13.\"$cal\"" $data ;;
				91)  yq -r ".trinity14.\"$cal\"" $data ;;
				98)  yq -r ".trinity15.\"$cal\"" $data ;;
				105) yq -r ".trinity16.\"$cal\"" $data ;;
				112) yq -r ".trinity17.\"$cal\"" $data ;;
				119) yq -r ".trinity18.\"$cal\"" $data ;;
				126) yq -r ".trinity19.\"$cal\"" $data ;;
				133) yq -r ".trinity20.\"$cal\"" $data ;;
				140) yq -r ".trinity21.\"$cal\"" $data ;;
				147) yq -r ".trinity22.\"$cal\"" $data ;;
				154) yq -r ".trinity23.\"$cal\"" $data ;;
				161) yq -r ".trinity24.\"$cal\"" $data ;;
				168) yq -r ".trinity25.\"$cal\"" $data ;;
				175) yq -r ".trinity26.\"$cal\"" $data ;;
				182) yq -r ".trinity27.\"$cal\"" $data ;;
				189) yq -r ".trinity28.\"$cal\"" $data ;;
				196) yq -r ".trinity29.\"$cal\"" $data ;;
			esac
			exit
		fi
	fi

else
	echo "An error occurred."
	exit
fi
