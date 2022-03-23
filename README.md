# Panther-clinic

## Requirements

-	Handle their expected peak load with 30.000 concurrent users with a response time of 200ms for 98% of the requests.
> Auto-scale cluster of K8s
> Load-testing

-	Allow for the deployment of new versions of the application every 2-5 minutes without disrupting the users during peak load.
> Pipelines

-	Handle single data centre and single region failures without disrupting the users during peak load.
> Replication

-	Be able to create multiple test environments which are identical to the production environment within 5-10 minutes.


-	Migrate their application to another Cloud Provider without downtime, to avoid vendo lock-in.
> Kubernetes

## Architecture
</br>
The  cluster will be based on Kubernetes (K8s) and will work with the K8s service from Azure AKS.
Two environments will be created, one for dev and another for production , each with its container registry.
Azure Pipelines (CI/ CD) will be used to ensure features are being added without application downtime.
</br>
User requests will be going through a DNS first and then a load balancer which will distribute requests to relevant pods. Additionally, the load balancer will be able to redirect users to failover cluster in another region in case of disaster to ensure no or little downtime.
To cope with the demand, the K8s cluster will use auto-scaling to grow or shrink accordingly. 
Finally, monitoring and an azure directory will be provided for login and monitoring of resources.
</br>

## AKS (Azure Kubernetes Service)

Azure Kubernetes Cluster is the managed service for K8s. 
AKS Limitations: 

| Clusters per sub | Nodes per cluster |
|------------------|-------------------|
| Max 5,000 | Max 1,0000 | 


To test we will be using load-testing (e.g. locust) to simulate users.
The auto-scaler will then be put in place so that we reduce costs as much as possible and only have the right amount of nodes at the right time.
This set amount will be useful to design the network and sub-network and providing the IP addresses

## CI/CD Pipeline

Having users interact with the app whist adding features will be made possible using Azure Pipelines.
To use this service two things are necessary:
-	Version control too (GitHub/ GitLab)
-	An organisation in AzureDevOps
If using public repos Azure Pipeline is free of charge.


## Replication

We will use two Azure zones for replication of:

* Data
    * Zone-redundant storage (ZRS): copies your data synchronously across three Azure availability zones in the primary region

* AKS cluster
    * Azure Traffic Manager to route traffic




## Networking
## Cost
## Login/ monitoring (optional)


