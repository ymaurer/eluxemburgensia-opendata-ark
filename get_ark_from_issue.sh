#!/bin/bash

# This script echoes the ARK identifier and the paperid and the date if the type is ISSUE
# it takes as input a dublin core file formatted according to the conventions in:
# https://data.bnl.lu/tools/#bnlmetsexporter
FILE=$1
RES=`xmllint "$FILE" --format | egrep '<dc:identifier>|<dc:source>|<dc:type>'`
TYPE=`echo $RES | cut -d\< -f6`
if [ "$TYPE" = "dc:type>ISSUE" ]
then
	IDENTIFIER=`echo $RES | cut -d/ -f6,8,9 | tr / '\\t' | tr -d '<'`
	echo $IDENTIFIER
fi
