- `li {display:inline-block}` 会有间隙，可以通过 `ul {font-size:0}` 来消除，然后在 `li{ font-size: 16px;}` 设置
  方法二：消除HTML内li之间的非可见字符，即不存在`换行,空格，tab`,把所有li连起来： <li></li><li></li>
  方法三：li元素之间使用注释
      ```
      <li></li><!--
      --><li></li>
      ```
  方法三：使用float
- position,设置 `{top:0;,left:0}` 之后。如果想重新设置元素位置，比如 bottom:0;right:0,则需先重写 `{top:auto;left:auto;}`

- 通过设置 parent{ display: table; } child { display: table-cell; } ,可以使得子元素保持一样的 height
  在 h5中，有 column: column-width column-count; 可以非常容易得到这样的效果

- emmit: `ul>li{content $@}*12` ,会得到内容有序号的12 个li
- selector:
  div ~ p { 在div之后的同级p元素都被选中，即使和div不相邻 }
  div p { 所有后代p都被选中  }
  div * p { div的直接子元素之下的p元素被选中，也称为孙子选择器  }
  div > p { div的直接子元素p被选中 }
  div + p { div的直接相邻元素被选中 }

- nth-child : only matches based on index of child elements and doesn't take the type of element into account.
  用白话说，就是 nth-child 不考虑子元素的类型，只是考虑子元素的索引顺序
  如果要按照子元素类型来分类进行索引，那么使用 nth-of-type
  nth-of-type: 更灵活
  nth-last-child
  nth-last-type

  nth-child( expression  )
  expression:
    - even/odd
    - number
    - an + b
      - an: 3n 没三个选择一个: 3-6,9,12
      - -n + b: => `nth-child(-n+4)` 选择前四个
      - n + b: => `nth-child(n+5)` 从第五个开始，包括第五个，到后面的元素
      - an + b: => 把元素没 a 个分为一组，然后匹配组内的第 b 个
        - 如果 b ＝ 0；那么选取组内的第 a 个 ［这其实是❌的 ］
