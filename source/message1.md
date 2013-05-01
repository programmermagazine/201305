## 軟體短訊 – CMake 專案檔產生工具

最近在建置 OpenCV 時，發現居然需要用 CMake 才能完成，於是只好想辦法瞭解 CMake 到底為何物？

原本以為 CMake 是與 GNU make 類似的另一套專案建置工具，就好像 Ruby 的 Rake 一樣，但後來發現我錯了！

CMake 並不是用來取代 GNU make 的東西，而是著眼於跨平台的問題，利用一套更上層的 make 工具，同時產生
GNU 的 Makefile 與 Visual Studio 的 .sln 專案檔的一種工具，這樣的方式可以解決平台所衍生的不相容問題。
或許我們可以稱 CMake 是一種「產生專案建置檔的工具」(Meta-Project Maker)。

![CMake 官網的首頁](../img/CMakeHomePage.jpg)

### CMake 的歷史

CMake 是為了解決美國國家醫學圖書館出資的 Visible Human Project 專案下的 Insight Segmentation and Registration Toolkit (ITK) 軟體的跨平台建構的需求而創造出來的，其設計受到了 Ken Martin 開發的 pcmaker 所影響。pcmaker 當初則是為了支援 Visualization Toolkit (VTK) 這個開放原始碼的三維圖形和視覺系統才出現的，今日 VTK 也採用了 CMake。在設計 CMake 之時，Kitware 公司的 Bill Hoffman 採用了 pcmaker 的一些重要想法，加上更多他自己的點子，想把 GNU 建構系統 的一些功能整合進來。CMake 最初的實作是在 2000 年中作的，在 2001 年初有了急速的進展，許多改良是來自其他把 CMake 整合到自己的系統中的開發者，比方說，採用 CMake 作為建構環境的 VXL 社群就貢獻了很多重要的功能，Brad King 為了支援 CABLE 和 GCC-XML 這套自動包裝工具也加了幾項功能，通用電氣公司的研發部門則用在內部的測試系統 DART，還有一些功能是為了讓 VTK 可以過渡到 CMake 和支援洛斯阿拉莫斯國家實驗室的 Advanced Computing Lab 的平行視覺系統 ParaView 而加的。

### 使用 CMake 建置的軟體

使用 CMake 的應用軟體很多，以下是維基百科列出的軟體：

> Allegro library, Armadillo - linear algebra library, Avidemux, Awesome, Blender 3D, Boost C++ Libraries, Bullet物理引擎, Chicken, Chipmunk physics engine, clang, Conky, Doomsday Engine, Drishti, Fennel, Gammu, GDCM, Gmsh, Hedgewars, Hypertable, hugin, IGSTK, Insight Segmentation and Registration Toolkit, KDE Software Compilation 4, Kicad, LMMS, LLVM, MiKTeX, MuseScore, MySQL (on Windows only), OGRE, OpenSceneGraph, OpenCV, OpenFLUID, ParaView, Poppler, PvPGN, Quantum GIS, Raw Therapee, Rem, Scribus, SuperTux, Slicer, Stellarium, The Visualization Toolkit, VXL, UFFS

仔細看的話，您會發現這些軟體可都是大有來頭阿！可見 CMake 現在已經廣受開放原始碼群體的重用了阿！

### CMake 的使用方法

如果您想知道 CMake 的使用方法，請參考以下「井民全」先生的網誌文章：

* [程式設計] 最簡單的 CMake 使用說明 – how to use cmake -- <http://mqjing.blogspot.tw/2009/09/cmake-how-to-use-cmake.html>

### 參考文獻
* [維基百科:CMake](http://zh.wikipedia.org/zh-tw/CMake)
* [CMake 入門：維基教科書，自由的教學讀本](http://zh.wikibooks.org/zh-hant/CMake_%E5%85%A5%E9%96%80)
* [cmake 学习笔记(一)](http://blog.csdn.net/dbzhang800/article/details/6314073)
* 最簡單的 CMake 使用說明 – how to use cmake
    * <http://mqjing.blogspot.tw/2009/09/cmake-how-to-use-cmake.html>
    
【本文由陳鍾誠取材並修改自維基百科】

