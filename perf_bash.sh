#! /bin/bash
temp_file=/tmp/${RANDOM}
mktemp "$temp_file.XXXXX"
perf_command="/usr/bin/perf stat  -x","  -a -e task-clock,migrations,page-faults,cycles,instructions,branches,branch-misses,L1-dcache-loads,L1-dcache-misses,"cpu/cache-misses/",LLC-loads,LLC-misses,cpu/cache-references/,power/energy-cores/,stalled-cycles-frontend,stalled-cycles-backend --log-fd 9 stress-ng -l 60  --cpu-load-slice 0 -c 4 -t 10s 9> ${temp_file}"
#perf_command="/usr/bin/perf stat  -x","  -a -e task-clock,migrations,page-faults,cycles,instructions,branches,branch-misses,L1-dcache-loads,L1-dcache-misses,"cpu/cache-misses/",LLC-loads,LLC-misses,cpu/cache-references/,power/energy-cores/,stalled-cycles-frontend,stalled-cycles-backend --log-fd 3 stress -c 4 -t 6s 3> ${temp_file}"
echo "Executing::" $perf_command
eval $perf_command
# format="cat $temp_file | sed '2d' |head  -n -2  | awk 'BEGIN {FS=\",\"} {print $3\",\"$1}' |csvtool transpose -"
format="cat $temp_file | sed '2d' |head  -n -2 "
#printf "\n"
#printf "\n"
eval $format | awk -f <(cat - <<-'EOD'
			BEGIN {
				FS=",";}
			{
				print $3","$1;
			}
EOD
) | csvtool transpose -
rm $temp_file




