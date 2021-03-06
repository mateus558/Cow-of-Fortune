
chmod +x ~/.fortune_cow/.check_day.sh

FLAG=$(~/.fortune_cow/.check_day.sh)
d=$(date +'%a-%b-%d/%m/%y' )
h=$(date +'%T')
GREEN='\033[0;32m'
RED='\033[0;31m'

if [ $FLAG == 1 ]
then
	if [ -f ~/.fortune_cow/.session_out ]
	then
		rm ~/.fortune_cow/.session_out
		touch ~/.fortune_cow/.session_out
	fi
	chmod +x ~/.vocab
	fortune -a | cowsay >> ~/.fortune_cow/.session_out && echo >> ~/.fortune_cow/.session_out && ~/.vocab >> 			~/.fortune_cow/.session_out
fi
	
cat ~/.fortune_cow/.session_out
echo -e "${GREEN}${d} ${RED}${h}"
