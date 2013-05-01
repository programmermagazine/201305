## JavaScript (5) – 在互動網頁中的應用，以 HTML 編輯器為例 (作者：陳鍾誠)

在本文當中，我們將透過 JavaScript 設計一個 HTML 編輯器，讓您可以直接在瀏覽器當中看到 HTML 網頁的呈現結果，
筆者認為這個範例對學習動態網頁設計是一個非常簡單、卻又很有啟發性的程式。因為他很明顯的展現了動態網頁的原理。

### HTML 編輯器

以下是該 HTML 編輯器的執行結果，當我們在 CSS 與 HTML 區塊輸入對應的原始碼之後，就可以按下「→」按鈕，然後在
呈現的 `<div id="showbox" ...</div>` 區塊看到兩者搭配時的呈現結果。

![HTML 編輯器的執行畫面](../img/HtmlEditorRun.jpg)

您也可以點選下列連結以實際檢視該網頁：

* HTML 編輯器：<https://dl.dropboxusercontent.com/u/101584453/pmag/201305/code/HtmlEditor.htm>

以下是這個網頁的原始 HTML 程式碼，其中有兩大段是我們預設填入的 CSS 與 HTML 原始碼，這兩段原則上可以去掉，但是
為了測試方便起見，我們就留在檔案中，請讀者閱讀的時候仔細區分之。

```html
<html>
<style>
textarea, #showbox { border: 1px solid #9f9f9f; }
</style>
<style id="showboxstyle">
</style>
<script type="text/javascript">
function convert() {
  var cssbox  = document.getElementById("cssbox");
  var editbox = document.getElementById("editbox");
  var showbox = document.getElementById("showbox");
  var showboxstyle = document.getElementById("showboxstyle");
  showbox.innerHTML = editbox.value;
  showboxstyle.innerHTML = cssbox.value;
}
</script>	
<body>
<form>
<table width="95%" style="border-collapse: collapse; border: 0px;"><tr>
<tr><td colspan="2" style="text-align:center">HTML 原始碼　　<input type="button" value=" → " onclick="JavaScript:convert()"/>　　　顯示結果</td></tr>
<td width="50%">
<textarea id="cssbox" style="width:100%; height:100px;" >
<!-- 預設貼入的CSS：開始 -->
td, th { padding:10px; }
th { background-color:black; color:white; }
table { border-collapse: collapse; border: 1px solid #373737; }
<!---預設貼入的CSS：結束 -->
</textarea>
<textarea id="editbox" style="width:100%; height:400px;">
<!-- 預設貼入的HTML：開始 -->
Hello! <a href="http://tw.yahoo.com">Yahoo</a><br/></br>
<table>
<tr><th></th><th>欄 1</th><th>欄 2</th></tr>
<tr><th>列 1</th><td>1,1</td><td>1,2</td></tr>
<tr><th>列 2</th><td>2,1</td><td>2,2</td></tr>
</table><br/>
<form action="signup" method="post">
帳號: <input type="text" name="user"/><br/>
密碼: <input type="password" name="password"/><br/>
信箱: <input type="email" name="email"/><br/>
生日: <input type="date" name="birthday"/><br/>
照片: <input type="file" name="picture"/><br/>
性別: <input type="radio" name="sex" value="male" checked/> 男
      <input type="radio" name="sex" value="female"/> 女<br/>
血型: <select name="BloodType">
        <option value="A">A 型</option>
        <option value="B">B 型</option>
        <option value="AB">AB 型</option>
        <option value="O">O 型</option>
      </select> <br/>
自我介紹： <br/>
<input type="submit" value="送出"/><input type="reset" value="清除"/><br/>
</form>
<!-- 預設貼入的HTML：結束 -->
</textarea> 
</td>
<td>
<div id="showbox" style="width:100%; height:500px;">
</div>
</td>
</tr></table>
</form>
</body>
</html>

```

### 程式解析

上述程式當中有三個主要的區塊，分別是：

1. CSS 填入區塊： `<textarea id="cssbox" ...</textarea>`
2. HTML 填入區塊：`<textarea id="editbox" ...</textarea>` 
3. HTML 顯示區塊：`<div id="showbox" ... </div>`

此網頁的核心程式部分真的很簡單，只有如下短短的一小段：

1. 利用 `var editbox = document.getElementById("editbox");` 取得 HTML 區塊內容
2. 利用 `showbox.innerHTML = editbox.value;` 這個指令將該 HTML 原始碼填入 showbox 當中

這樣就完成顯示 HTML 的動作了。

```javascript
function convert() {
  var cssbox  = document.getElementById("cssbox");
  var editbox = document.getElementById("editbox");
  var showbox = document.getElementById("showbox");
  var showboxstyle = document.getElementById("showboxstyle");
  showbox.innerHTML = editbox.value;
  showboxstyle.innerHTML = cssbox.value;
}
```

但是這樣作並沒有加入 cssbox 的內容到 HTML 當中，因此我們加入了下列原始碼：

1. 在整個網頁的頭部事先用 `<style id="showboxstyle">...</style>` 這個標記加入一個 CSS style 顯示區塊
2. 利用 `showboxstyle.innerHTML = cssbox.value` 這個指令將 cssbox 的內容填入到該表頭的 style 區塊中

這樣就達成了套用 CSS 內容到網頁中的目的，完成了整個 HTML 編輯器的功能。

### 結語

在本文中，我們用非常簡單的程式，建構了一個 HTML 編輯器。事實上我們只不過是把網頁內容從編輯區域移動到顯示區域，然後流覽器就會
自動解釋這些內容進行呈現了。

在本系列的文章中，關於瀏覽器部分的 JavaScript 程式，我們將至此告一個段落，在下一期當中，我們將開始進入伺服端的 javascript 程式。
我們將利用 node.js 這個伺服端 JavaScript 執行平台，進一步探索 JavaScript 程式的奧秘，我們下期見！


### 參考

* <http://stackoverflow.com/questions/1720320/how-to-dynamically-create-css-class-in-javascript-and-apply>
* <http://dev.opera.com/articles/view/dynamic-style-css-javascript/>
