#https://github.com/wg/wrk/wiki/Installing-wrk-on-Linux

#run for 10s with 32 threads at 1024 concurrent requests
wrk -c1024 -d10 -t32 -H'Accept-Encoding: gzip'  https://www.google.com
