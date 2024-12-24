# Dev Workflow in the server
 ## Recomended Visual code extensions
 * prisma
 * docker
 * wsl
 * eslint
 * github actions

## .env configuration
You will need a .env file at the root of the /server folder with the following content:

```
DATABASE_URL="postgresql://admin:admin@localhost:5432/dice?schema=public"
```

 ## Prisma
 Every time a change is made to the db schema, you will need to run the following commands:
 * `npm run migrate`: This will update the bd with the latest changes
 * `npx prisma generate`: This will generate a new prisma client

Instead of using an external application for observing and interacting with the state of the db, I recommend using prisma studio. For that, run `npx prisma studio`. It will be deployed in `localhost:5555`.


## Getting the postgresdb container up
Go to the docker-compose folder and run `docker compose up -d`

## Starting the server
 For starting the server, run `npm run dev`

## Apollo sandbox
I would personally recommend using Postman directly, but if you want something more fancy you can try the [Apollo Sandbox](https://studio.apollographql.com/sandbox/explorer/?referrer=docs-content). You need to have the server running.


