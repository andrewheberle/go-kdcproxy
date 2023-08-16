# go-kdcproxy

This is a Go based KDC Proxy designed for use against Active Directory.

# Usage

## Command Line

```sh
./go-kdcproxy --listen :8080
```

## Docker

```sh
docker run -p 8080:8080 ghcr.io/andrewheberle/go-kdcproxy
```

To run via HTTPS:

```sh
docker run -p 8443:8080 \
    -e KDC_PROXY_CERT=/ssl/server.crt \
    -e KDC_PROXY_KEY=/ssl/server.key \
    -v /path/to/certificates:/ssl:ro \
    ghcr.io/andrewheberle/go-kdcproxy
```

# Configuration

The application supports the following options:


| Command Line Option | Environment Variable | Default | Usage |
|-|-|-|-|
| --listen | KDC_PROXY_LISTEN | 127.0.0.1:8080[^1] | Service listen address |
| --cert | KDC_PROXY_CERT | | TLS Certificate |
| --key | KDC_PROXY_KEY | | TLS KEY |
| --debug | KDC_PROXY_DEBUG | false | Enable debug logging |

[^1]: The default for the container is ":8080"

# Specifications

This service follows the MS-KKDCP specification that is published here:

https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-kkdcp/5bcebb8d-b747-4ee5-9453-428aec1c5c38

# Credits

This was initially based on the KDC Proxy implementation here:

https://github.com/bolkedebruin/rdpgw

In addition a lot of the logic for the service to make things work came from:

https://github.com/latchset/kdcproxy
