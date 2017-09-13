# CPU Performace Analysis - Pstate

**Objective**: To identify parameters that will eventually help in creating a learning DVFS

**Experiment 01**:  Stress test of CPU at different frequency steps to identify the frequency at which EPI is lowest, where EPI is Energy Per Instruction.

**Experiment 02**: Identify frequency range for lowest average EPI for real world workloads so that the utlization is 100 % and there is no or acceptable performance imapact.


### How to run:

Just run ./bench.sh and this script will call the perf script and spit out a csv file
you could modify the benchmark utility parameters in the perf script.
