
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
# To test the image in Azul, you will need to temporarily modify Azul's
# `environment.py` to set the appropriate `azul_docker_images` value using the
# full image name noted above (starting with "localhost").
cd ../azul
git diff
>   diff --git a/environment.py b/environment.py
>   index f888a1b8e..5970816ac 100644
>   --- a/environment.py
>   +++ b/environment.py
>   @@ -276,7 +276,7 @@ def env() -> Mapping[str, Optional[str]]:
>                    'ref': 'docker.io/ucscgi/azul-pycharm:2023.3.4-15'
>                },
>                'elasticsearch': {
>   -                'ref': 'docker.io/ucscgi/azul-elasticsearch:7.17.18-13'
>   +                'ref': 'localhost:5000/docker.io/ucscgi/azul-elasticsearch:7.17.18-13'
>                },
>                'bigquery_emulator': {
>                    'ref': 'ghcr.io/hannes-ucsc/bigquery-emulator:azul'
make image_manifests.json
azul_docker_registry="" make test
cd -
make stop_registry
```
