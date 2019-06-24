#!/bin/sh
cd `dirname $0`
ROOT_PATH=`pwd`
java -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp .:$ROOT_PATH:$ROOT_PATH/../lib/routines.jar:$ROOT_PATH/../lib/dom4j-1.6.1.jar:$ROOT_PATH/../lib/log4j-1.2.16.jar:$ROOT_PATH/../lib/talend_file_enhanced_20070724.jar:$ROOT_PATH/jobpere_0_1.jar:$ROOT_PATH/deletedb_0_1.jar:$ROOT_PATH/todatabaseconvocation_0_1.jar:$ROOT_PATH/todatabasefin_0_1.jar:$ROOT_PATH/todatabase__0_1.jar:$ROOT_PATH/threetoone_0_1.jar:$ROOT_PATH/todatabase_epreuve_0_1.jar: bdd_id.jobpere_0_1.JobPere  "$@" 