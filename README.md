# devcontainer-node

Node.js development container image for Agynio services.

## Image

`ghcr.io/agynio/devcontainer-node`

## Architectures

- `linux/amd64`
- `linux/arm64`

## Included tooling

| Tool | Version (default) | Notes |
| --- | --- | --- |
| Node.js | 20 (node:20-slim) | Base image |
| pnpm | 10.5.0 | Configurable via `PNPM_VERSION` build arg |
| buf | 1.45.0 | Multi-arch binary via `BUF_VERSION` |
| tsx | 4.20.5 | Configurable via `TSX_VERSION` build arg |
| git, curl, bash, openssh-client, openssl, inotify-tools | Debian slim packages | Installed via apt |

## Usage

Run an interactive shell:

```sh
docker run --rm -it ghcr.io/agynio/devcontainer-node:1 bash
```

Use as a devcontainer image:

```json
{
  "image": "ghcr.io/agynio/devcontainer-node:1"
}
```

## Versioning

- `main` publishes tags: `main`, `sha-<short>`
- Semver tags `vX.Y.Z` publish: `X.Y.Z`, `X.Y`, `X`
- Pin to a major version tag (e.g. `:1`) for automatic minor/patch updates

## Updating tool versions

1. Edit the `ARG` values in `Dockerfile`.
2. Commit to `main` and confirm the image is published.
3. Create a semver tag (e.g. `v1.1.0`) to publish stable tags.
