---
layout: post
title: "Connect to DO Database Cluster from DBeaver and Knex"
date: 2020-05-14 00:00:00 -0600
categories: web development webdev node postgresql databases
---

## DBeaver

Once in your database view on Digital Ocean, go to Overview tab and select Connection details.
Download the ca-certificate.crt.
Go to DBeaver and select "New Database Connection / PostgreSQL"
On Main tab set Host, Port, Database, User, Password copying it from the Connection parameters set in Digital Ocean.
On SSL tab select "Use SSL" and set as Root certificate the downloaded cert.
Ready to go!

## Knex

Once in your database view on Digital Ocean, go to Overview tab and select Connection details.
Select Connection string tab and choose between public/private network.
Then just copy the connection string and save it as DATABASE_URL in the `.env` file of your project.
Once, the previous steps are complete, set the `knexfile.js` to be like:

```javascript
export default {
  development: {
    client: "pg",
    connection: "postgresql://postgres@localhost/your-db",
  },

  production: {
    client: "pg",
    connection: `${process.env.DATABASE_URL}&ssl=true`,
  },
};
```

- The last part of `production.connection` is quite important, if that flag is not set you will have an SSL error.
