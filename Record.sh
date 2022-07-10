#!/bin/bash
#All targets in orchestra
cd ~/TMT_BEHAVIOR/
message="Trying to initiate screen session"
echo $message

while IFS=, read IP box experiment cage animal totaltime sex weight dob strain virus day notes ziplistfile videodir logdir;
do
export $IP $box $experiment $cage $animal $totaltime $sex $weight $dob $strain $virus $day $notes $ziplistfile $videodir $logdir
sshpass -p "estrin1" ssh -n -tt $IP 'tag=$(date "+%Y%m%d%H%M%S") && screen -dmS $tag bash -c "echo $message; exec bash" && screen -r $tag -p 0 -X stuff "bash ~/base/code/temp/Record_RUN.sh\n" && exit; exec bash -l'
done < schedule.txt
date

sleep $totaltime

echo "Recordings should have finished"