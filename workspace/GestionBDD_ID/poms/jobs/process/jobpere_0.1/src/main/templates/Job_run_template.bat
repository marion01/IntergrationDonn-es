%~d0
cd %~dp0
java -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp .;../lib/routines.jar;../lib/dom4j-1.6.1.jar;../lib/log4j-1.2.16.jar;../lib/talend_file_enhanced_20070724.jar;jobpere_0_1.jar;deletedb_0_1.jar;todatabaseconvocation_0_1.jar;todatabasefin_0_1.jar;todatabase__0_1.jar;threetoone_0_1.jar;todatabase_epreuve_0_1.jar; bdd_id.jobpere_0_1.JobPere  %* 