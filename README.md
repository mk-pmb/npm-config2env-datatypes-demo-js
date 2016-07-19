
npm-config2env-datatypes-demo
=============================
When your npm script gets `npm-config` data via environment variables,
how are certain data types and key names converted?

Let's test it! The script in this package just dumps the relevant parts of
its environment, for input see [package.json](package.json).

```text
$ node-version
Node.js v5.7.1, npm v3.6.0, Ubuntu 14.04.4 LTS trusty
$ npm start
                       …0 = str "zero"
                     …123 = str "positive"
            …MiXedCaseKey = str "I'm a MiXedCaseKey!"
                       …_ = str "nbsp"
                    …_123 = str "negative"
                   …arr_0 = str "2"
                   …arr_1 = str "5"
                 …arr_2_0 = str "sub"
                 …arr_2_1 = str "array"
                   …arr_3 = str "9"
               …conflict_ = str "plus wins! (this time)"
                   …false = str "false"
                   …float = str "-3.1415"
                     …int = str "-123"
      …key__w__brackets__ = str ""
     …key_h_backslashes__ = str ""
         …key_w__dashes__ = str ""
        …key_w__dollars__ = str ""
           …key_w__dots__ = str ""
        …key_w__slashes__ = str ""
         …key_w__spaces__ = str ""
    …key_w__underscores__ = str ""
            …mixedcasekey = str "doesn't conflict with MiXedCaseKey"
                    …null = str "null"
                 …obj_cat = str "meow"
                 …obj_dog = str "woof"
                     …str = str "supported"
                    …true = str "true"
```



License
-------
ISC
