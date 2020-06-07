# wor.io server

> a RealWorld, fully functioning service server built on **prisma / typescript / express

run docker compose

`docker-compose up -d`
> if productioon `sudo docker-compose -f docker-compose-production.yml up -d`

## provide credential files
> at `/credentials`, you need `firebase-adminsdk.json` of your own.

install prisma cli
`yarn install -g prisma`

prisma generate
`prisma generate`

prisma deploy
`prisma deploy`


run server
`yarn run dev`

deploy server production
`pm2 start ecosystem.config.js`


### seed
`ts-note src/seed/index/ts`

## create mongo db index manually
- News.time -> must create index for better performance


### environments

- prisma1 
- mongodb
- express
- graphql





### dependency

- [inked-engine](https://github.com/softmarshmallow/inked-engine)
