# 101-profiling-microservices
101 Profiling for Microservices, is a web presentation about how to use Java Profiler tools with Microservices.

**How to run the presentation in local?**

```
git clone https://github.com/jabrena/101-profiling-microservices
cd docs
python -m SimpleHTTPServer
```

**How to run the example application**

Build the application with:

```bash
$ gradlew build
```

Create a docker image

```bash
$ docker build . -t profiling
```

Run the image

```bash
$ docker run -p 8080:8080 --p 9010:9010 -p 5005:5005 profiling
```

Execute the demo

```bash
$ curl http://localhost:8080/demo
```

**How to run the example application**

Now you could run jconsole or VisualVM with ```localhost:9010```
