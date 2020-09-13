# past_followers

> List past followers

## Build Setup

```bash
# install dependencies
$ yarn install

# serve with hot reload at localhost:8000
$ yarn dev

# build for production and launch server
$ yarn build
$ yarn start

# generate static project
$ yarn generate
```

For detailed explanation on how things work, check out [Nuxt.js docs](https://nuxtjs.org).

## Generate GraphQL schema file

When the GraphQL schema changes, `lib/GraphQL/generated.ts` must be update.
This feature uses the `@graphql-codegen/typescript package`.

```
yarn run graphql-codegen --config codegen.yml
```
