#!/usr/bin/env bash

case $VERSION in
3.16.1) DIR=Base55958 PART_FILENAME=3.16.1;;
3.17) DIR=Base56787 PART_FILENAME=3.17;;
4.0.2) DIR=Base59877 PART_FILENAME=4.0.2;;
4.1.2) DIR=Base60321 PART_FILENAME=4.1.2.60604_2018_05_16;;
4.6) DIR=Base67926 PART_FILENAME=4.6.0.67926;;
4.6.1) DIR=Base67926 PART_FILENAME=4.6.1.68195;;
4.6.2) DIR=Base69232 PART_FILENAME=4.6.2.69232;;
4.7) DIR=Base70154 PART_FILENAME=AStar.4.7;;
4.7.1) DIR=Base70154 PART_FILENAME=4.7.1;;
4.8.2) DIR=Base71663 PART_FILENAME=4.8.2;;
4.8.3) DIR=Base72282 PART_FILENAME=4.8.3;;
4.8.4) DIR=Base73286 PART_FILENAME=4.8.4;;
4.8.6) DIR=Base73620 PART_FILENAME=4.8.6;;
4.9.0) DIR=Base74071 PART_FILENAME=4.9.0;;
4.9.1) DIR=Base74456 PART_FILENAME=4.9.1;;
4.9.2) DIR=Base74741 PART_FILENAME=4.9.2;;
4.9.3) DIR=Base75025 PART_FILENAME=4.9.3;;
4.10) DIR=Base75689 PART_FILENAME=4.10;;
*) echo "Version not supported";;
esac

# shellcheck disable=SC2163
export VERSION
# shellcheck disable=SC2163
export DIR
# shellcheck disable=SC2163
export PART_FILENAME

bash "$@"
