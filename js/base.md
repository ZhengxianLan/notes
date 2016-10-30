- 为Object定义动态key
  ```javascript
    var dynamic_key='vla';
    var val = '你的名字';
    var o = Object.assign({},{ [dynamic_key]: val });
    // o => Object {vla: "你的名字"}
  ```

- `1<2<3` => `true < 3`  => `1 < 3` => true
  `3>2>1` => `false > 1` => `0 > 1` => false
