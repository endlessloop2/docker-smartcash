# SmartCash wallet for docker

Docker image that runs the SmartCash daemon which can be turned into a SmartNode with the correct configuration.

If you like this image, buy me a coffee ;) SgQkCPuZbHpqMkiccGCxHhwbA7YFKGpP6Y

## Quick Start

```bash
docker run \
  -d \
  -v /some/directory:/smartcash \
  -p 9678:9678 \
  --name=smartcash \
  guggero/smartcash
```

This will create the folder `.smartcash` in `/some/directory` with a bare `smartcash.conf`.
You might want to edit the `smartcash.conf` before running the container because with the bare config file it doesn't do much, it's basically just an empty wallet.

## Run QT GUI
```bash
docker run \
  -ti \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /some/directory:/smartcash \
  guggero/smartcash /opt/smartcash/bin/smartcash-qt
```

## Start as SmartNode

In general, you should follow a tutorial on how to prepare your SmartNode (create private key, send SMART and so on).
I suggest [this tutorial](https://forum.smartcash.cc/t/smartcash-smartnode-setup-guide/2320).

To start the SmartNode functionality, edit your smartcash.conf (should be in /some/directory/.smartcash/ following the docker run command example above):

```
rpcuser=<SOME LONG RANDOM USER NAME>
rpcpassword=<SOME LONG RANDOM PASSWORD>
rpcallowip=::/0
server=1
logtimestamps=1
maxconnections=256
printtoconsole=1
masternode=1
masternodeaddr=<SERVER IP ADDRESS>:9678
masternodeprivkey=<SMARTNODE PRIVATE KEY>
```

Where `<SERVER IP ADDRESS>` is the public facing IPv4 or IPv6 address that the masternode will be reachable at.
Don't forget to put your IPv6 address in brackets! For example `[aaaa:bbbb:cccc::0]:9678`

`<SMARTNODE PRIVATE KEY>` is the private key that you generated earlier (with `smartcash-cli smartnode genkey`).
