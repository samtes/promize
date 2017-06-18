[![Build Status](https://travis-ci.org/samtes/promize.svg?branch=master)](https://travis-ci.org/samtes/promize)
# Promize
This is a promises sequence runner. It will e used to run multiple promise based functions in sequence. 

## Usage
### Installation
```javascript
npm install --save promize
```

### Usage
`promize` takes two arguments. 

1. `array` of `promises`
2. [`options`](#Options) to cunstomise response

```javascript
const promize = require('promize');

const foo = () => {
  return Promise((resolve, reject) => {
    setTimeout((){
      resolve('hello');
    }, 3000)
  });
};
const bar = () => {
  return Promise((resolve, reject) => {
    setTimeout((){
      reject(new Error('My heart broke'));
    }, 5000)
  });
};
const zoo = () => {
  return Promise((resolve, reject) => {
    setTimeout((){
      resolve('adios');
    }, 2000)
  });
};

// throws the first error rejected
// same as passing { errors: true } as the second argument
return promize([foo, bar, zoo]).catch(err => {
  // err.message = 'My heart broke'
  // catches the first error
});

// collects all errors and resolves at the end with results
return promize([foo, bar, zoo], { error: false }).then(results => {
  // result will look like this
  [
    {
      name: foo,
      result: 'hello',
      error: null
    },
    {
      name: bar,
      result: null,
      error: Error('My heart broke')
    },
    {
      name: zoo,
      result: 'adios',
      error: null
    }
  ]
});
```
### Options
- `errors` takes `boolean` value:
  - `true`: throws the first instance of error (the default behavior)
  - `false`: collects all the errors and returns array of objects with `name`, `result` and `error`
