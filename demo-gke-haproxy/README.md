# Haproxy in K8S

## Build haproxy docker

```
$ cd haproxy
$ docker build -t gcr.io/mygcpproject/haproxy-test .
```
If you want to deploy to remote (GKE or your remote server), you need to push to a registry that your server can access. Here, we push to gcr.io...

```
gcloud docker push gcr.io/mygcpproject/haproxy-test
```

## Pod file

```
apiVersion: v1
kind: Pod
metadata:
  name: haproxy
  labels:
    app: proxy
spec:
  containers:
    - name: haproxy
      image: gcr.io/mygcpproject/haproxy-test
      imagePullPolicy: Always
      ports:
        - containerPort: 80
```

Note: change the image path to your path.

## Create pod and expose service

```
kubectl create -f pods.yaml 
kubectl expose  -f pods.yaml --external-ip=10.140.0.7
```

Here 10.140.0.7 is your pod host ip address, you can use the following command to get your pod host ip...

```
kubectl describe pod haproxy
```

## Clear deployment

```
kubectl delete svc haproxy 
kubectl delete -f pods.yaml
```

Suggest to test in linux system (don't do it in Mac or Win).
