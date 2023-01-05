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

## What is Docker?

Docker is an open source project for building, shipping, and running programs. It is a command- line program, a background process, and a set of remote services that take a logistical approach to solving common software problems and simplifying your experience installing, running, publishing, and removing software. It accomplishes this by using an operating system technology called containers

## What is Container?

When we run applications on our computer, this could be the web browser or VScode that you are using to read this post. That application is running as a process or what is known as a process. On our laptops or systems, we tend to run multiple applications or as we said processes. When we open a new application or click on the application icon this is an application we would like to run, sometimes this application might be a service that we just want to run in the background, our operating system is full of services that are running in the background providing you with the user experience you get with your system.

That application icon represents a link to an executable somewhere on your file system, the operating system then loads that executable into memory. Interestingly, that executable is sometimes referred to as an image when we're talking about a process.

Containers are processes, A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

Containerised software will always run the same, regardless of the infrastructure. Containers isolate software from its environment and ensure that it works uniformly despite differences for instance between development and staging.

I mentioned images in the last section when it comes to how and why containers and images combined made containers popular in our ecosystem.

<img src="./images/containers.png">

## What is an Image?

A container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings. Container images become containers at runtime

### The anatomy of a Docker image

A Docker image is a read-only template that contains a set of instructions for creating a container that can run on the Docker platform. It provides a convenient way to package up applications and preconfigured server environments, which you can use for your private use or share publicly with other Docker users. Docker images are also the starting point for anyone using Docker for the first time.

To create an image you should write your instructions for the image in a dockerfile. so What is a dockerfile ?

### What is a Dockerfile ?

A dockerfile is a text file that contains commands you would normally execute manually to build a docker image. Docker can build images automatically by reading the instructions we have in our dockerfile.

Each of the files that make up a docker image is known as a layer. these layers form a series of images, built on top of each other in stages. Each layer is dependent on the layer immediately below it. The order of your layers is key to the efficiency of the lifecycle management of your docker images

<img src="./images/docker_image.png">

### How to create a Docker image ?




## What is Volumes?

## How docker Network works?

## What is DockerHub?

## BONUS PART

### Redis CACHING

