INDEX=$1
i=0
re='^[0-9]+$'
GREEN='\033[0;32m'
RED='\033[0;31m'
LIGHT_MANGENTA='\033[0;95m'
CYAN='\033[0;93m'
LIGHT_BLUE='\033[0;94m'
NC='\033[0m'

clear

if  [[ $INDEX = "0" ]] ; then
   echo -e "${RED}Please insert a valid number after bash ./tester.sh\n\n" >&2; exit 1
fi

if [[ "$INDEX" -gt "0" ]];
then
    INDEX="$(($INDEX-1))"
fi

if ! [[ $INDEX =~ $re ]] ; then
   echo -e "${RED}Please insert a valid number after bash ./tester.sh \n\n" >&2; exit 1
fi

rm -f output.txt

echo -e "${LIGHT_BLUE}Sorting...\n\n${NC}"

while [ $i -le 100 ]
do
	ARG=`ruby -e "puts (0..$INDEX).to_a.shuffle.join(' ')"`; echo $ARG >> output.txt ; ../push_swap $ARG | ./checkers/checker_Mac $ARG >> output.txt; ../push_swap $ARG | wc -l >> output.txt
  ((i++))
done

cat ./output.txt | grep -q KO

empty="$?"

INDEX="$(($INDEX+1))"

if [[ $empty == *"1"* ]];
then
  echo -e "Sorting ${LIGHT_MANGENTA}100 ${NC}random tests with ${CYAN}$INDEX ${NC}numbers${GREEN} PASSED!${NC}"
  awk 'NR % 3 == 0' output.txt > results.txt
  gcc output_info.c -lm
  ./a.out
  rm ./a.out
  rm results.txt
else
  echo -e "Sorting ${LIGHT_MANGENTA}100 ${NC}random tests with ${CYAN}$INDEX ${NC} numbers${RED} FAILED! ${NC}"
fi

echo -e "\n"

