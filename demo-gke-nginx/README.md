# Nginx in K8S

## Build nginx docker

```
$ cd nginx
$ docker build -t gcr.io/mygcpproject/nginx-test .
```
If you want to deploy to remote (GKE or your remote server), you need to push to a registry that your server can access. Here, we push to gcr.io...

```
gcloud docker push gcr.io/mygcpproject/nginx-test
```

## Pod file

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: proxy
spec:
  containers:
    - name: nginx
      image: gcr.io/mygcpproject/nginx-test
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
kubectl describe pod nginx
```

## Clear deployment

```
kubectl delete svc nginx 
kubectl delete -f pods.yaml
```

## Note

In docker, not easy to get remote ip... There are some discuss here, for your reference:
* https://github.com/jwilder/nginx-proxy/issues/130
* https://github.com/docker/docker/issues/15086

Suggest to test in linux system (don't do it in Mac or Win).
