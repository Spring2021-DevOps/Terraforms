# Setup Google Kubernetes Engine
​
## Pre-requisite
You need to have a GCP account
​
## Authenticate using CLI
1. ```gcloud auth login```
2. If terraform gives credential errors, try to default login using following command
```gcloud auth application-default login```
3. Allow GCP to authenticate your account
​
​
## Steps
​
I. Create a new project
1. Login to Google Cloud Platform
2. Create a new project
3. Name it csye7720
​
II. Create service account 
1. Login to Google Cloud Platform
2. Select your project created in Step I 
3. Click on create a new service account under IAM 
3. Follow below steps:
​
    <ins>**Service account details**</ins>
    
    i. Give service account name
    
    ii. Click on create
​
​
    <ins>**Grant this service account access to project**</ins>
    
    Grant following roles to this service account
    ```
    Compute Admin
    Compute Network Admin
    Kubernetes Engine Cluster Admin
    Service Account Admin
    Service Account User
    ```
   <ins>**Click on Done**</ins>
   
III. Generate keys for service account
1. Select the service account you created in Step II
2. Go to Keys
3. Click on Add Key -> Create New Key -> JSON
4. Rename the downloaded JSON file to terraform-user.json
Note: This file is referred in the variables.tf file to create GKE cluster
​
IV. Clone the repository and place the key file in a secret folder
1. git clone git@github.com:Spring2021-DevOps/Terraforms.git
2. cd Terraforms/GCP
3. mkdir secrets
4. mv terraform-user.json Terraforms/GCP/secrets/
​
V. Create resources
1. cd Terraforms/GCP
2. terraform apply
Note: You might need to enable some API explicitely to use GCP
You can use following API to enable the services:
```gcloud services enable $service_name```
Following services need to enabled for the terraform to work
    ```
        cloudresourcemanager.googleapis.com
        servicenetworking.googleapis.com
        container.googleapis.com
        compute.googleapis.com
        iam.googleapis.com
        logging.googleapis.com
        monitoring.googleapis.com
        securetoken.googleapis.com
    ```
​
VI. Verify resources are created
1. Go to GCP
2. Select Google Kubernetes Engine
3. Verify that the cluster is created
​
