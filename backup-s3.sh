#!/bin/sh

source=${1%/}
dest=${2%/}

date +%s > /tmp/last_backup

aws s3 sync $source/ $dest/

aws s3 cp /tmp/last_backup "${dest}/last_backup"
