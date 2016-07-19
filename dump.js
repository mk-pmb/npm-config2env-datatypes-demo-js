/*jslint indent: 2, maxlen: 80, node: true */
/* -*- tab-width: 2 -*- */
'use strict';
var vn = Object.keys(process.env), pad = require('pad'),
  logCnt = 0, logMax = (+process.env.DEBUG_MAXLOG || Number.POSITIVE_INFINITY);
vn.sort();
vn.forEach(function (key) {
  if (logCnt > logMax) { return; }
  var val = process.env[key], m = key.match(/^npm_package_config_([\s\S]+)/);
  if (m) {
    console.log(pad(25, '…' + m[1]) + ' = ' + (typeof val).substr(0, 3)
      + ' ' + JSON.stringify(val));
    logCnt += 1;
  }
});
