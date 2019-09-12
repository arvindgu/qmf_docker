# Steps to create Dockerfile for QMF for WebSphere


**Introduction:**
IBM has published Official IBM WebSphere Application Server traditional for Developers image in docker hub.
In below steps, I am using this docker image to demonstrate how to create a docker image which will IBM WebSphere Application Server and QMF for WorkStation.

**Prerequisite:**
Docker is already installed in Ubuntu machine.

**Steps to create Docker image for QMF for Workstation**
   Follow below steps to create QMF for Workstation docker image. These steps are tested in Ubuntu operating system.
   
1.	Create a folder in user directory where to create Docker image for QMF for WorkStation. For example, directory name as “qmf_docker”.

2.	Change directory to qmf_docker

3.	Copy QMFWebSphere122.war file in qmf_docker directory.

4.	Create a file with name as “Dockerfile”

5.	Open the Dockerfile with vi editor

6.	Copy below text and paste in Dockerfile
    
    ```
    FROM ibmcom/websphere-traditional:profile
    COPY QMFWebSphere122.war /tmp/QMFWebSphere122.war
    EXPOSE 9043
    EXPOSE 80
    EXPOSE 9443
    EXPOSE 9080
    RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/QMFWebSphere122.war', '[ -appname QMFWebSphere122 -contextroot /QMFWebSphere122 -MapWebModToVH [[ QMFWebSphere122.war QMFWebSphere122.war,WEB-INF/web.xml default_host]]]')"
    
    ```
7.	Save the Dockerfile

8.	Run below command to create the Docker image with tag name as qmfwebsphere122
    
    ```
    docker build -t qmfwebsphere122 . 
    ```

9.	You can verify whether Docker image is created via running below command
    
    ```
    docker image ls
    ```

10.	Run below command to launch the container with docker image qmfwebsphere122
    
    ```
    docker run -p 9043:9043 -p 9443:9443 qmfwebsphere122
    ```

11.	Wait until server starts 

12.	Open a browser windows and invoke below links to launch QMF. Replace the <Ubuntu_Machine_Name> with the ubuntu machine name or IP Address in below links.
    https://<Ubuntu_Machine_Name>:9443/QMFWebSphere122/admin
    https:// <Ubuntu_Machine_Name>:9443/QMFWebSphere122/user 
 

**Note:**
This Dockerfile is just an example to demonstrate that how you can use official IBM WebSphere Application Server traditional for Developers image and add QMF for WorkStation in it, to create a docker image having QMF and WebSphere server together. 
Before production use, refer the license terms of official IBM WebSphere Application Server traditional for Developers image docker hub.

For production usage, you should create a docker image of your licensed WebSphere application server and then use it to create another docker image to include QMF for WebSphere in it.

