#!/bin/sh

cp /home/ashok_soni/rr/CHANGELOG.mkdn /home/ashok_soni/rrOTA/CHANGELOG.mkdn
cd /home/ashok_soni/rrOTA
git add .
git commit -m "New update"
git push
