Table of Contents
=================

* [Protocol](#protocol)
    * [1、从隐式接口和编译期多态说起](#1%E4%BB%8E%E9%9A%90%E5%BC%8F%E6%8E%A5%E5%8F%A3%E5%92%8C%E7%BC%96%E8%AF%91%E6%9C%9F%E5%A4%9A%E6%80%81%E8%AF%B4%E8%B5%B7)
    * [4、如何通过泛型编程简化网络请求？](#4%E5%A6%82%E4%BD%95%E9%80%9A%E8%BF%87%E6%B3%9B%E5%9E%8B%E7%BC%96%E7%A8%8B%E7%AE%80%E5%8C%96%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82)
    
# Protocol

## 1、从隐式接口和编译期多态说起
	对于面向对象来说，接口是显式的，是基于类型定义和方法签名的，多态是发生在运行时的；
	而对于泛型编程，接口则是隐式的，是为了支持算法实现的，多态则是发生在编译期的
	
## 4、如何通过泛型编程简化网络请求？
```swift
struct Resource<T> {
    let path: URL
    let parser: (Any) -> T?
}
                    
extension Resource {
    func syncLoad(callback: (T?) -> Void) {
        let resourceData = try? Data(contentsOf: path)

        let jsonRoot = resourceData.flatMap {
            try? JSONSerialization.jsonObject(with: $0, options: [])
        }

        callback(jsonRoot.flatMap(parse))
    }
}
```

这样，我们之前读取视频信息的代码就可以写成：

```swift
let episodeResource: Resource<[Episode]> =
    Resource(
        path: URL("https://api.boxue.io/v1/episodes")!, 
        parser: parseEpisodes)

episodeResource.syncLoad(
    callback: { print($0 ?? "") })
```

并且，给Resource<T>加上异步加载的功能也是举手之劳的事情：

```swift    
extension Resource {
    func asyncLoad(
        callback: @escaping (T?) -> Void) {
        let session = URLSession.shared

        session.dataTask(with: path) { 
            resourceData, _, _ in
            let jsonRoot = resourceData.flatMap {
                try? JSONSerialization.jsonObject(with: $0)
            }

            callback(jsonRoot.flatMap(self.parse))
        }.resume()
    }
}
```
# Optional
## 有哪些常用的optional使用范式

### if let

```swift
if let url = URL(string: imageUrl), url.pathExtension == "jpg",
    let data = try? Data(contentsOf: url),
    let image = UIImage(data: data) {

    let view = UIImageView(image: image)
}
```
### while let

在Swift里，for...in循环是通过while模拟出来的，这也就意味着，for循环中的循环变量在每次迭代的时候，都是一个全新的对象，而不是对上一个循环变量的修改

我们来看一段JavaScript代码:

```javaScript
var fnArray = [];

for (var i in [0, 1, 2]) {
    fnArray[i] = () => { console.log(i); };
}

fnArray[0](); // 2
fnArray[1](); // 2
fnArray[2](); // 2
```


