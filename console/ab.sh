ab --help
ab -n 100 -c 5 http://codecamp.cz/

# 4 parallel requests, 2K requests total, gzip
ab -c4 -n2000  -k -H 'Accept-Encoding: gzip'  -H 'User-Agent: XYZbot' "http://www.glami.cz/"
