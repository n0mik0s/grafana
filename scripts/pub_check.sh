#!/bin/bash
file1="/root/id_rsa.pub.new"
file2="/root/id_rsa.pub"
while true; do sleep 1 && sudo gsutil cp BUCKET_PUB_KEY_URI ${file1}&& break; done
if [[ -f ${file1} ]] && [[ -f ${file2} ]]
then
    md5_1=`md5sum ${file1} | awk '{ print $1 }'`
    md5_2=`md5sum ${file2} | awk '{ print $1 }'`
    if [[ "${md5_1}" != "${md5_2}" ]]
    then
      sudo cat ${file1} >> /root/.ssh/authorized_keys
    fi
fi