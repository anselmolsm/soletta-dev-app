#!/bin/bash

# This file is part of the Soletta Project
#
# Copyright (C) 2015 Intel Corporation. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
SYSTEMCTL_COMMAND="$1"
SCRIPT="$3"
ENV_PATH="$2"
SERVICE="fbp-runner@"$(systemd-escape $ENV_PATH)

case $SYSTEMCTL_COMMAND in
*"start")
    sol-fbp-runner -c $SCRIPT
    if [ $? -ne 0 ]; then
        exit 1
    fi
    ;;
"stop")
    ;;
    *)
    echo "Invalid systemctl command: $SYSTEMCTL_COMMAND"
    exit 1
    ;;
esac

systemctl -q $SYSTEMCTL_COMMAND $SERVICE
exit $?