[toc]
# Protocol

### 1、从隐式接口和编译期多态说起
	对于面向对象来说，接口是显式的，是基于类型定义和方法签名的，多态是发生在运行时的；
	而对于泛型编程，接口则是隐式的，是为了支持算法实现的，多态则是发生在编译期的
	
### 4、如何通过泛型编程简化网络请求？
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
