#!/bin/bash

echo "Please enter number of queries: "
read input_variable
echo "***EXPORTING: $input_variable queries!"
FILE='words_titles_list'
FILE2='titles_list'
FILE3='genres_list'
FILE4='year_list'
FILE5='person_list'
FILE6='words_person_list'
COUNTER=1
while [  $COUNTER -le $input_variable ]; do

   if [ $(($COUNTER % 4)) -eq 1 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search2 $NAME1" >> type1_hbase.sh
	echo "./search_neo search_movie 5 $NAME1" >> type1_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search $NAME1" >> type1_2_hbase.sh
	echo "./search_neo search_movie 4 $NAME1" >> type1_2_neo4j.sh
	echo "./search_neo search_movie 7 $NAME1" >> type1_3_neo4j.sh
	echo "./search_neo search_movie 9 $NAME1" >> type11_neo4j.sh
	echo "./search_neo search_movie 10 $NAME1" >> type11_1_neo4j.sh
   elif [ $(($COUNTER % 4)) -eq 2 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME2=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search2 $NAME1 $NAME2" >> type1_hbase.sh
	echo "./search_neo search_movie 5 $NAME1 $NAME2" >> type1_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search $NAME1 $NAME2" >> type1_2_hbase.sh
	echo "./search_neo search_movie 4 $NAME1 $NAME2" >> type1_2_neo4j.sh
	echo "./search_neo search_movie 7 $NAME1 $NAME2" >> type1_3_neo4j.sh
	echo "./search_neo search_movie 7 $NAME1 $NAME2" >> type1_3_neo4j.sh
	echo "./search_neo search_movie 9 $NAME2" >> type11_neo4j.sh
	echo "./search_neo search_movie 10 $NAME2" >> type11_1_neo4j.sh
   elif [ $(($COUNTER % 4)) -eq 3 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME2=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME3=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search2 $NAME1 $NAME2 $NAME3" >> type1_hbase.sh
	echo "./search_neo search_movie 5 $NAME1 $NAME2 $NAME3" >> type1_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search $NAME1 $NAME2 $NAME3" >> type1_2_hbase.sh
	echo "./search_neo search_movie 4 $NAME1 $NAME2 $NAME3" >> type1_2_neo4j.sh
	echo "./search_neo search_movie 7 $NAME1" >> type1_3_neo4j.sh
		echo "./search_neo search_movie 9 $NAME3" >> type11_neo4j.sh
		echo "./search_neo search_movie 10 $NAME3" >> type11_1_neo4j.sh
   else
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME2=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME3=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME4=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search2 $NAME1 $NAME2 $NAME3 $NAME4" >> type1_hbase.sh
	echo "./search_neo search_movie 5 $NAME1 $NAME2 $NAME3 $NAME4" >> type1_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search $NAME1 $NAME2 $NAME3 $NAME4" >> type1_2_hbase.sh
	echo "./search_neo search_movie 4 $NAME1 $NAME2 $NAME3 $NAME4" >> type1_2_neo4j.sh
	echo "./search_neo search_movie 7 $NAME1 $NAME2" >> type1_3_neo4j.sh
		echo "./search_neo search_movie 9 $NAME4" >> type11_neo4j.sh
	echo "./search_neo search_movie 10 $NAME4" >> type11_1_neo4j.sh
   fi
   let COUNTER=COUNTER+1 
done


COUNTER=1
while [  $COUNTER -le $input_variable ]; do
    let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search2 $NAME1" >> type2_hbase.sh
	echo "./search_neo search_movie 2 $NAME1" >> type2_neo4j.sh
    let COUNTER=COUNTER+1 
done



COUNTER=1
while [  $COUNTER -le $(($input_variable/2)) ]; do

   if [ $(($COUNTER % 4)) -eq 1 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 type $TYPE1 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 type $TYPE1 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 type $TYPE1 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 year $YEAR1" >> type10_neo4j.sh
   elif [ $(($COUNTER % 4)) -eq 2 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME2=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 $NAME2 type $TYPE1 $TYPE2 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 $NAME2 type $TYPE1 $TYPE2 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 $NAME2 type $TYPE1 $TYPE2 $YEAR1 2013" >> type3_2_neo4j.sh
		echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 $NAME2 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 $NAME2 year $YEAR1" >> type10_neo4j.sh
   elif [ $(($COUNTER % 4)) -eq 3 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME2=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME3=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE3=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 $NAME2 $NAME3 type $TYPE1 $TYPE2 $TYPE3 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 $NAME2 $NAME3 type $TYPE1 $TYPE2 $TYPE3 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 $NAME2 $NAME3 type $TYPE1 $TYPE2 $TYPE3 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 $NAME2 $NAME3 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 $NAME2 $NAME3 year $YEAR1" >> type10_neo4j.sh
   else
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
       let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME2=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME3=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE3=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME4=$(head -n $n $FILE | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE4=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 $NAME2 $NAME3 $NAME4 type $TYPE1 $TYPE2 $TYPE3 $TYPE4 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 $NAME2 $NAME3 $NAME4 type $TYPE1 $TYPE2 $TYPE3 $TYPE4 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 $NAME2 $NAME3 $NAME4 type $TYPE1 $TYPE2 $TYPE3 $TYPE4 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 $NAME2 $NAME3 $NAME4 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 $NAME2 $NAME3 $NAME4 year $YEAR1" >> type10_neo4j.sh
	
   fi
   let COUNTER=COUNTER+1 
done
COUNTER=1
while [  $COUNTER -le $(($input_variable/2)) ]; do

   if [ $(($COUNTER % 4)) -eq 1 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME1=$(head -n $n $FILE2 | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
	   let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME2=$(head -n $n $FILE2 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 type $TYPE1 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 type $TYPE1 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 type $TYPE1 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 year $YEAR1" >> type10_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME1" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME1" >> type12_2_neo4j.sh
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME2" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME2" >> type12_2_neo4j.sh
   elif [ $(($COUNTER % 4)) -eq 2 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME1=$(head -n $n $FILE2 | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
       let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME2=$(head -n $n $FILE2 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 $type $TYPE1 $TYPE2 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 type $TYPE1 $TYPE2 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 type $TYPE1 $TYPE2 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 year $YEAR1" >> type10_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME1" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME1" >> type12_2_neo4j.sh
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME2" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME2" >> type12_2_neo4j.sh
   elif [ $(($COUNTER % 4)) -eq 3 ]; then
       let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME1=$(head -n $n $FILE2 | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	   let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME2=$(head -n $n $FILE2 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
      	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE3=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 type $TYPE1 $TYPE2 $TYPE3 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 type $TYPE1 $TYPE2 $TYPE3 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 type $TYPE1 $TYPE2 $TYPE3 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 year $YEAR1" >> type10_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME1" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME1" >> type12_2_neo4j.sh
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME2" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME2" >> type12_2_neo4j.sh
   else
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	   let "n=${RANDOM}%$(wc -l < $FILE2)"
       NAME2=$(head -n $n $FILE2 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE3=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE4=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
       echo "bin/hbase org.apache.hadoop.examples.search3 $NAME1 type $TYPE1 $TYPE2 $TYPE3 $TYPE4 year $YEAR1 2013" >> type3_hbase.sh
	echo "./search_neo search_moviestypes 2 $NAME1 type $TYPE1 $TYPE2 $TYPE3 $TYPE4 $YEAR1 2013" >> type3_neo4j.sh
	echo "./search_neo search_moviestypes 4 $NAME1 type $TYPE1 $TYPE2 $TYPE3 $TYPE4 $YEAR1 2013" >> type3_2_neo4j.sh
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "bin/hbase org.apache.hadoop.examples.search4 $NAME1 year $YEAR1" >> type10_hbase.sh
	echo "./search_neo search_movie 3 $NAME1 year $YEAR1" >> type10_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME1" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME1" >> type12_2_neo4j.sh
	let "n=${RANDOM}%$(wc -l < $FILE)"
       NAME1=$(head -n $n $FILE | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	echo "./search_neo search_movie 1 $NAME1" >> type3_3_neo4j.sh
	echo "./search_neo search_moviestypes 1 $NAME2" >> type12_neo4j.sh
	echo "./search_neo search_moviestypes 3 $NAME2" >> type12_2_neo4j.sh
   fi
   let COUNTER=COUNTER+1 
done


COUNTER=1
while [  $COUNTER -le $input_variable ]; do
       let "n=${RANDOM}%$(wc -l < $FILE6)"
       NAME1=$(head -n $n $FILE6 | tail -1 | tr -d '\040\011\012\015')
	   echo "./bin/hbase org.apache.hadoop.examples.searchperson filteron $NAME1" >> type4_hbase.sh
	   echo "./bin/hbase org.apache.hadoop.examples.searchpersonmovie filteron $NAME1" >> type4_2_hbase.sh
	   echo "./search_neo search_moviesactors 2 $NAME1" >> type4_2_neo4j.sh
	   let "n=${RANDOM}%$(wc -l < $FILE5)"
       NAME1=$(head -n $n $FILE5 | tail -1 | sed -e 's/^ *//g' -e 's/ *$//g')
	   echo "./bin/hbase org.apache.hadoop.examples.searchperson $NAME1" >> type5_hbase.sh
	   echo "./bin/hbase org.apache.hadoop.examples.searchpersonmovie $NAME1" >> type5_2_hbase.sh
	   echo "./search_neo search $NAME1" >> type5_neo4j.sh
	   echo "./search_neo search_moviesactors 1 $NAME1" >> type5_2_neo4j.sh
   let COUNTER=COUNTER+1 
done
 
COUNTER=1
while [  $COUNTER -le $input_variable ]; do
	if [ $(($COUNTER % 3)) -eq 1 ]; then
	   let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
	   K=$[ ( $RANDOM % 30 )  + 1 ]
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year having year greater_than $YEAR1" >> type6_hbase.sh
	   echo "./search_neo search_movie 6 $YEAR1 2013" >> type6_neo4j.sh
	   echo "./search_neo search_movie 8 $YEAR1 2013" >> type6_2_neo4j.sh
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year type having year greater_than $YEAR1" >> type8_hbase.sh
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year type having year greater_than $YEAR1 top $K" >> type9_hbase.sh
	   echo "./search_neo search_typesyears 1 greater_than $YEAR1" >> type8_neo4j.sh
	   echo "./search_neo search_typesyears 2 greater_than $YEAR1 top $K" >> type9_neo4j.sh
	elif [ $(($COUNTER % 3)) -eq 2 ]; then
	   let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
	   K=$[ ( $RANDOM % 30 )  + 1 ]
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year having year less_than $YEAR1" >> type6_hbase.sh
       echo "./search_neo search_movie 6 1900 $YEAR1" >> type6_neo4j.sh
		echo "./search_neo search_movie 8 1900 $YEAR1" >> type6_2_neo4j.sh 
		echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year type having year less_than $YEAR1" >> type8_hbase.sh
		echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year type having year less_than $YEAR1 top $K" >> type9_hbase.sh
	   echo "./search_neo search_typesyears 1 less_than $YEAR1" >> type8_neo4j.sh
	   echo "./search_neo search_typesyears 2 less_than $YEAR1 top $K" >> type9_neo4j.sh
	elif [ $(($COUNTER % 3)) -eq 0 ]; then
	   let "n=${RANDOM}%$(wc -l < $FILE4)"
       YEAR1=$(head -n $n $FILE4 | tail -1 | tr -d '\040\011\012\015')
	   K=$[ ( $RANDOM % 30 )  + 1 ]
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year having year equals $YEAR1" >> type6_hbase.sh	
	   echo "./search_neo search_movie 6 $YEAR1" >> type6_neo4j.sh	   
	   echo "./search_neo search_movie 6 $YEAR1" >> type6_2_neo4j.sh	   
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year type having year equals $YEAR1" >> type8_hbase.sh
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby year type having year greater_than $YEAR1 top $K" >> type9_hbase.sh
	   echo "./search_neo search_typesyears 1 greater_than $YEAR1" >> type8_neo4j.sh
	   echo "./search_neo search_typesyears 2 greater_than $YEAR1 top $K" >> type9_neo4j.sh
	fi
    let COUNTER=COUNTER+1 
done


COUNTER=1
while [  $COUNTER -le $input_variable ]; do
	if [ $(($COUNTER % 3)) -eq 1 ]; then
	   let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby type having type $TYPE1" >> type7_hbase.sh
	   echo "./search_neo search_moviestypes 5 type $TYPE1" >> type7_neo4j.sh
	elif [ $(($COUNTER % 3)) -eq 2 ]; then
	   let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	   let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby type having type $TYPE1 $TYPE2" >> type7_hbase.sh		
	   echo "./search_neo search_moviestypes 5 type $TYPE1 $TYPE2" >> type7_neo4j.sh
	elif [ $(($COUNTER % 3)) -eq 0 ]; then
	   let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE1=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	   let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE2=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	   let "n=${RANDOM}%$(wc -l < $FILE3)"
       TYPE3=$(head -n $n $FILE3 | tail -1 | tr -d '\040\011\012\015')
	   echo "bin/hbase org.apache.hadoop.examples.search_grouphaving groupby type having type $TYPE1 $TYPE2 $TYPE3" >> type7_hbase.sh
	   echo "./search_neo search_moviestypes 5 type $TYPE1 $TYPE2 $TYPE3" >> type7_neo4j.sh	   
	fi
    let COUNTER=COUNTER+1 
done
