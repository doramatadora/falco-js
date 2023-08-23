# Fastly VCL language linter

[`falco`](https://github.com/ysugimoto/falco), repackaged for distribution with npm.

**JSON output only!**

## Architecture support

- darwin-amd64
- darwin-arm64
- linux-amd64

## Usage

### Installation
```sh
npm install falco-js
```

### In code

```js
import { lint, lintText } from 'falco-js'

lint('/Absolute/path/to/some.vcl')
  .then((jsonLintResults) => {
    const {
      Infos: suggestionCount,
      Warnings: warningCount,
      Errors: errorCount,
      LintErrors,
      ParseErrors,
      VCL
    } = jsonLintResults
    // ...
  })

lintText('my VCL code')
```

### CLI

```sh
falco-js -vv /path/to/file.vcl
falco-js -help
```

#### Pipeable (-slurp arg)

```sh
cat /path/to/file.vcl | falco-js -slurp
```
