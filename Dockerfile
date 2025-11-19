AWS EC2 Lab Instance – Notes

What is an EC2 Instance?

AWS EC2 (Elastic Compute Cloud) provides virtual machines where we can
deploy servers, applications, databases, etc.

------------------------------------------------------------------------

Steps to Launch an EC2 Instance

1. Open AWS Console

-   Login to AWS Management Console.
-   Search for EC2.
-   Click on Launch Instance.

2. Configure the Instance

-   Name: Give your instance a suitable name.
-   AMI: Select Ubuntu (Amazon Machine Image).
-   Instance Type: Choose t3.micro (Free Tier).
-   Key Pair: Create new key pair → download the .pem file.

3. Network Settings

-   Enable HTTP
-   Enable HTTPS

4. Storage

-   Default storage: 8 GB (can increase to 10 GB Free Tier).

5. Launch Instance

-   Click Launch Instance.
-   Go to Instances.
-   Wait until:
    -   Instance State → running
    -   Status Checks → 2/2 passed

------------------------------------------------------------------------

Connect to EC2 Using SSH

1. Open SSH Client Instructions

-   Select instance → Connect → SSH Client tab.

2. Prepare Your Local Machine

-   Move .pem file into a folder.
-   Open CMD/PowerShell as Administrator.
-   Navigate using: cd path/to/folder

3. Run SSH Command

ssh -i “keyname.pem” ubuntu@ec2-xx-xx-xx-xx.compute-1.amazonaws.com

------------------------------------------------------------------------

Setup EC2 Environment

1. Update System

sudo apt update

2. Install Docker, Git, Nano

sudo apt-get install docker.io sudo apt install git sudo apt install
nano

------------------------------------------------------------------------

Deploy a Web Application

1. Create Folder & HTML File Locally

-   Example: myapp with index.html.

2. Push Code to GitHub

git init git add . git commit -m “first commit” git branch -M main git
remote add origin git push -u origin main

3. Clone Repo Inside EC2

git clone

------------------------------------------------------------------------

Create Dockerfile

nano Dockerfile

Content: FROM nginx:latest COPY . /usr/share/nginx/html

Save: Ctrl+O, Enter, Ctrl+X

------------------------------------------------------------------------

Build Docker Image

sudo docker build -t mywebapp .

Run Docker Container

sudo docker run -d -p 80:80 mywebapp

------------------------------------------------------------------------

Access the Application

Use Public IPv4: http://

------------------------------------------------------------------------

Stop Docker Container

sudo docker ps sudo docker stop

------------------------------------------------------------------------

Terminate EC2 Instance

Instance State → Terminate

-------------------------------------------------------------------------------------------------------------------------------

Kubernetes / Minikube Quick Commands Reference
1. Start Minikube
minikube start
2. Create a Deployment
kubectl create deployment --image=
Example: kubectl create deployment mynginx --image=nginx
3. Expose Deployment as a Service
kubectl expose deployment mynginx --type=NodePort --port=80 --target-port=80
4. Scale Deployment
kubectl scale deployment mynginx --replicas=4
5. Get Pods
kubectl get pods
6. Get Deployments
kubectl get deployments
7. Port Forward a Service
kubectl port-forward svc/mynginx 8081:80
8. Launch Minikube Dashboard
minikube dashboard
