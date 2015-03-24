#!/bin/bash

# Home dir
ASPERA_SYNC_DIR=$HOME/aspera-sync

# Load ascp properties
ASCP_CONF=conf/ascp.properties
. ${ASPERA_SYNC_DIR}/${ASCP_CONF}

# Log dir
ASCP_LOG_DIR="${ASPERA_SYNC_DIR}/logs"

# Ser custom options
CUSTOM_OPTIONS="--file-manifest-path=${ASCP_LOG_DIR} --file-manifest=text"

# Echo log function
log (){
  echo "$(date) - $1"
}

# Create default source and target
SOURCE="${ASPERA_USER}@${ASPERA_SERVER}:/"
TARGET=${HOME}/

# Export password when defined
if [ "${ASPERA_PASS}" ]; then
	export ASPERA_SCP_PASS=${ASPERA_PASS}
fi

# Create Log dir
if [ ! -d "${ASCP_LOG_DIR}" ]; then
   mkdir ${ASCP_LOG_DIR}
fi

log "Starting transfer with ${ASPERA_USER}@${ASPERA_SERVER}, using private key ${ASPERA_PRIVATE_KEY} ..."

# Check if private key or passward is defined
if [ ! -f ${ASPERA_PRIVATE_KEY} ] && [ ! "${ASPERA_PASS}" ]; then
  log "Aspera Private Key not found or empty password!!"
  exit 1
fi

if [ "${ASPERA_PRIVATE_KEY}" ]; then
   ASCP_OPTIONS="${ASCP_OPTIONS} -i ${ASPERA_PRIVATE_KEY}"
fi
# Init custom options.
# Usage: sh bin/trasfer.sh {source_path} {target_source} {max_rate}
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

# Create command
CMD="ascp ${ASPERA_PRIVATE_KEY} ${ASCP_OPTIONS} ${CUSTOM_OPTIONS} ${ASCP_MAX_RATE} ${SOURCE} ${TARGET}"

log "Running: $CMD"
#RET=`$CMD`

if [ "$?" -ne "0" ]; then
	log "ASCP command failed."
	exit 0
fi
log "Syncing has completed successfully!!"
log "${RET}"

