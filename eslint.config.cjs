const { defineConfig } = require('eslint/config');
const universe = require('eslint-config-universe/flat/native');
const universeWeb = require('eslint-config-universe/flat/web');

module.exports = defineConfig([
  { ignores: ['build'] },
  ...universe,
  ...universeWeb,
  // eslint-plugin-react 7.37.5 is not ESLint 10-ready. Pinning the React
  // version skips detectReactVersion(), which still calls context.getFilename().
  { settings: { react: { version: '19.2' } } },
]);
