# Getting Access to EESSI

To get access to EESSI, it suffices to have [CernVM-FS](https://cernvm.cern.ch/fs/) installed, and make it aware
of the EESSI repository.

## Is EESSI accessible?

EESSI can be accessed via [a native (CernVM-FS) installation](#native-installation),
or via [a container that includes CernVM-FS](#eessi-via-a-container).

Before you look into these options, check if EESSI is already accessible on your system.

Run the following command:
``` { .bash .copy }
ls /cvmfs/software.eessi.io
```

!!! note

    This ``ls`` command may take a couple of seconds to finish, since CernVM-FS may need to download
    or update the metadata for that directory.

If you see output like shown below, **you already have access to EESSI on your system**. :tada:
```
README.eessi  defaults  host_injections  init  versions
```

For starting to use EESSI, continue reading about
[Setting up environment](eessi-usage.md#setting-up-your-environment).

If you see an error message as shown below, **EESSI is not yet accessible on your
system**.
```
ls: /cvmfs/software.eessi.io: No such file or directory
```
No worries, you don't need to be a :mage: to get access to EESSI.

Continue reading about the [Native installation](#native-installation) of EESSI,
or accessing [EESSI via a container](#eessi-via-a-container).

## Native installation

Setting up native access to EESSI, that is a system-wide deployment that does not require workarounds like
[using a container](#eessi-via-a-container), requires the installation and configuration of [CernVM-FS](https://cernvm.cern.ch/fs).

This requires **admin privileges**, since you need to install CernVM-FS as an OS package.

The following actions must be taken for a (basic) native installation of EESSI:

* Installing CernVM-FS itself, ideally using the OS packages provided by the CernVM-FS project
  (although installing from source is also possible);
* Installing the EESSI configuration for CernVM-FS, which can be done by installing the ``cvmfs-config-eessi``
  package that we provide for the most popular Linux distributions
  (more information available [here](https://github.com/EESSI/filesystem-layer/));
* Creating a small client configuration file for CernVM-FS (``/etc/cvmfs/default.local``);
  see also the [CernVM-FS documentation](https://cvmfs.readthedocs.io/en/stable/cpt-quickstart.html#create-default-local).

The good news is that all of this only requires a handful commands :astonished: :

=== "RHEL-based Linux distributions"

    ``` { .bash .copy }
    # Installation commands for RHEL-based distros like CentOS, Rocky Linux, Almalinux, Fedora, ...

    # install CernVM-FS
    sudo yum install -y https://cvmrepo.s3.cern.ch/cvmrepo/yum/cvmfs-release-latest.noarch.rpm
    sudo yum install -y cvmfs

    # create client configuration file for CernVM-FS (no squid proxy, 10GB local CernVM-FS client cache)
    sudo bash -c "echo 'CVMFS_CLIENT_PROFILE="single"' > /etc/cvmfs/default.local"
    sudo bash -c "echo 'CVMFS_QUOTA_LIMIT=10000' >> /etc/cvmfs/default.local"
    sudo bash -c "echo 'CVMFS_USE_CDN=yes' >> /etc/cvmfs/default.local"

    # make sure that EESSI CernVM-FS repository is accessible
    sudo cvmfs_config setup
    ```

=== "Debian-based Linux distributions"

    ``` { .bash .copy }
    # Installation commands for Debian-based distros like Ubuntu, ...

    # install CernVM-FS
    sudo apt-get update
    sudo apt-get install -y lsb-release wget
    wget https://cvmrepo.s3.cern.ch/cvmrepo/apt/cvmfs-release-latest_all.deb
    sudo dpkg -i cvmfs-release-latest_all.deb
    rm -f cvmfs-release-latest_all.deb
    sudo apt-get update
    sudo apt-get install -y cvmfs

    # create client configuration file for CernVM-FS (no squid proxy, 10GB local CernVM-FS client cache)
    sudo bash -c "echo 'CVMFS_CLIENT_PROFILE=single' > /etc/cvmfs/default.local"
    sudo bash -c "echo 'CVMFS_QUOTA_LIMIT=10000' >> /etc/cvmfs/default.local"
    sudo bash -c "echo 'CVMFS_USE_CDN=yes' >> /etc/cvmfs/default.local"

    # make sure that EESSI CernVM-FS repository is accessible
    sudo cvmfs_config setup
    ```

!!! note

    :point_up: The commands above only cover the basic installation of EESSI.

    This is good enough for an individual client, or for testing purposes,
    but for a production-quality setup you should also set up a Squid proxy cache.

    For large-scale systems, like an HPC cluster, you should also consider setting up your own CernVM-FS Stratum-1 mirror server.

    For more details on this, please refer to the
    [*Stratum 1 and proxies section* of the CernVM-FS tutorial](https://cvmfs-contrib.github.io/cvmfs-tutorial-2021/03_stratum1_proxies/).

## EESSI via a container

!!! warning "Prerequisite"

    Apptainer 1.0.0 (_or newer_), or Singularity 3.7.x
    
    - Check with `apptainer --version` or `singularity --version`
    - Support for the `--fusemount` option in the ``shell`` and ``run`` subcommands is required

A small script can provide a very easy yet versatile means
to access EESSI using a container.

```bash title="eessi-via-container.sh"
--8<-- "scripts/eessi-via-container.sh"
```

This page guides you through an example scenario
illustrating the use of the script.


### Quickstart

Run the `eessi_via_container.sh` script to start a shell session in the container with EESSI available:

``` { .bash .copy }
./eessi_via_container.sh
```

!!! Note
    Startup will take a bit longer the first time you run this because the container image is downloaded and converted.

You should see output like
```
INFO:    Environment variable SINGULARITY_BIND is set, but APPTAINER_BIND is preferred
INFO:    Environment variable SINGULARITY_HOME is set, but APPTAINER_HOME is preferred
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
INFO:    Fetching OCI image...
161.9KiB / 161.9KiB [===============================================================================] 100 % 3.1 MiB/s 0s
41.2MiB / 41.2MiB [=================================================================================] 100 % 3.1 MiB/s 0s
5.2MiB / 5.2MiB [===================================================================================] 100 % 3.1 MiB/s 0s
68.8MiB / 68.8MiB [=================================================================================] 100 % 3.1 MiB/s 0s
117.8MiB / 117.8MiB [===============================================================================] 100 % 3.1 MiB/s 0s
88.4MiB / 88.4MiB [=================================================================================] 100 % 3.1 MiB/s 0s
INFO:    Extracting OCI image...
2026/05/31 08:50:54  warn rootless{usr/libexec/openssh/ssh-keysign} ignoring (usually) harmless EPERM on setxattr "user.rootlesscontainers"
INFO:    Inserting Apptainer configuration...
INFO:    Creating SIF file...
[=============================================================================================================] 100 % 0s
CernVM-FS: pre-mounted on file descriptor 3

Apptainer>
```
!!! Note
    You may have to press enter to clearly see the prompt as some messages
    beginning with `CernVM-FS: ` have been printed after the first prompt
    `Apptainer> ` was shown.

In this environment, you should be able to access the EESSI `software.eessi.io` repository:

``` { .bash .copy }
ls /cvmfs/software.eessi.io
```

---

To start using EESSI, see [Using EESSI](eessi-usage.md).

[*(back to overview page)*](index.md)
