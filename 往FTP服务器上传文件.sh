#!/bin/bash
ftp -n<<!
open 132.129.43.150
user username passwd
binarys
hash
cd ./
lcd ./
prompt
mput xxx_kdbz_20150926.csv  xxx_kdbz_20150926.csv
close
bye
!
