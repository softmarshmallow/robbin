



## Prisma migrate

`npx prisma migrate save --name init --experimental`

`npx prisma migrate up --experimental`

`npx prisma generate`



**migration troubleshooting**

[troubleshoot](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-migrate#troubleshooting)

`rm -rf migrations`

`TRUNCATE _Migration;`



**studio (experimental)**

`npx prisma studio --experimental`


## set .env file on project root
```
PORT=3000
FIREBASE_DATABASE_URL=
```

## set credentials/ folder
required contents
- firebase-adminsdk.json.json

[learn more about firebase admin sdk](https://firebase.google.com/docs/admin/setup?authuser=0)


## RUN

`yarn run dev`
