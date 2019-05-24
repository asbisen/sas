options cashost="localhost" casport=5570;
options AUTHINFO='/home/sas/authinfo.txt';

%let datadir=%sysget(DATADIR);
%put data directory is &datadir;

cas csvsession sessopts=(caslib=public timeout=1800 locale='en_US');
caslib _all_ assign;

proc casutil;
        load file="&datadir/input/iris.csv"
        outcaslib="public" casout="iris";
run;

/*--Scatter Plot Matrix--*/

title 'IRIS Dataset';
proc sgscatter data=public.iris;
  matrix sepal_length sepal_width petal_length petal_width /
     transparency=0.8 markerattrs=graphdata3(symbol=circlefilled);
run;
