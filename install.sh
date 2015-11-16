#!/bin/bash

sbt_version=$1
if [ "${sbt_version}" == "" ];then
  sbt_version="0.13.9"
fi

repo_base_url="https://github.com/seratch/sbt-quick-boot/releases/download/${sbt_version}/"
filename="ivy2_cache_${sbt_version}.zip"
curl -L "${repo_base_url}/${filename}" -o ${filename}
unzip ${filename}
rm -f ${filename}

mkdir -p $HOME/.ivy2/cache
cp -pr ${sbt_version}/cache/* $HOME/.ivy2/cache/.
rm -rf ${sbt_version}

curl -L "${repo_base_url}/sbt" -o sbt
chmod +x sbt

mkdir -p bin
cd bin
curl -L "${repo_base_url}/sbt-launch.jar" -o sbt-launch.jar

cd -
./sbt
