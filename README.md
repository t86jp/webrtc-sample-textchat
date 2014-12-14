webrtc-sample-textchat
======================

WebRTCのテキストチャットサンプル

## インストール

```
$ git clone https://github.com/t86jp/webrtc-sample-textchat.git

$ cd webrtc-sample-textchat.git

$ docker build -t test/webrtc .
```

## 実行

```
docker run -d -p 80:80 -v $(pwd)/www:/var/www test/webrtc
```

http://127.0.0.1/ を開く
