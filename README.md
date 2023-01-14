# INCEPTION

## The purpose of the project?

This project is an introduction to docker and the concept of containerization, the project job is the set up three containers, one for the Databases containing the MariaDB database that is linked with docker volume, and another container that contains WordPress installed and linked with another volume, those two previous containers are connected via port 3306, and the wordpress container connected to nginx web server that is connected via port 9000 using SSL certificates (TLS v1.2), the nginx container point in the same volume as the one of wordpress.

The is discribed below :
<img src="./images/structure.png">

## How you can run the project?

run the following command to clone the project in your local machine:
<br> </br>
`git clone https://github.com/Mohamed-Moumni/INCEPTION.git`
<br> </br>
Firstly You should install docker and docker-compose and make in your OS, then go the terminal and type
<br> </br>
`make run`
<br></br>
## Server structure for mandatory?

## What is new in the bonus?

## Resources and tutorial

[Notion] * (https://mmoumni.notion.site/INCEPTION-dd43a99ce2af40348014ee72912f3f90)