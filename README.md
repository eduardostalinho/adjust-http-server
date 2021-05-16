# http_server
A dead simple Ruby web server.
Serves on port 80.
/healthcheck path returns "OK"
All other paths return "Well, hello there!"

`$ ruby webserver.rb`


## Deploy on kubernetes

To deploy the application to your kubernetes cluster, please use:
```
helm upgrade -i --create-namespace --namespace http-server http-server helm-chart/
```

## Accessing the application from outside the cluster
```
kubectl port-forward -n http-server service/http-server 8080:8080
```

Point your browser to `localhost:8080`.

## Architecture on kubernetes
The application runs on a `deployment` called http-server.

This deployment runs the applciation with the following restrictions:
* Application runs by user 1000 (non-root).
* Application has readiness and liveness probes pointing to `/healthcheck` endpoint.
