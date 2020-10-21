export default {
  mode: 'universal',
  /*
   ** Headers of the page
   */
  head: {
    title: process.env.npm_package_name || '',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: process.env.npm_package_description || ''
      }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },
  /*
   ** Global CSS
   */
  css: [],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: [],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [
    '@nuxt/typescript-build',
    // Doc: https://github.com/nuxt-community/stylelint-module
    '@nuxtjs/stylelint-module'
  ],
  /*
   ** Nuxt.js modules
   */
  modules: [
    '@nuxtjs/apollo',
    '@nuxtjs/proxy',
    '@nuxtjs/vuetify'
  ],
  apollo: {
    clientConfigs: {
      default: {
        httpEndpoint: 'http://localhost:8000/graphql'
      }
    }
  },
  proxy: {
    '/graphql': 'http://backend:3000'
  },
  server: {
    port: 8000,
    host: '0.0.0.0'
  },
  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend() {}
  }
}
