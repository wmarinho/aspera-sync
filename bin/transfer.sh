#!/bin/bash
ASPERA_SYNC_DIR=$HOME/aspera-sync

ASCP_CONF=conf/ascp.properties
. ${ASPERA_SYNC_DIR}/${ASCP_CONF}

ASCP_LOG_DIR="${ASPERA_SYNC_DIR}/logs"

CUSTOM_OPTIONS="--file-manifest-path=${ASCP_LOG_DIR} --file-manifest=text"

log (){
  echo "$(date) - $1"
}

SOURCE="${ASPERA_USER}@${ASPERA_SERVER}:/"

if [ "${ASPERA_PASS}" ]; then
	SOURCE="${ASPERA_USER}:${ASPERA_PASS}@${ASPERA_SERVER}:/"
fi

TARGET=${HOME}/

if [ ! -d "${ASCP_LOG_DIR}" ]; then
   mkdir ${ASCP_LOG_DIR}
fi

log "Starting transfer with ${ASPERA_USER}@${ASPERA_SERVER}, using private key ${ASPERA_PRIVATE_KEY} ..."

if [ ! -f ${ASPERA_PRIVATE_KEY} ] && [ ! "${ASPERA_PASS}" ]; then
  log "Aspera Private Key not found or empty password!!"
  exit 1
fi

if [ "$1" ]; then
  SOURCE=$1
fi

if [ "$2" ]; then
  TARGET=$2
fi

if [ "$3" ]; then
  ASCP_MAX_RATE="-l $3"
fi

log "Syncing ${SOURCE} -->> ${TARGET}"

CMD="ascp -i ${ASPERA_PRIVATE_KEY} ${ASCP_OPTIONS} ${CUSTOM_OPTIONS} ${ASCP_MAX_RATE} ${SOURCE} ${TARGET}"

log "Running: $CMD"
RET=`$CMD`

if [ "$?" -ne "0" ]; then
	log "ASCP command failed."
	exit 0
fi
log "Syncing has completed successfully!!"
log "${RET}"
