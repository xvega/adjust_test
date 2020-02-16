# Adjust Test

# Dependencies: 
[docker](https://docs.docker.com/docker-for-mac/install/) - Docker is a full development platform to build, run, and share containerized applications.

## How to run the app?

You only have to run this single command

```sh
$ docker-compose run app
```
Then open the following URL in your browser `0.0.0.0:3000`

## How to run the test suite?

```sh
$ docker-compose run app bundle exec rspec spec/
```
