# CSBC NodeJS Starter Developer Docs

## Configuration

1. Follow the configuration steps in the [api application](./apps/api/DEVELOPER.md)
2. Follow the configuration steps in the [web application](./apps/web/DEVELOPER.md)

## Development

Use docker to bootstrap the development environment.

```sh
docker compose \
    --env-file=./apps/api/.env \
    -f compose.yaml \
    up -d
```

Once complete, run the application.

```sh
# Run all apps at once
npm run dev

# Run apps independently
npm run dev -- --filter=api
npm run dev -- --filter=web
```

## Test Deployment

Test the production Dockerfiles using the following command.

```sh
docker compose 
    --env-file=./apps/api/.env 
    --env-file=./apps/web/.env 
    -f compose.yaml 
    -f compose.prod.yaml 
    up -d       
```

## Deploy

TBD

## Additional Documentation

For app-specific documentation, see the following files:
- [./apps/api/DEVELOPER.md](./apps/api/DEVELOPER.md)
- [./apps/web/DEVELOPER.md](./apps/web/DEVELOPER.md)

For package-specific documentation, see the following files:
- [./packages/ui/DEVELOPER.md](./packages/ui/DEVELOPER.md)