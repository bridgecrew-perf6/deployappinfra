# deployappinfra
The repo consists of necessary code for the provision of EKS cluster and deployment of docker containers to EKS cluster

## Instructions for execution
This assignment is divided into three sections

1. Containerizing the three microservices named front-end, newsfeed and quotes.
2. Infrastructure provisioning for EKS cluster
3. Deploying the containers on provisioned EKS infrastructure in the previous step

## 1. Containerization of micro-services

We are using Docker as runtime hence the 3 microservices front-end, newsfeed and quotes are now containerized with the help of dockerfiles. Please see containers folder for the reference.

Now We will build the docker images, tag these images for easy identification and push the built images for these micro services to DockerHub(a cloud repository) using the dockerfiles created above. We can pull these images from DockerHub for deployment in EKS cluster .

### Build docker images
```
docker build -f quotes.dockerfile -t quotes:1.0 .
docker build -f newsfeed.dockerfile -t newsfeed:1.0 .
docker build -f frontend.dockerfile -t frontend:1.0 .
```

### Tag the built docker images
```
docker tag quotes:1.0 vamsiyvs/quotes:latest
docker tag newsfeed:1.0 vamsiyvs/newsfeed:latest
docker tag frontend:1.0 vamsiyvs/frontend:latest
```

### Push the built images to DockerHub
```
docker push vamsiyvs/quotes:latest
docker push vamsiyvs/newsfeed:latest
docker push vamsiyvs/frontend:latest
```

## 2. Infrastructure provisioning

We will be using Kubernetes for our docker containers deployment. EKS or Elastic Kubernetes Service is a managed Kubernetes offering from AWS which can be used to deploy containers in cloud. Now we will go with provisioning the infrastructure using terraform.
```
terrraform init
terraform plan
terraform apply
```
Now as you can see the EKS cluster is up and running with 3 worker nodes and a control plane. We will get a cluster end point which we need to use for the frontend service.
Update the cluser ip address to STATIC_URL environment variable in **deployment-frontend.yaml** given as output variable *cluster_endpoint* from terraform apply.

### 3. Deploying the containers in provisioned EKS cluster 
