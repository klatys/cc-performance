httperf --help
httperf --server www.glami.cz --port 80 --num-conns 10 --rate 1

# single URL. --uri is relative for --server
httperf --server=www.glami.cz --rate=10 -vv --add-header "Accept-Encoding: gzip\n" --num-conns=100000 --timeout=4 --uri='/zeny/'

# list of URLs
cat urls.txt | sed s/'http:\/\/codecamp.cz'// | tr '\n' '\0' > perf_test.txt
# benchmark. --rate specifies number of connections created per second. 
httperf --server=codecamp.cz --rate=10 -vv --add-header "Accept-Encoding: gzip\n" --num-conns=100000 --timeout=4 --wlog=y,perf_test.txt

# use custom IP address of a given host (override DNS)
httperf --server=88.86.121.27 --rate=1000 -vv --server-name="codecamp.cz" --num-conns=100000 --timeout=1 --uri='/favicon.ico'

# debugging - display request and response headers
httperf --server=88.86.121.27 --rate=1 -vv --server-name="codecamp.cz" --num-conns=1 --timeout=1 --uri='/favicon.ico' --print-reply 'header' --print-request 'header'
