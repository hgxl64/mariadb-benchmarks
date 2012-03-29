[ -f graph.ro.pdf ] && rm graph.ro.pdf
R --no-save <graph.ro.R
[ -f graph.rw.pdf ] && rm graph.rw.pdf
R --no-save <graph.rw.R
