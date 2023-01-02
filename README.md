# INCEPTION
This project is an introduction to docker and the concept of containerization, the project job is the set up three containers, one for the database that linked the one of WordPress, and linked with the one of nginx, The structure of the project like the illustration below.

<img src="./images/proj_struc.png" align="center">

<br></br>

## What problems Docker solve ?

Most of the modern applications have similar setups. They all use a combination of different technologies to
assemble a complete application functionality. An example would be an app that uses combination of following
services:

* Node.js for Webserver
* ReactJs for frontend
* MongoDb as a database
* Messaging system - Redis
* Orchestration tool - Ansible

These technologies each have a version the application depends on, also the application isn't an isolated thing
that just floats around. It needs to run in an environment, since the environment can differ in OS, version, hardware etc, it's obvious that the application and its technologies with their respective versions should work the same on different environments.
Without docker, this means that each environment that the application runs on (local dev environment, a test or production server) needs to be configured with the correct versions of these services so that application can run properly.

**So the following problems arise**

* Compatibility of each service with the underlying OS
* Compatibility of each service with the libraries and dependencies of OS (One service requires versionX of OS library. Another service - versionY of same library)
* Every time version of any service updates, you might need to recheck compatibilities with underlying OS infrastructure
* For a new developer to setup the environment with right OS and Service versions

**Docker Solution**

* Each service has and can manage its required OS dependencies for itself, bundled and isolated in its own container
* Change the components without affecting the other services
* Change underlying OS without affecting any of the services

As a result, docker should avoid the typical "works on my machine" cases. In the development process, for example, developers and testers will have the identical environment where the application runs, since this environment is packaged in docker containers, which just like a file, can be transferred around as an artifact.

## What is Docker ?

