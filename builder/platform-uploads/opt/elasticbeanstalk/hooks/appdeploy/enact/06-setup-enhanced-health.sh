#!/bin/bash -xe
#   Copyright  2016-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
#   Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at
#
#   http://aws.amazon.com/apache2.0/
#
#   or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.



. /etc/yespoho/platform.config

if [ -d /etc/healthd ]
then
    # Track Nginx
    /opt/elasticbeanstalk/bin/healthd-track-pidfile --proxy nginx
    /opt/elasticbeanstalk/bin/healthd-configure --appstat-log-path /usr/local/openresty/nginx/logs/access.log --appstat-uni sec --appstat-timestamp-on 'completion' 

    RESTART_HEALTHD=''
    ## Track application pids
    PID_FILE="/usr/local/openresty/nginx/logs/nginx.pid"
    if [ -f "$PID_FILE" ]; then
        /opt/elasticbeanstalk/bin/healthd-track-pidfile --name nginx --location $PID_FILE 
        RESTART_HEALTHD='true'
    fi

    ## restart healthd 
    if [ ! -z "$RESTART_HEALTHD" ]; then
        /opt/elasticbeanstalk/bin/healthd-restart
    else
        echo "Not restarting HealthD since no processes to track"
        exit 1
    fi
fi
