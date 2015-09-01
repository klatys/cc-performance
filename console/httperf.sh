httperf --help
httperf --server codecamp.cz --port 80 --num-conns 10 --rate 1

# single URL. --uri is relative for --server
httperf --server=mobilni-telefony.heureka.cz --rate=10 -vv --add-header "Accept-Encoding: gzip\n" --num-conns=100000 --timeout=4 --uri='/f:1651:387362;1666:2/'

# list of URLs
cat urls.txt | sed s/'http:\/\/im9.cz'// | tr '\n' '\0' > perf_test.txt
# benchmark. --rate specifies number of connections created per second. 
httperf --server=mobilni-telefony.heureka.cz --rate=10 -vv --add-header "Accept-Encoding: gzip\n" --num-conns=100000 --timeout=4 --wlog=y,perf_test.txt

# use custom IP address of a given host (override DNS)
httperf --server=95.168.214.67 --rate=1000 -vv --server-name="im9.cz" --num-conns=100000 --timeout=1 --uri='/favicon.ico'

# debugging - display request and response headers
httperf --server=95.168.214.67 --rate=1 -vv --server-name="im9.cz" --num-conns=1 --timeout=1 --uri='/favicon.ico' --print-reply 'header' --print-request 'header'
