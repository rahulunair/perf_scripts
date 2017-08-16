#! /bin/bash
save_to="./log/perf.out"

for i in 1 in {1..3}:
do
	./perf_bash.sh | tail -n +5 >> $save_to
done
cat $save_to | awk '!seen[$0]++' > ./log/final.out
