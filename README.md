# Die Große Transformation
* static version of https://github.com/acdh-oeaw/gtrans
* data is fetched from https://github.com/acdh-oeaw/gtrans-data
* build with [DSE-Static-Cookiecutter](https://github.com/acdh-oeaw/dse-static-cookiecutter)


## initial (one time) setup

* run `./shellscripts/dl_saxon.sh`
* run `./fetch_data.sh`
* run `ant`


## start dev server

* `cd html/`
* `python -m http.server`
* go to [http://0.0.0.0:8000/](http://0.0.0.0:8000/)

## publish as GitHub Page

* got to https://https://github.com/acdh-oeaw/gtrans-static/workflows/build.yml 
* click the `Run workflow` button

