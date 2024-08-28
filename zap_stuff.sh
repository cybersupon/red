#!/bin/sh

# Just a script for using Zap-docker from here: https://hub.docker.com/u/owasp
# Ping Soups if you need help or want w/e added.
# Happy Hunting, Stay vigilant.



PS3='Please enter your choice: '
options=("Full Scan URL" "Baseline Scan URL" "Zap GUI" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Full Scan URL")
            echo "what URL are we fully scanning?"
	    echo "ex: http://google.com"
	    read url
	    var=$url
	    var=${var#*//}
	    var=${var%%/*}
	    docker pull ghcr.io/zaproxy/zaproxy:weekly
	    docker run --rm -v $(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:weekly zap-full-scan.py  -t $url -g gen.conf -z "-Xmx10240m -config network.connection.timeoutInSecs=60" -r zap-full-results-$var.html
	    break
            ;;
        "Baseline Scan URL")
            echo "what URL are we baseline scanning?"
	    echo "ex: http://google.com"
            read url
	    var=$url
            var=${var#*//}
            var=${var%%/*}
	    docker pull ghcr.io/zaproxy/zaproxy:weekly
            docker run --rm -v $(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:weekly zap-baseline.py -t $url -g gen.conf -r zap-base-results-$var.html
	    break
            ;;
        "Zap GUI")
	    echo "starting GUI"
	    docker pull ghcr.io/zaproxy/zaproxy:weekly
	    docker run --rm -u zap -p 8080:8080 -p 8090:8090 -i ghcr.io/zaproxy/zaproxy:weekly zap-webswing.sh &
	    echo " ***** "
	    echo ""
	    echo "opening http://localhost:8080/zap"
	    sleep 10
	    open http://localhost:8080/zap
	    break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
