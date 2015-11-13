#!/bin/bash
sbt_version=$1
if [ "${sbt_version}" == "" ];then
  echo "Specify sbt version (e.g. 0.13.9)"
  exit 1
fi
current_dir=`dirname $0`
cd ${current_dir}
rm -rf ${sbt_version}
export SBT_OPTS="${SBT_OPTS} -Dsbt.ivy.home=${sbt_version}"
./sbt compile
zip -r ivy2_cache_${sbt_version}.zip ${sbt_version}/cache
rm -rf ${sbt_version}
