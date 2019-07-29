#!/bin/sh
kops create secret --name ${KOPS_CLUSTER_NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub &&
kops update cluster --name ${KOPS_CLUSTER_NAME} --yes &&
kops validate cluster &&
kops get cluster --name ${KOPS_CLUSTER_NAME} &&
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml &&
kops get secrets kube --type secret -oplaintext &&
kubectl cluster-info &&
kubectl proxy &&
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
kops get secrets admin --type secret -oplaintext &&
cd ./app &&
docker build . -t egordoronin/webservice0001:v1 &&
docker push egordoronin/webservice0001:v1 &&
docker run -p 49160:8080 egordoronin/webservice001:v1 &&

kubectl apply -f ./k8setup/deploy.yml &&
curl -X GET http://ad4358ab6adf011e992f20e1a2cd1be6-51645317.us-east-1.elb.amazonaws.com:80/ping &&
echo "Deployment finished"