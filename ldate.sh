#!/bin/bash

# This script prints the name of next Sunday on the church calendar. The script 
# is designed for my own church's Reformed focus on the five evangelical feast 
# days, but it may be edited for other traditions.
#
#
# TODO: Finish the dates around Christmas

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

case $SUN in
	29[7-9] | 30[0-4]) echo "Reformation Sunday" && exit ;;
	30[5-9] | 31[0-2]) echo "All Saints' Sunday" && exit ;;
esac
	

if [[ $SUN -lt $EAS ]]; then

	if [[ $SUN -lt $EPI ]]; then
		echo "Second Lord's Day in Christmastide"
		exit

	elif [[ $SUN -eq $EPI ]]; then
		echo "Ephiphany Sunday"
		exit

	elif [[ $SUN -gt $EPI ]]; then
		if [[ $SUN -lt $ASH ]]; then

			# dates after Epiphany
			WEEK=$(( $SUN - $EPI ))
			case $WEEK in
				7)  echo "Second Lord's Day After Epiphany" ;;
				14) echo "Third Lord's Day After Epiphany" ;;
				21) echo "Fourth Lord's Day After Epiphany" ;;
				28) echo "Fifth Lord's Day After Epiphany" ;;
				35) echo "Sixth Lord's Day After Epiphany" ;;
				42) echo "Seventh Lord's Day After Epiphany" ;;
				49) echo "Eighth Lord's Day After Epiphany" ;;
				56) echo "Ninth Lord's Day After Epiphany" ;;
				63) echo "Tenth Lord's Day After Epiphany" ;;
				70) echo "Eleventh Lord's Day After Epiphany" ;;
				77) echo "Twelfth Lord's Day After Epiphany" ;;
			esac
			exit

		elif [[ $SUN -gt $ASH ]]; then

			# dates in Lent
			WEEK=$(( $SUN - $ASH ))
			case $WEEK in
				5)  echo "First Lord's Day in Lent" ;;
				12) echo "Second Lord's Day in Lent" ;;
				19) echo "Third Lord's Day in Lent" ;;
				26) echo "Fourth Lord's Day in Lent" ;;
				33) echo "Fifth Lord's Day in Lent" ;;
				40) echo "Palm Sunday" ;;
			esac
			exit
		fi
	fi

elif [[ $SUN -eq $EAS ]]; then
	echo "Easter Sunday"
	exit

elif [[ $SUN -gt $EAS ]]; then

	# dates after Easter
	if [[ $SUN -lt $TRI ]]; then
		WEEK=$(( $SUN - $EAS ))
		case $WEEK in
			7)  echo "First Lord's Day After Easter" ;;
			14) echo "Second Lord's Day After Easter" ;;
			21) echo "Third Lord's Day After Easter" ;;
			28) echo "Fourth Lord's Day After Easter" ;;
			35) echo "Fifth Lord's Day After Easter" ;;
			42) echo "Ascension Sunday" ;;
			49) echo "Day of Pentecost" ;;
		esac
		exit
	
	# dates after Trinity
	else
		if [[ $SUN -gt 324 ]]; then
			WEEK=$(( $CHR - $SUN ))
			case $WEEK in
				35) echo "Christ the King Sunday" ;;
				28) echo "First Lord's Day in Advent" ;;
				21) echo "Second Lord's Day in Advent" ;;
				14) echo "Third Lord's Day in Advent" ;;
				7)  echo "Fourth Lord's Day in Advent" ;;
				0)  echo "First Lord's Day in Christmastide" ;;
			esac
			exit
		else
			WEEK=$(( $SUN - $TRI ))
			case $WEEK in
				0)  echo "Trinity Sunday" ;;
				7)  echo "First Lord's Day After Trinity" ;;
				14) echo "Second Lord's Day After Trinity" ;;
				21) echo "Third Lord's Day After Trinity" ;;
				28) echo "Fourth Lord's Day After Trinity" ;;
				35) echo "Fifth Lord's Day After Trinity" ;;
				42) echo "Sixth Lord's Day After Trinity" ;;
				49) echo "Seventh Lord's Day After Trinity" ;;
				56) echo "Eighth Lord's Day After Trinity" ;;
				63) echo "Ninth Lord's Day After Trinity" ;;
				70) echo "Tenth Lord's Day After Trinity" ;;
				77) echo "Eleventh Lord's Day After Trinity" ;;
				84) echo "Twelfth Lord's Day After Trinity" ;;
				91) echo "Thirteenth Lord's Day After Trinity" ;;
				98) echo "Fourteenth Lord's Day After Trinity" ;;
				105) echo "Fifteenth Lord's Day After Trinity" ;;
				112) echo "Sixteenth Lord's Day After Trinity" ;;
				119) echo "Seventeenth Lord's Day After Trinity" ;;
				126) echo "Eighteenth Lord's Day After Trinity" ;;
				133) echo "Nineteenth Lord's Day After Trinity" ;;
				140) echo "Twentieth Lord's Day After Trinity" ;;
				147) echo "Twenty-first Lord's Day After Trinity" ;;
				154) echo "Twenty-second Lord's Day After Trinity" ;;
				161) echo "Twenty-third Lord's Day After Trinity" ;;
				168) echo "Twenty-fourth Lord's Day After Trinity" ;;
				175) echo "Twenty-fifth Lord's Day After Trinity" ;;
				182) echo "Twenty-sixth Lord's Day After Trinity" ;;
				189) echo "Twenty-seventh Lord's Day After Trinity" ;;
				196) echo "Twenty-eighth Lord's Day After Trinity" ;;
				203) echo "Twenty-ninth Lord's Day After Trinity" ;;
			esac
			exit
		fi
	fi

else
	echo "An error occurred."
	exit
fi
