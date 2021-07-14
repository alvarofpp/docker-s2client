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

## Display graphics (Linux)

If you want to display graphics during the script execution, you can follow the steps below: 

### Step 1

```shell
docker run -i -t -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro alvarofpp/s2client:<version>
```

Description:
- `-i`: sets up an interactive session;
- `-t`: allocates a pseudo tty;
- `-e`: sets the host display to the local machines display (which will usually be `:0`);
- `-v`: bind mounts the `X11` socket residing in `/tmp/.X11-unix` on your local machine into `/tmp/.X11-unix` in the container and `:ro` makes the socket read only.

### Step 2

In your local machine:

```shell
xhost +
# access control disabled, clients can connect from any host

xhost
# access control disabled, clients can connect from any host
# SI:localuser:username
```

Save the last line of the `xhost` result (in this example it's `SI:localuser:username`) for use in the next step.

### Step 3

In your docker container:

```shell
xhost +si:localuser:username
# localuser:username being added to access control list
```

Done! After that, you can run your script.

Reference [here](https://stackoverflow.com/questions/25281992/alternatives-to-ssh-x11-forwarding-for-docker-containers).

## Contributing

Contributions are more than welcome. Fork, improve and make a pull request. For bugs, ideas for improvement or other, please create an [issue](https://github.com/alvarofpp/docker-s2client/issues).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
If you use this docker image, you also agree to [AI and Machine Learning License](http://blzdistsc2-a.akamaihd.net/AI_AND_MACHINE_LEARNING_LICENSE.html).
