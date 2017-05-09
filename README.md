# DYLive
模仿斗鱼直播app


## 每日进度

**2017年04月21日 —** <br><br>
【状态】：已经完成首页推荐页面CollectionView的数据展示<br>
【计划】：添加推荐页面的广告轮播 && 下面的游戏推荐View<br>
【实现步骤】：
1. 创建广告轮播view：CollectionCycleView
2. 无限轮播的数据请求
3. 无限轮播的数据展示
4. 完善无限轮播功能，修改对应的数据源方法，造成对应的假象，添加定时器和手势来完善无限轮播功能
5. 完善推荐页面的GameView的UI展示


【当前效果】：<br>
![4.21当前效果图.gif](http://oozx6yayl.bkt.clouddn.com/default.gif)


**2017年04月29日 —** <br><br>
【状态】：已经完成首页推荐页面的广告轮播 && 游戏推荐View<br>
【计划】：完成游戏页面布局和数据展示<br>
【实现步骤】：
1. 创建游戏页面控制器：GameViewController
2. 布局页面中 collectionView
3. 请求和展示数据（主体部分数据）
4. 添加collectionView的每组的HeaderView（这里复用首页的collectionHeaderView）
5. 添加顶部的topView。topView中的常见游戏view复用推荐页面的commendGameView。
6. 展示顶部常见游戏数据

【当前效果】：<br>
![4.29当前效果图.gif](http://oozx6yayl.bkt.clouddn.com/4.29-DYLive.gif)


**2017年05月03日 —** <br><br>
【状态】：已经完成游戏页面的布局和数据展示<br>
【计划】：完成娱乐页面的布局和数据展示<br>
【实现步骤】：
1. 创建娱乐页面控制器：AmuseViewController
2. 布局页面中 collectionView，创建基本布局，基本和推荐页面相似可复用
3. 请求和展示数据（主体部分数据）
4. 娱乐 && 推荐页面，抽取重复代码。进行父类抽取
5. 设计顶部的topView基本布局。创建并添加topView完成基本框架。
6. 创建topView内部子控件，进行详细布局
7. 娱乐页面-进行顶部数据展示

【当前效果】：<br>
![5.03当前效果图.gif](http://oozx6yayl.bkt.clouddn.com/5.03-DYLive.gif)


**2017年05月06日 —** <br><br>
【状态】：已经完成娱乐页面的布局和数据展示<br>
【计划】：完成趣玩页面的布局和数据展示<br>
【实现步骤】：
1. 创建趣玩页面控制器：FunnyViewController
2. 页面基本布局为 collectionView，可复用之前抽取的BaseAnchorViewController
3. 请求和展示数据（这块也是继承父类就行，但是数据这块和父类有所不同）


【当前效果】：<br>
![5.06效果](http://oozx6yayl.bkt.clouddn.com/5.06-DYLive.gif)
