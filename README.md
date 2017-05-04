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
