#!/bin/bash

echo "Adding project to workspace"

docs="data models notebooks pipelines"

TARGET="README.md"
PADRAO=$1
PROJETO=$2
STATE=$3
PHASE=$4
DESC=$5
LANG=$6
sed "s/|--:|:-:|:-:|---|:-:|---|/|--:|:-:|:-:|---|:-:|---|\n|**$PROJETO**|$STATE|**$PHASE**|$DESC|$LANG | 2022-10-09|/g" $TARGET > output.txt
cat output.txt > $TARGET
rm output.txt
echo $PADRAO
if [ $PADRAO = "True" ]; then
    echo "Adding to default workspace"
    mkdir $PROJETO && cd $PROJETO
    for val in $docs; do
        mkdir "$val"
    done
else
    echo "Adding to $SOURCE_PATH"
    for val in $docs; do
        mkdir "$val/$PROJETO" || (mkdir $val && mkdir "$val/$PROJETO")
    done
fi