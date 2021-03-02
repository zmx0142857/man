https://www.typescriptlang.org/docs/handbook/gulp.html

## init

    $ mkdir proj
    $ cd proj
    $ mkdir src dist
    $ npm init

use entry point ./dist/main.js

    $ npm install -g gulp-cli
    $ npm install -D typescript gulp@4.0.0 gulp-typescript

## code

`src/main.ts`

```typescript
function hello(compiler: string) {
  console.log(`Hello from ${compiler}`);
}
hello("TypeScript");
```

`tsconfig.json`
```json
{
  "files": ["src/main.ts"],
  "compilerOptions": {
    "noImplicitAny": true,
    "target": "es5"
  }
}
```

`gulpfile.js`
```javascript
var gulp = require("gulp");
var ts = require("gulp-typescript");
var tsProject = ts.createProject("tsconfig.json");
gulp.task("default", function () {
  return tsProject.src().pipe(tsProject()).js.pipe(gulp.dest("dist"));
});
```

## run

    $ gulp
    $ node dist/main.js
