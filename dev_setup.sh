#! /bin/bash

GRADLE_VERSION=2.3

# commands in this block won't be run if env_vars.sh exists
if [ ! -f /etc/profile.d/env_vars.sh ]
then
    apt-get update
    apt-get install -y zip \
                       python-pip \
                       git \
                       mysql-client \
                       openjdk-7-jdk \
                       build-essential \
                       libssl-dev \
                       libffi-dev \
                       python-dev

    gcloud components update pkg-python pkg-java --quiet

    pip install pyopenssl pep8 pylint

    wget -P /tmp https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip
    unzip /tmp/gradle-$GRADLE_VERSION-bin.zip
    mv gradle-$GRADLE_VERSION /opt/gradle
    rm /tmp/gradle-$GRADLE_VERSION-bin.zip
    cat <<EOF > /etc/profile.d/env_vars.sh
    export PATH=$PATH:/opt/gradle/bin:/usr/local/share/google/google-cloud-sdk/bin/
EOF
fi
