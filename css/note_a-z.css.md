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