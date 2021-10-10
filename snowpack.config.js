/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
  mount: {
    public: { url: '/', static: true },
    src: { url: '/dist' },
  },
  exclude: ["**/*.{res,resi}"],
  plugins: [
    '@snowpack/plugin-react-refresh',
    '@snowpack/plugin-dotenv',
    '@jihchi/plugin-rescript',
    'snowpack-plugin-relative-css-urls',
    '@snowpack/plugin-sass',
    '@snowpack/plugin-babel',
    '@snowpack/plugin-webpack',
  ],
  routes: [
    {
      match: 'routes',
      src: '.*',
      dest: '/index.html',
    },
  ],
  packageOptions: {
    /* ... */
  },
  devOptions: {
    open: 'none',
    hmr: false,
  },
  buildOptions: {
    /* ... */
  },
  alias: {
    /* ... */
  },
};
