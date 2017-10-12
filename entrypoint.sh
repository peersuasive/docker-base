#!/bin/sh

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}
GROUP_ID=${LOCAL_GROUP_ID:-9001}
if [ $USER_ID -eq 0 ]; then
    exec "$@"
else
    ! getent group $GROUP_ID >/dev/null && addgroup -g $GROUP_ID user
    adduser -S -s /bin/bash -u $USER_ID -G user user
    export HOME=/home/user
    exec /usr/local/bin/gosu user "$@"
fi
