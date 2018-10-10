```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-3740QM CPU @ 2.70GHz
Number of Available Cores: 8
Available memory: 16 GB
Elixir 1.7.3
Erlang 20.3.2

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 μs
parallel: 1
inputs: none specified
Estimated total run time: 14 s

Name                   ips        average  deviation         median         99th %
Plain Struct      424.44 K        2.36 μs   ±940.79%           2 μs           7 μs
Ecto Schema       156.11 K        6.41 μs   ±277.71%           6 μs          16 μs

Comparison:
Plain Struct      424.44 K
Ecto Schema       156.11 K - 2.72x slower
```
