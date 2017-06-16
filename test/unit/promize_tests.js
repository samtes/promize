'use strict';

const test = require('ava');

const promize = require('../../lib/promize');

test('promize.run -- runs promises that are passed', t => {
  t.is(promize.run(), 'Hello World!');
});
