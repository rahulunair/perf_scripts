#! /bin/bash
save_to="./log/perf.out"
final_out="./log/perf-out.csv"
for i in 1 in {1..30}:
do
	./perf_bash.sh | tail -n +5 >> $save_to
done
cat $save_to | awk '!seen[$0]++' >  $final_out
rm $save_to
