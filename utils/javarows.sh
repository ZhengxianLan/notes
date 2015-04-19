#!/bin/bash
# show the max rows java files
find "$1" -name *.java -type f |
	xargs wc -l|
		grep -v total$|
			sort -nr|
				less
