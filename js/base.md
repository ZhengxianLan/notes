- 为Object定义动态key
  ```javascript
    var dynamic_key='vla';
    var val = '你的名字';
    var o = Object.assign({},{ [dynamic_key]: val });
    // o => Object {vla: "你的名字"}
  ```

- `1<2<3` => `true < 3`  => `1 < 3` => true
  `3>2>1` => `false > 1` => `0 > 1` => false

- array.slice(start,end); // end is exclude
  if end < 0; would be array.length - |end|
  if array.length - end < 0; would return [];

- 变量提升
  编译js时，会把变量还有function表达式都提升到顶部
  但是，赋值操作会留在原来的行内。
  ```
  console.log(typeof aaa); // function
  aaa();                   // log in aaa
  console.log(typeof bbb); // undefined , 赋值操作，其func不会呗提升
  function aaa(){  // 函数表达式被提升
    console.log('log in aaa')
  }
 var bbb = function (){ }
  // function
  // aaa

  ```
