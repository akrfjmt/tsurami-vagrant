#!/bin/sh
if [ $# -ne 3 ]; then
  echo "引数が3つ必要です。"
  exit 1
fi

user=$1
src=$2
dest=$3
destdir=$(dirname ${dest})

if [ ! -e ${src} ]; then
  echo "${src}が存在しません"
  exit 1
fi

if [ ! -d ${destdir} ]; then
  if [ ! -e ${destdir} ]; then
    mkdir ${destdir}
    echo "${destdir}を作成しました"
  else
    echo "${destdir}を作成できませんでした。同名のファイルが存在します"
    exit 1
  fi
fi

if [ ! -e ${dest} ]; then
  cp ${src} ${dest}
  echo "${dest}を作成しました"
elif [ $(grep -c -f ${src} ${dest}) -lt 1 ]; then
  cp -f ${src} ${dest}
  echo "${dest}を上書きしました"
fi

chown ${user}: ${destdir}
chown ${user}: ${dest}
chmod 700 ${destdir}
chmod 600 ${dest}

exit 0
