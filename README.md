# Ludic Historian

_A Game Historian's View of Ludic Ambient Heuristics_

## NPM Dev Dependencies

- [https://www.npmjs.com/package/autoprefixer](https://www.npmjs.com/package/autoprefixer)
- [https://www.npmjs.com/package/browser-sync](https://www.npmjs.com/package/browser-sync)
- [https://www.npmjs.com/package/copyfiles](https://www.npmjs.com/package/copyfiles)
- [https://www.npmjs.com/package/cssnano](https://www.npmjs.com/package/cssnano)
- [https://www.npmjs.com/package/npm-run-all](https://www.npmjs.com/package/npm-run-all)
- [https://www.npmjs.com/package/onchange](https://www.npmjs.com/package/onchange)
- [https://www.npmjs.com/package/postcss-cli](https://www.npmjs.com/package/onchange)
- [https://www.npmjs.com/package/sass](https://www.npmjs.com/package/sass)
- [https://www.npmjs.com/package/postcss-cli](https://www.npmjs.com/package/postcss-cli)
- - [https://www.npmjs.com/package/autoprefixer](https://www.npmjs.com/package/autoprefixer)
- - [https://www.npmjs.com/package/cssnano](https://www.npmjs.com/package/cssnano)
- [https://www.npmjs.com/package/stylelint](https://www.npmjs.com/package/stylelint)
- - [https://www.npmjs.com/package/stylelint-config-standard-scss](https://www.npmjs.com/package/stylelint-config-standard-scss)
- [https://www.npmjs.com/package/rimraf](https://www.npmjs.com/package/rimraf)

## NPM Scripts

- `start` is for the dev environment
- `build` is when you are ready for production

## Execution

- `npm start` copies all `src` files to `public` and starts the browser-sync server at [http://localhost:3000](http://localhost:3000).
- `npm run build` and `npm run postbuild` copies files to `public` and autoprefixes/minifies the CSS.

To run Stylelint on the SCSS:

- `npx stylelint "**/*.scss"`
