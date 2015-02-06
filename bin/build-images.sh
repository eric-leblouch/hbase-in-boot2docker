#!/bin/bash
# Start the boot2docker VM if needed
ignore=$(boot2docker up 2> /dev/null)
# Initialize shell variables for docker
$(boot2docker shellinit 2> /dev/null)
SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
if [ ${1:-"undef"} = "force" ]
then
 NOCACHE="--no-cache=true"
fi
for dir in $SCRIPT_HOME/../images/*/
do
  cd $dir &&
  image_name=${PWD##*/} && # to assign to a variable
  echo "Building $image_name from $dir" &&
  docker build $NOCACHE -t ubeeko/$image_name .
done


