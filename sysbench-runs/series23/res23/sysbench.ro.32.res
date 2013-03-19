sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1011305
        write:                           0
        other:                           1011305
        total:                           2022610
    transactions:                        1011305 (16854.78 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1011305 (16854.78 per sec.)
    other operations:                    1011305 (16854.78 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1011305
    total time taken by event execution: 1918.3718
    per-request statistics:
         min:                                  1.08ms
         avg:                                  1.90ms
         max:                                  5.39ms
         approx.  95 percentile:               2.25ms

Threads fairness:
    events (avg/stddev):           31603.2812/19.94
    execution time (avg/stddev):   59.9491/0.00

