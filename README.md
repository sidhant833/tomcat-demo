# 🚀 Java Web Application Deployment on Apache Tomcat using AWS EC2

A hands-on DevOps project demonstrating how to build a Java web application using Maven, package it as a WAR file, deploy it on Apache Tomcat, and host it on an AWS EC2 instance.

---

## 📌 Project Overview

In this project, I created a Java web application and deployed it on an Apache Tomcat server running on an AWS EC2 instance.

The complete deployment flow was:

```text
Java Web Application
        ↓
      Maven
        ↓
     WAR File
        ↓
   SCP Transfer
        ↓
    AWS EC2
        ↓
 Apache Tomcat
        ↓
   Tomcat Manager
        ↓
 Web Application
        ↓
    Browser

The project helped me understand the basic workflow of deploying a Java web application to a Linux server using Maven, Apache Tomcat, AWS EC2 and SSH/SCP.

🏗️ Architecture
                 ┌──────────────────────┐
                 │   Windows Developer  │
                 │                      │
                 │ Java 17              │
                 │ Maven 3.9.15         │
                 │ VS Code              │
                 └──────────┬───────────┘
                            │
                            │ mvn clean package
                            ▼
                 ┌──────────────────────┐
                 │    WAR File          │
                 │ tomcat-demo.war      │
                 └──────────┬───────────┘
                            │
                            │ SCP
                            ▼
                 ┌──────────────────────┐
                 │      AWS EC2         │
                 │                      │
                 │ Amazon Linux 2023    │
                 │ Java 17              │
                 │ Apache Tomcat 10     │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │    Tomcat Manager    │
                 │                      │
                 │ /tomcat-demo         │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │   Web Application    │
                 │                      │
                 │  Browser :8080       │
                 └──────────────────────┘
🛠️ Technologies Used
Technology	Purpose
Java 17	Application development
Maven	Build and package management
Apache Tomcat 10.1.60	Java web application server
AWS EC2	Cloud server
Amazon Linux 2023	EC2 operating system
JSP	Web application page
WAR	Application deployment package
SSH	Remote EC2 access
SCP	Transfer WAR file to EC2
GitHub	Source code and project documentation
VS Code	Development environment
📂 Project Structure
tomcat-demo/
│
├── src/
│   └── main/
│       └── webapp/
│           └── index.jsp
│
├── Tomact Apaache Server/
│   ├── 01-ec2-instance.png
│   ├── 02-tomcat-server.png
│   ├── 03-tomcat-manager.png
│   ├── 04-application.png
│   └── 05-deployment-verification.png
│
├── pom.xml
├── .gitignore
└── README.md

Note: The screenshot folder name Tomact Apaache Server is retained as it exists in the original project.

☕ Java Environment

The application was developed using Java 17.

Check Java version:

java -version

Example:

openjdk version "17"
📦 Maven Project Creation

The Maven web application was created using the Maven Web Application Archetype.

mvn archetype:generate \
-DgroupId=com.sidhanta \
-DartifactId=tomcat-demo \
-DarchetypeArtifactId=maven-archetype-webapp \
-DinteractiveMode=false

The project uses:

Group ID     : com.sidhanta
Artifact ID  : tomcat-demo
Packaging    : WAR
⚙️ Maven Configuration

The project uses WAR packaging in pom.xml.

Important configuration:

<packaging>war</packaging>

The final WAR file name is:

<finalName>tomcat-demo</finalName>

Therefore Maven generates:

target/tomcat-demo.war
🌐 Web Application

The main application page is:

src/main/webapp/index.jsp

The page was customized to display:

Apache Tomcat server information
Server running status
Deployment status
Environment information
Deployment verification message

The application is designed as a simple demonstration page for the deployment.

🔨 Build the Application

From the project directory:

mvn clean package

Maven performs the following:

Clean previous build
        ↓
Compile project
        ↓
Package application
        ↓
Generate WAR file

The generated file is:

target/tomcat-demo.war
☁️ AWS EC2 Setup

An AWS EC2 instance was created for hosting the Tomcat server.

EC2 Configuration
Setting	Value
Instance Name	app-server
Instance Type	t3.micro
Operating System	Amazon Linux 2023
Region	Mumbai
Availability Zone	ap-south-1b
Java	Java 17
Tomcat	Apache Tomcat 10.1.60
Application Port	8080
🔐 Connecting to EC2

SSH was used to connect to the EC2 instance.

Example:

ssh -i app-key.pem ec2-user@<EC2-PUBLIC-IP>

The private key file was kept outside the GitHub project and was not uploaded to GitHub.

☕ Installing Java on EC2

Java was installed and verified on the EC2 server.

Check:

java -version

The server uses Java 17.

📦 Maven on EC2

Maven was also installed and verified on the EC2 server.

Check:

mvn -version
🐱 Apache Tomcat Installation

Apache Tomcat 10.1.60 was installed on the EC2 instance.

Tomcat installation directory:

/opt/tomcat

The Tomcat server runs on:

Port: 8080
▶️ Starting Tomcat

Tomcat can be started using:

sudo -u tomcat /opt/tomcat/bin/startup.sh

To stop Tomcat:

sudo -u tomcat /opt/tomcat/bin/shutdown.sh
📤 Uploading the WAR File

After building the project locally, the WAR file was transferred from Windows to EC2 using SCP.

Example:

scp -i ..\app-key.pem .\target\tomcat-demo.war ec2-user@<EC2-PUBLIC-IP>:/tmp/

The WAR file was initially uploaded to:

/tmp/
📥 Deploying the WAR File

The WAR file was copied into the Tomcat webapps directory:

sudo cp /tmp/tomcat-demo.war /opt/tomcat/webapps/

Tomcat automatically deploys the application from the webapps directory.

The deployed application directory becomes:

/opt/tomcat/webapps/tomcat-demo/
🔄 Restarting Tomcat

After deployment, Tomcat was restarted:

sudo -u tomcat /opt/tomcat/bin/shutdown.sh
sudo -u tomcat /opt/tomcat/bin/startup.sh
🔍 Deployment Verification

The deployed application was verified using:

sudo ls -l /opt/tomcat/webapps/

The directory contained:

tomcat-demo
tomcat-demo.war

This confirmed that the WAR file had been deployed successfully.

🖥️ Tomcat Manager

Tomcat Manager was used to verify the deployed application.

The application appeared as:

/tomcat-demo

with:

Running: true

Tomcat Manager provides controls such as:

Start
Stop
Reload
Undeploy
🌍 Application URL

The deployed application can be accessed using:

http://<EC2-PUBLIC-IP>:8080/tomcat-demo/

Example format:

http://13.201.74.176:8080/tomcat-demo/

The EC2 public IP can change if the instance is stopped and started unless an Elastic IP is configured.

📸 Screenshots
1. AWS EC2 Instance

The EC2 instance used for the Tomcat server.

2. Tomcat Server

Tomcat running on the AWS EC2 server.

3. Tomcat Manager

The deployed tomcat-demo application is visible in Tomcat Manager with the application running.

4. Deployed Application

The Java web application successfully running through Apache Tomcat.

5. Deployment Verification

Additional deployment verification from the project.

🔄 Complete Deployment Workflow

The complete process followed in this project was:

1. Create Java Web Application
             ↓
2. Configure Maven
             ↓
3. Create JSP Application
             ↓
4. Build using Maven
             ↓
5. Generate WAR file
             ↓
6. Create AWS EC2 instance
             ↓
7. Connect using SSH
             ↓
8. Install Java
             ↓
9. Install Maven
             ↓
10. Install Apache Tomcat
             ↓
11. Configure Tomcat
             ↓
12. Upload WAR using SCP
             ↓
13. Copy WAR into Tomcat webapps
             ↓
14. Restart Tomcat
             ↓
15. Verify using Tomcat Manager
             ↓
16. Access application through browser
🧪 Useful Commands
Maven
mvn clean
mvn package
mvn clean package
mvn -version
Java
java -version
Tomcat

Start:

sudo -u tomcat /opt/tomcat/bin/startup.sh

Stop:

sudo -u tomcat /opt/tomcat/bin/shutdown.sh

Check deployed applications:

sudo ls -l /opt/tomcat/webapps/
Linux

Check running processes:

ps aux | grep tomcat

Check port 8080:

sudo ss -lntp | grep 8080
🔐 Security Notes

The following files and credentials should never be committed to GitHub:

*.pem
passwords
private keys
AWS access keys
secret credentials

The EC2 private key used for SSH was kept outside this project.

For a real production deployment:

Restrict port 8080 using AWS Security Groups.
Do not expose Tomcat Manager publicly.
Use strong credentials.
Prefer HTTPS.
Use an Elastic IP or DNS name where appropriate.
Use a reverse proxy such as Nginx or an AWS load balancer.
Store secrets securely instead of putting them in source code.
🎯 What I Learned

Through this project, I learned the basic end-to-end deployment workflow for a Java web application.

Java & Maven
Creating a Maven web application
Understanding pom.xml
WAR packaging
Maven build lifecycle
Generating a deployable WAR file
Linux
Connecting to a Linux server using SSH
Navigating the Linux filesystem
Managing application files
Checking processes and ports
Apache Tomcat
Installing Apache Tomcat
Starting and stopping Tomcat
Understanding the webapps directory
Deploying WAR files
Using Tomcat Manager
Verifying application deployment
AWS
Creating an EC2 instance
Connecting to EC2
Configuring security groups
Hosting an application on a cloud server
Accessing an application through a public IP
DevOps

This project helped me understand the basic deployment pipeline:

Code
 ↓
Build
 ↓
Package
 ↓
Transfer
 ↓
Deploy
 ↓
Verify
🚀 Future Improvements

Possible improvements for this project include:

GitHub Actions CI/CD
Jenkins CI/CD pipeline
Docker containerization
AWS ECR
AWS ECS
Nginx reverse proxy
HTTPS with SSL/TLS
Domain name configuration
Infrastructure as Code using Terraform
Automated deployment
Monitoring and logging
👨‍💻 Author

Sidhanta Sahoo

B.Tech – Electronics & Communication Engineering

Interested in:

Java
Spring Boot
Backend Development
DevOps
AWS
CI/CD
Docker
Jenkins
⭐ Project Purpose

This project was created as a hands-on learning exercise to understand how a Java web application can be built, packaged and deployed on a cloud-based Linux server using Apache Tomcat.

The project demonstrates the complete journey from:

Local Development
        ↓
Maven Build
        ↓
WAR Package
        ↓
AWS EC2
        ↓
Apache Tomcat
        ↓
Live Web Application
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e98d095b-6504-48a4-a575-0343590a852f" />
