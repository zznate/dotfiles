#!/bin/sh
# path location of stock installs 
v1_7_jdk=/System/Library/Frameworks/JavaVM.framework/Versions/A 
v1_6_jdk=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK
current_jdk=/System/Library/Frameworks/JavaVM.framework/Versions/Current
# pull out version 
java_version=`java -version 2>&1 | grep version |cut -d ' ' -f 3`
# verify the reset to the version
check_if_set()
{
  if [ "x`echo $java_version |grep $1`" != "x" ]; then
    echo "already set to $1"
    exit 1
  fi
}

print_version()
{
  echo "-------------- reset jdk -----------------"
  java -version
  echo "------------------------------------------"
}

while true; do
  case "$1" in
    7)
      check_if_set "1.7"
      sudo rm $current_jdk
      sudo ln -s $v1_7_jdk $current_jdk
      break
    ;;
    6)
      check_if_set "1.6"
      sudo rm $current_jdk
      sudo ln -s $v1_6_jdk $current_jdk
      break
    ;;
    *)
      echo "Single argument of 6 or 7 must be provided for corresponding jdk version"
      exit 1
  esac
done
print_version
