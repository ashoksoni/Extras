#!/bin/sh

cd /home/ashok_soni/delta-build/latestbuild/oneplus2
ftp -piv <<EOF
open delta
binary
cd oneplus2
mput *
close
open afh
binary
mput *
close
open bb
binary
cd oneplus2
mput *
close
open rr
binary
cd downloads.resurrectionremix.com/oneplus2
mput *
close
bye
EOF

cd /home/ashok_soni/delta-build/latestbuild/oneplus3
ftp -piv <<EOF
open delta
binary
cd oneplus3
mput *
close
open afh
binary
mput *
close
open bb
binary
cd oneplus3
mput *
close
bye
EOF

cd /home/ashok_soni/delta-build/publish/oneplus2
ftp -piv <<EOF
open delta
binary
cd delta/oneplus2
mput *
close
open bb
binary
cd delta/oneplus2
mput *
close
bye
EOF

cd /home/ashok_soni/delta-build/publish/oneplus3
ftp -piv <<EOF
open delta
binary
cd delta/oneplus3
mput *
close
open bb
binary
cd delta/oneplus3
mput *
close
bye
EOF
