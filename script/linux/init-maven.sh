#!/bin/sh

set -e

echo 'init-maven'

WORK_PATH=~/.m2
echo "WORK_PATH: ${WORK_PATH}"

mkdir -p "${WORK_PATH}"

MAVEN_PROPERTIES=settings.xml
MAVEN_PROPERTIES_PATH=${WORK_PATH}/${MAVEN_PROPERTIES}

SETTING_URL=https://github.com/cc332030/maven/raw/refs/heads/master/conf/settings-env.xml
curl -sL -o "${MAVEN_PROPERTIES_PATH}" "${SETTING_URL}"

USER=$(whoami)
if [ "root" = "${USER}" ]
then
  USER_HOME=/root
else
  USER_HOME=/home/${USER}
fi
echo "USER_HOME: ${USER_HOME}"

if [ ! ~ = "${USER_HOME}" ]
then
  ln -s ${WORK_PATH} "${USER_HOME}"
fi

echo 'init-maven successfully'
