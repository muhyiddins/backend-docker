# backend-docker
Template Docker Template NodeJS with PM2

## Usage

Build
```bash
docker buildx build --platform=linux/amd64 --push -t muhyiddin/backend-docker .
```

Run
```bash
docker run -d -p 3301:3301 --name backend-docker muhyiddin/backend-docker
```

Execute
```bash
 docker exec -u0 -it backend-docker zsh 
```

## Enjoy...


