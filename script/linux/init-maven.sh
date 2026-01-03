#!/bin/sh

set -e

echo 'init-maven'

WORK_PATH=~/.m2
echo "WORK_PATH: ${WORK_PATH}"

mkdir -p "${WORK_PATH}"

MAVEN_PROPERTIES=settings.xml
MAVEN_PROPERTIES_PATH=${WORK_PATH}/${MAVEN_PROPERTIES}

echo "
<?xml version=\"1.0\" encoding=\"UTF-8\"?>

<settings xmlns=\"http://maven.apache.org/SETTINGS/1.0.0\"
          xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
          xsi:schemaLocation=\"http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd\" >

    <servers>

        <server>
            <id>${NEXUS_SNAPSHOT_ID}</id>
            <username>${NEXUS_USERNAME}</username>
            <password>${NEXUS_PASSWORD}</password>
        </server>

        <server>
            <id>${NEXUS_RELEASE_ID}</id>
            <username>${NEXUS_USERNAME}</username>
            <password>${NEXUS_PASSWORD}</password>
        </server>

    </servers>

    <mirrors>
        <mirror>
            <id>central</id>
            <url>${MAVEN_CENTRAL}</url>
            <mirrorOf>central</mirrorOf>
        </mirror>
    </mirrors>

    <profiles>
        <profile>
            <id>${NEXUS_ID}</id>

            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>

            <repositories>

                <repository>
                    <id>${NEXUS_SNAPSHOT_ID}</id>
                    <url>${NEXUS_SNAPSHOT_URL}</url>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                    <releases>
                        <enabled>false</enabled>
                    </releases>
                </repository>

                <repository>
                    <id>${NEXUS_RELEASE_ID}</id>
                    <url>${NEXUS_RELEASE_URL}</url>
                    <snapshots>
                        <enabled>false</enabled>
                    </snapshots>
                    <releases>
                        <enabled>true</enabled>
                    </releases>
                </repository>

            </repositories>
        </profile>
    </profiles>

</settings>

" > "${MAVEN_PROPERTIES_PATH}"

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
