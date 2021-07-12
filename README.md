# Docker for StarCraft II Client

This docker image was built to facilitate the development of scripted bots and research using the [s2client-proto](https://github.com/Blizzard/s2client-proto).

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)](https://hub.docker.com/r/alvarofpp/s2client)

## Tags

This docker image have one tag for each one version listed in [Linux Packages](https://github.com/Blizzard/s2client-proto#linux-packages).
You can see all tags [here](https://hub.docker.com/r/alvarofpp/s2client/tags).

Example: if you want to take the version 4.9.3, you need to specify this version in the docker pull command: `docker pull alvarofpp/s2client:4.9.3`.

The `latest` is the same image of the `4.10`, because it's the latest version until this moment.
If you use the `latest` version, you can ignore the `:<version>` in these commands below.

## Getting Started

These instructions will cover usage information and for the docker container.

### Prerequisities

In order to run this container you'll need docker installed.

- [Get Started](https://docs.docker.com/get-started/)

### Usage

Docker pull command:

```shell
docker pull alvarofpp/s2client:<version>
```

And run the client:

```shell
docker run alvarofpp/s2client:<version>
```

Run your client in a specific port:

```shell
docker run --env CLIENT_PORT=13000 alvarofpp/s2client:<version>
```

#### Environment Variables

- `CLIENT_PORT` - The port the client runs on. By default is `12000`.

## Maps and minigames

This image already comes with the all maps listed in [Map Packs](http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season3_Updated.zip) and the [pysc2's minigames (version 1.2)](https://github.com/deepmind/pysc2/releases/tag/v1.2).
But if you need add more maps or minigames, you can through the command:

```shell
docker cp <map_folder> <container_id>:/root/StarCraftII/Maps/
```

All maps and minigames downloaded for the image are listed in `image/maps.txt`.

## Contributing

Contributions are more than welcome. Fork, improve and make a pull request. For bugs, ideas for improvement or other, please create an [issue](https://github.com/alvarofpp/docker-s2client/issues).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
If you use this docker image, you also agree to [AI and Machine Learning License](http://blzdistsc2-a.akamaihd.net/AI_AND_MACHINE_LEARNING_LICENSE.html).
