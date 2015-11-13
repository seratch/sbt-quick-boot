#!/bin/bash

sbt_version=$1
if [ "${sbt_version}" == "" ];then
  echo "Specify sbt version (e.g. 0.13.9)"
  exit 1
fi

repo_base_url="https://github.com/seratch/sbt-quick-boot"
filename="ivy2_cache_${sbt_version}.zip"
wget "${repo_base_url}/raw/master/${filename}"
unzip ${filename}
rm -f ${filename}

mkdir -p $HOME/.ivy/cache
mv ${sbt_version}/cache/* $HOME/.ivy2/cache/.
rm -rf ${sbt_version}/cache

wget "${repo_base_url}/raw/master/sbt"
chmod +x sbt

mkdir bin
cd bin
wget "${repo_base_url}/raw/master/bin/sbt-launch.jar"

cd -
./sbt
