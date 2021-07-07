# Docker for StarCraft II Client

This docker image was built to facilitate the development of scripted bots and research using the [s2client-proto](https://github.com/Blizzard/s2client-proto).

## Getting Started

These instructions will cover usage information and for the docker container.

### Prerequisities

In order to run this container you'll need docker installed.

- [Get Started](https://docs.docker.com/get-started/)

### Usage

Currently exist only one image (without tag):

```shell
docker run alvarofpp/s2client
```

#### Container Parameters

Run your client in a specific port:

```shell
docker run --env CLIENT_PORT=13000 alvarofpp/s2client
```

#### Environment Variables

- `CLIENT_PORT` - The port the client runs on. By default is `12000`.

#### Useful File Locations

Inside the `image` folder in this repository.

- `/maps.txt` - List of all downloaded maps for the image.

## Contributing

Contributions are more than welcome. Fork, improve and make a pull request. For bugs, ideas for improvement or other, please create an [issue](https://github.com/alvarofpp/docker-s2client/issues).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
