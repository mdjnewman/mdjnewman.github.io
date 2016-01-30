---
title: Pedantic console for JavaScript tests
layout: post
---

When running JavaScript tests that fire up a browser, it can be useful to
ensure that `console.warn` and `console.error` aren't being called, and to have
your automated build fail if this starts happening.

If you're using a framework like Jasmine, you can place the following file in
your helpers directory to ensure that an exception will be thrown whenever a
call is made to `console.warn` or `console.error`:

```javascript
console.error = (function () {

  var originalConsole = console.error;

  function myError () {
    originalConsole.apply( this, arguments );
    throw Error('console.error called, failing test');
  }

  return myError;
})();


console.warn = (function () {

  var originalConsole = console.warn;

  function myError () {
    originalConsole.apply( this, arguments );
    throw Error('console.warn called, failing test');
  }

  return myError;
})();
```

I recently used this to locate all the places that [a deprecated Moment.js
feature](https://github.com/moment/moment/issues/1407) was being used in a
codebase.
