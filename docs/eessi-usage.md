# Using EESSI

If the EESSI repository is available, all you need to do is set up your shell environment,
and you can start using the software installations that EESSI provides.

## Setting up your environment

To set up the EESSI environment, run the command:

``` { .bash .copy }
source /cvmfs/software.eessi.io/versions/2025.06/init/lmod/bash
```

This may take a while as data is downloaded from a Stratum 1 server which is
part of the CernVM-FS infrastructure to distribute files. You should see the
following output:

``` { .bash .no-copy }
$ source /cvmfs/software.eessi.io/versions/2025.06/init/lmod/bash
Modules purged before initialising EESSI
Module for EESSI/2025.06 loaded successfully
EESSI has selected aarch64/neoverse_n1 as the compatible CPU target for EESSI/2025.06 # (1)!
EESSI did not identify an accelerator on the system # (2)!
(for debug information when loading the EESSI module, set the environment variable EESSI_MODULE_DEBUG_INIT)
{EESSI/2025.06} $ # (3)!
```

1.  What is reported here depends on the CPU architecture of the machine you are
    running the `source` command.
2.  EESSI can also detect the NVIDIA or AMD accelerator on your system, and expose the corresponding software
    for that architecture
3.  This is the prompt indicating that you have access to the `2025.06` version of EESSI software
    stack.

The last line is the shell prompt.

:clap: Your environment is now set up, you are ready to start running software provided by EESSI!

## Basic commands to access software provided via EESSI

EESSI provides software through environment module files and [Lmod](https://lmod.readthedocs.io).

To see which modules (and extensions) are available, run:

``` { .bash .copy }
module avail
```

Below is a short excerpt of the output produced by `module avail`, showing 10 modules only.
``` { .output }
----- /cvmfs/software.eessi.io/versions/2025.06/software/linux/.../modules/all -----
   Abseil/20240722.0-GCCcore-13.3.0
   absl-py/2.1.0-GCCcore-13.3.0
   alsa-lib/1.2.14-GCCcore-14.3.0
   AmberTools/25.2-foss-2025a
   amdahl/0.4.1-gompi-2025b
   ant/1.10.12-Java-17
   archspec/0.2.5-GCCcore-13.3.0
   Armadillo/14.0.3-foss-2024a
   Armadillo/15.0.1-foss-2025b                     (D)
   arpack-ng/3.9.1-foss-2024a
   ...
```

Load modules with `module load package/version`, e.g.,
`module load R/4.5.1-gfbf-2025a`, and try out the software. See below for a short
session

```
{EESSI/2025.06} $ module load R/4.5.1-gfbf-2025a
{EESSI/2025.06} $ which R
/cvmfs/software.eessi.io/versions/2025.06/software/linux/aarch64/neoverse_n1/software/R/4.5.1-gfbf-2025a/bin/R
{EESSI/2025.06} $ R --version
R version 4.5.1 (2025-06-13) -- "Great Square Root"
Copyright (C) 2025 The R Foundation for Statistical Computing
Platform: aarch64-unknown-linux-gnu

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
https://www.gnu.org/licenses/.
```

## Running EESSI demos

To really experience how using EESSI can significantly facilitate the work of researchers,
we recommend running one or more of the EESSI demos.

First, clone the ``eessi-demo`` Git repository, and move into the resulting directory:

``` { .bash .copy }
git clone https://github.com/EESSI/eessi-demo.git
cd eessi-demo
```

The contents of the directory should be something like this:

``` { .output .no-copy }
$ ls -l
drwxr-xr-x 2 example users  4096 May  5 15:13 Bioconductor
drwxr-xr-x 2 example users  4096 May  5 15:13 ESPResSo
drwxr-xr-x 2 example users  4096 May  5 15:13 GROMACS
-rw-r--r-- 1 example users 18092 Mar 11  2025 LICENSE
drwxr-xr-x 2 example users  4096 Jun 30  2025 Nextflow
drwxr-xr-x 2 example users  4096 Mar 11  2025 OpenFOAM
drwxr-xr-x 2 example users  4096 Mar 11  2025 PyTorch
drwxr-xr-x 2 example users  4096 Mar 11  2025 QuantumESPRESSO
-rw-r--r-- 1 example users  2211 May  5  2025 README.md
drwxr-xr-x 2 example users  4096 Mar 11  2025 TensorFlow
drwxr-xr-x 5 example users  4096 May  5  2025 gpu
drwxr-xr-x 2 example users  4096 May 31 09:30 scripts
drwxr-xr-x 2 example users  4096 Nov 30 11:37 tblite
```

The directories we care about are those that correspond to particular scientific software,
like ``Bioconductor``, ``GROMACS``, ``OpenFOAM``, ``TensorFlow``, ...

Each of these contains a ``run.sh`` script that can be used to start a small
example run with that software. Every example takes a couple of minutes to run,
even with limited resources only.

## Example: running GROMACS

Let's try running the GROMACS example.

First, we need to make sure that [our environment is set up to use EESSI](../setting_up_environment):

``` { .bash .copy }
source /cvmfs/software.eessi.io/versions/2025.06/init/lmod/bash
```

Change to the ``GROMACS`` subdirectory of the ``eessi-demo`` Git repository, and execute the ``run.sh`` script:

``` { .bash .no-copy }
{EESSI/2025.06} $ cd GROMACS/
{EESSI/2025.06} $ ./run.sh
```

Shortly after starting the script you should see output as shown below, which indicates that GROMACS has started
running:

``` { .output .no-copy }
              :-) GROMACS - gmx mdrun, 2025.2-EasyBuild_5.1.2 (-:

Executable:   /cvmfs/software.eessi.io/versions/2025.06/software/linux/aarch64/neoverse_n1/software/GROMACS/2025.2-foss-2025a/bin/gmx
...
starting mdrun 'Protein'
1000 steps,      2.5 ps.
```

[*(back to overview page)*](index.md)
