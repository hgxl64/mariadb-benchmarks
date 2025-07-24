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
        read:                            1272410
        write:                           0
        other:                           1272410
        total:                           2544820
    transactions:                        1272410 (21205.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1272410 (21205.59 per sec.)
    other operations:                    1272410 (21205.59 per sec.)

Test execution summary:
    total time:                          60.0035s
    total number of events:              1272410
    total time taken by event execution: 7676.6770
    per-request statistics:
         min:                                  1.76ms
         avg:                                  6.03ms
         max:                                 40.70ms
         approx.  95 percentile:              10.43ms

Threads fairness:
    events (avg/stddev):           9940.7031/50.46
    execution time (avg/stddev):   59.9740/0.00

