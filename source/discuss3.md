## JavaScript 討論 – 繼承的實作方法

4 月 12 日，筆者在查詢 JavaScript 的繼承實作方法時，發了一個討論帖，網址如下：

* <https://www.facebook.com/groups/programmerMagazine/permalink/628184417198278/>

令筆者驚訝的是，「良格葛」也來了，並且提供了很棒的文章！

### 討論內容

由於筆者在網路上看到的 JavaScript 繼承方法每個人都寫得不一樣，因此發了以下訊息：

> 
> javascript 的繼承好怪阿！越看越覺得不懂。
> 
> * <http://ccckmit.wikidot.com/js:inheritance>
> * <http://howtonode.org/prototypical-inheritance>
> * <http://stackoverflow.com/questions/7486825/javascript-inheritance>
> * <http://stackoverflow.com/questions/10357033/javascript-object-inheritance>
> * <http://www.crockford.com/javascript/inheritance.html>
> * <http://phrogz.net/JS/classes/OOPinJS2.html>
> * <http://www.cnblogs.com/5201314/archive/2009/05/22/1487213.html>
> 
> 沒有人寫得一樣的???

因而引來了以下的討論 (摘錄)：

* 馮○○：Javascript內建的機制是prototype + constructor...不過物件的生成很自由，所以不一定非得這樣才能做出繼承的效果。
* ...
* 陳鍾誠 不過這種超強彈性我真的很喜歡！
* 陳鍾誠 就軟體工程的控制角度來看，這種設計可能會造成專案控管的很多問題，但是就程式語言的角度看，這種設計卻很彈性、自由且具有吸引力。
* 良格葛：JavaScript 的 prototype-based 特性，使得繼承的實現方式可以很多元化，主要還是得看需求為何？包括對建構式的需求、對檢驗物件的需求、對類別封裝的需求、想模擬哪種語言的外觀（像是有些程式庫是特地為熟悉 Java 的人而設計的，它們對繼承的模擬就會看來很像 Java）..., 唯一要記得的就是函式的 prototype 機制，實作的方式就因人而異了…
* 良格葛：<http://openhome.cc/Gossip/JavaScript/Prototype.html> 最後選用哪種實現機制，就是大家來討論統一，選定後就遵守，避免另行設計一套繼承模型…
* 良格葛：其實不只繼承，模擬任何 Class-based 機制，也都會有各種實現方式，即使是建構式也會有不止一種實現方式
    * <http://openhome.cc/Gossip/JavaScript/Constructor.html>
    * <http://openhome.cc/Gossip/JavaScript/Prototype.html>
    * <http://openhome.cc/Gossip/JavaScript/InspectObject.html>
    * <http://openhome.cc/Gossip/JavaScript/ClassSimulation.html>
* 陳鍾誠：良葛格兄的文章好讚！
* 良葛格：以版主的實現為例，最後會在 Student 的實例上新增一個 prototype 特性，而不是使用 Student 函式的 prototype 特性，這不能說對或錯，要看版主的目的而定，只是最後要讓使用的人也遵守這個模型。

例如有個人用另一種方式，在 Person 的 prototype 特性上新增 doSomething：

```javascript
Person.prototype.doSomething = function(param) {
　...
};
```

那麼最後的 tony 參考的實例，會不會有 doSomething 方法呢？我想是不會的，只會得到一個 undefined，那麼那位使用者要怎麼擴充呢？他要打開 Person 加入：

```javascript
function Person(name, age) {
　this.name = name;
　this.age = age;
　this.toStr = function() { 
　　return "Person:name="+this.name+" age="+this.age; 
　}
　this.doSomething = function(param) {
　　…
　};
}
``` 

那麼在這個程式中，你是否允許他這麼作？就是一個考量了！如果不允許，也不希望他用 Person.prototype.doSomething 隨意擴充，那版主的設計就是可行的…

結論就是還是看需求…XD

* 陳鍾誠：瞭解，這就是 「多元化」的 JavaScript ！
* 陳鍾誠：似乎使用 「prototype + constructor+動態新增成員」 比較能精確抓到 javascript 物件的特性。
* 良葛格：一般來說，原型的目的是訴求自由度與實例的自我學習，原型若模彷類別通常是（約定要）放棄某些自由性，是一種慣例約束方式…
    * 程式語言的特性本質（二）類別與原型的物件管理學 -- <http://openhome.cc/Gossip/Programmer/ClassPrototypeBased.html>

### 筆者心得

最近筆者用 Node.js + JavaScript 重寫開放電腦計畫的「編譯器、虛擬機、組譯器」等程式，發現可以比用比 C 語言短三倍的程式碼寫出相同的功能，
這讓筆者感覺到 JavaScript 真的是令人驚艷的一種語言，語法簡單卻彈性十足，筆者深深的被 JavaScript 所吸引了！
