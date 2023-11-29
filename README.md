
### Azul Notes

Changes can be tested locally. You would need `make`, `curl`, Docker Desktop and 
[act](https://github.com/nektos/act). For example:

```
brew install act
act # the first invocation is to interactively configure `act`
make start_registry
make images
# scroll up in terminal output, note image name
# |   "image.name": "localhost:5000/docker.io/ucscgi/azul-elasticsearch:7.17.15-6"
docker pull localhost:5000/docker.io/ucscgi/azul-elasticsearch:7.17.15-6
# To examine the image for vulnerabilities, browse the image in Docker Desktop.
# If an unnecessary package is found to have critical or high vulnerabilities,
# add a `RUN` instruction to the Dockerfile to remove the package.
# To test the image in Azul, run:
cd ../azul; azul_docker_elasticsearch_version=7.17.15-6 azul_docker_registry=localhost:5000/ make test
make stop_registry
```
