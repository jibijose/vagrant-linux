#!/bin/bash

COUCHBASE_VERSION=4.5.1
COUCHBASE_TAR_GZ_FILE=couchbase-server-enterprise-$COUCHBASE_VERSION-centos7.x86_64.rpm
COUCHBASE_ARCHIVE_FILE=/vagrant/resources/$COUCHBASE_TAR_GZ_FILE
COUCHBASE_DOWNLOAD_LINK=https://packages.couchbase.com/releases/$COUCHBASE_VERSION/$COUCHBASE_TAR_GZ_FILE

echo "installing couchbase $COUCHBASE_VERSION"

function downloadLocalCouchBase {
	echo "downloading couchbase to $COUCHBASE_ARCHIVE_FILE"
	wget --quiet -O $COUCHBASE_ARCHIVE_FILE --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "$COUCHBASE_DOWNLOAD_LINK"
	echo "downloaded couchbase to $COUCHBASE_ARCHIVE_FILE"
}
function installLocalCouchBase {
	echo "installing couchbase"
	rpm -i $COUCHBASE_ARCHIVE_FILE >/dev/null
	echo export COUCHBASE_HOME=/opt/couchbase >> /etc/profile.d/couchbase.sh
	echo export PATH=\${COUCHBASE_HOME}/bin:\${PATH} >> /etc/profile.d/couchbase.sh
}
function installCouchBase {
	if [ ! -f "$COUCHBASE_ARCHIVE_FILE" ]
	then
		downloadLocalCouchBase
	fi
	installLocalCouchBase
}

installCouchBase

echo "installed couchbase $COUCHBASE_VERSION"