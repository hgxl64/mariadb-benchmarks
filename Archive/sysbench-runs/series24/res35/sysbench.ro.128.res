sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2410586
        write:                           0
        other:                           2410586
        total:                           4821172
    transactions:                        2410586 (40174.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2410586 (40174.00 per sec.)
    other operations:                    2410586 (40174.00 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              2410586
    total time taken by event execution: 7674.9912
    per-request statistics:
         min:                                  1.08ms
         avg:                                  3.18ms
         max:                                 30.76ms
         approx.  95 percentile:               6.69ms

Threads fairness:
    events (avg/stddev):           18832.7031/100.26
    execution time (avg/stddev):   59.9609/0.00

