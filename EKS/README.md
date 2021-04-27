# Setup Elastic Kubernetes Service
​
#### Pre-requisite
You need to have AWS profile setup on your local machine
​
#### Steps
​
I. Create terraform resources
1. git clone git@github.com:Spring2021-DevOps/Terraforms.git
2. cd Terraforms/EKS
3. terraform apply
​
II. Update kubeconfig 
1. aws eks update-kubeconfig --name terraform-eks-demo --region us-east-1 --profile aws_profile
2. echo "export KUBECONFIG=${KUBECONFIG}" >> ${HOME}/.bash_profile
​
III. Join nodes to cluster
1. cd Terraforms/EKS
2. kubectl apply -f config_map_aws_auth.yaml
3. kubectl get nodes
4. Verify nodes are joining the cluster and are in ready state
