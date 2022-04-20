## Xray-heroku
[![](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/seouwsss/v2utye)

### heroku上部署Xray
- [x] 支持vless和vmess两种协议
- [x] 支持自定义websocket路径
- [x] 伪装首页（3D元素周期表）
- [x] HTML5测速
- [x] 使用Xray最新版构建

请求`/`，返回3D元素周期表

![image](https://github.com/feixiangii/Xray-Heroku-Web/blob/main/doc/1.png)

请求`/speedtest/`，html5-speedtest测速页面

![image](https://github.com/feixiangii/Xray-Heroku-Web/blob/main/doc/2.png)

请求`/test/`，文件下载速度测试

![image](https://github.com/feixiangii/Xray-Heroku-Web/blob/main/doc/3.png)

请求`/ray`（可配置）Xray websocket路径


### 环境变量说明

|  名称 | 值  | 说明  |
| ------------ | ------------ | ------------ |
|  PROTOCOL |  vless<br>vmess (可选) |  协议：nginx+vless+ws+tls或是nginx+vmess+ws+tls |
|  UUID |  [uuid在线生成器](https://www.uuidgenerator.net "uuid在线生成器") | 用户主ID  |
|  WS_PATH | 默认为`/ray` |  路径，请勿使用`/speedtest`，`/`，`/test` 等已经被占用的请求路径 |

### 进阶
heorku可以绑卡（应用一直在线，不扣费），绑定域名，套cf，[uptimerobot](https://uptimerobot.com/) 定时访问防止休眠
