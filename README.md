# http_server
A dead simple Ruby web server.
Serves on port 80.
/healthcheck path returns "OK"
All other paths return "Well, hello there!"

`$ ruby webserver.rb`


## Deploy on kubernetes
```
helm upgrade -i --create-namespace --namespace http-server http-server helm-chart/
```

## Architecture on kubernetes
The application runs on a `deployment` called http-server.

This deployment runs the applciation with the following restrictions:
* Application runs by user 1000 (non-root).
* Application has readiness and liveness probes pointing to `/healthcheck` endpoint.
