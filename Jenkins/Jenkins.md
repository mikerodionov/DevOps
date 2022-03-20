## Why Jenkins?

* Easy to use
    * Easy to navigate Web UI
    * Documentation and samples included
* Free & open source (MIT license)
    * Free to install and use
    * Open source (code available on github.com)
* Extensible
    * Plugins for additional functionality
* Community

## Key Jenkins Terms

* Project/Job - a user configured description of the work that Jenkins will manage, outline of what you want Jenkins to do. Terms job and project are interchangeable.
* Build - specific instance of run of a job/project or action of doing that (noun/verb)
* Build Step - a task inside of a project
* Build trigger - event that starts a build, manual or automatic
* Plugin - a software package that extends core Jenkins functionality

## Jenkins System Requirements

* Hardaware
    * 256 MB RAM / Container - 1 GB RAM
    * 1 GB disk space / Container - 10 GB disk space
* Software
    * Java 11 / Container - Java not required (preconfigured docker images will include it), container runtime (e.g. Docker Personal edition)

## Jenkins install

### Windows

* [Download Microsoft Build of OpenJDK 11](https://docs.microsoft.com/en-us/java/openjdk/older-releases) and install
* [Downlad Git](https://git-scm.com/downloads) and install
* [Download Jenkins MSI](https://jenkins.io/download) and install
    * Create local user with Logon as a servicep permission
    * Make sure default Jenkins port (8080) is not in use bu other software
    * Install default plugins

### Mac

* [Install Homebrew package manager](https://brew.sh/)

### Ubuntu

