#!/bin/bash

# honor $TMPDIR if it is already defined, use /tmp otherwise
if [ -z $TMPDIR ]; then
    export WORKDIR=/tmp/$USER
else
    export WORKDIR=$TMPDIR/$USER
fi

# Make directories required by CVMFS and mount bind them to the right locations
mkdir -p ${WORKDIR}/{var-lib-cvmfs,var-run-cvmfs}
export SINGULARITY_BIND="${WORKDIR}/var-run-cvmfs:/var/run/cvmfs,${WORKDIR}/var-lib-cvmfs:/var/lib/cvmfs"

# Use a temporary home directory since we want a playground
mkdir -p ${WORKDIR}/home
export SINGULARITY_HOME="${WORKDIR}/home:/home/$USER"

# Tell apptainer to fusemount EESSI using CVMFS
export EESSI_REPO="container:cvmfs2 software.eessi.io /cvmfs/software.eessi.io"

# Start a shell
singularity shell --fusemount "$EESSI_REPO" docker://ghcr.io/eessi/client:rocky8
