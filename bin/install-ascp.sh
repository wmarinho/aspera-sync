#!/bin/bash

ASCP_VERSION=3.5.4
ASCP_BUILD=102989
ASCP_INSTALLER=ascp-install-${ASCP_VERSION}.${ASCP_BUILD}-linux-64.sh

if test `id -u` -ne 0; then echo You must be root; exit 1; fi

wget -nv http://download.asperasoft.com/download/sw/ascp-client/${ASCP_VERSION}/${ASCP_INSTALLER}; \
    sh ${ASCP_INSTALLER}; \
    rm ${ASCP_INSTALLER}

