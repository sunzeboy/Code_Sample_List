目录
=================
* [Protocol](#protocol)
  * [1、从隐式接口和编译期多态说起](#1%E4%BB%8E%E9%9A%90%E5%BC%8F%E6%8E%A5%E5%8F%A3%E5%92%8C%E7%BC%96%E8%AF%91%E6%9C%9F%E5%A4%9A%E6%80%81%E8%AF%B4%E8%B5%B7)
  * [4、如何通过泛型编程简化网络请求？](#4%E5%A6%82%E4%BD%95%E9%80%9A%E8%BF%87%E6%B3%9B%E5%9E%8B%E7%BC%96%E7%A8%8B%E7%AE%80%E5%8C%96%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82)
* [Optional](#optional)
  * [有哪些常用的optional使用范式](#%E6%9C%89%E5%93%AA%E4%BA%9B%E5%B8%B8%E7%94%A8%E7%9A%84optional%E4%BD%BF%E7%94%A8%E8%8C%83%E5%BC%8F)
    * [if let](#if-let)
    * [while let](#while-let)
    * [Nil coalescing](#nil-coalescing)
  * [为什么需要双层嵌套的Optional？](#%E4%B8%BA%E4%BB%80%E4%B9%88%E9%9C%80%E8%A6%81%E5%8F%8C%E5%B1%82%E5%B5%8C%E5%A5%97%E7%9A%84optional)
    * [for case](#for-case)
  * [Optional map和flatMap的应用和实现](#optional-map%E5%92%8Cflatmap%E7%9A%84%E5%BA%94%E7%94%A8%E5%92%8C%E5%AE%9E%E7%8E%B0)
    * [Optional map](#optional-map)
    * [Optional flatMap](#optional-flatmap)
  * [两个调试optional的小技巧](#%E4%B8%A4%E4%B8%AA%E8%B0%83%E8%AF%95optional%E7%9A%84%E5%B0%8F%E6%8A%80%E5%B7%A7)
* [Reactive Programming in Swift](#reactive-programming-in-swift)
  * [理解Disposable &amp; DisposeBag](#%E7%90%86%E8%A7%A3disposable--disposebag)
    * [Disposable](#disposable)
    * [DisposeBag](#disposebag)
  * [基于RxSwift的网络编程 \- I](#%E5%9F%BA%E4%BA%8Erxswift%E7%9A%84%E7%BD%91%E7%BB%9C%E7%BC%96%E7%A8%8B---i)
    * [使用throttle控制请求频度](#%E4%BD%BF%E7%94%A8throttle%E6%8E%A7%E5%88%B6%E8%AF%B7%E6%B1%82%E9%A2%91%E5%BA%A6)
    * [使用\.flatMap转化Observable](#%E4%BD%BF%E7%94%A8flatmap%E8%BD%AC%E5%8C%96observable)
 
     
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

### Nil coalescing

找到多个optional中，第一个不为nil的变量

```swift
let a: String? = nil
let b: String? = nil
let c: String? = "C"

let theFirstNonNilString = a ?? b ?? c
// Optional("C")
```
理解了这个机制之后，我们就可以把它用在if分支里，通过if let绑定第一个不为nil的optional变量：

```swift
if let theFirstNonNilString = a ?? b ?? c {
    print(theFirstNonNilString) // C
}
```

## 为什么需要双层嵌套的Optional？
### for case

读取所有的非nil值：

```swift
for case let one? in intOnes {
    print(one) // 1
}
```
或者统计所有的nil值：

```swift
for case nil in intOnes {
    print("got a nil value")
}
```
## Optional map和flatMap的应用和实现
### Optional map
```swift
extension Optional {
    func myMap<T>(_ transform: (Wrapped) -> T) -> T? {
        if let value = self {
            return transform(value)
        }

        return nil
    }
}
```
### Optional flatMap
```swift
extension Optional {
    func myFlatMap<T>(_ transform: (Wrapped) -> T?) -> T? {
        if let value = self,
            let mapped = transform(value) {
            return mapped
        }

        return nil
    }
}
```
## 两个调试optional的小技巧
   * [swift自定义操作符](https://boxueio.com/series/optional-is-not-an-option/ebook/146) 


# Reactive Programming in Swift

## 理解Disposable & DisposeBag

### Disposable

表示某种“用过之后就扔掉的东西”；

### DisposeBag

理解为一个装Disposable的“袋子”。当这个“袋子”被销毁的时候，它就会逐个销毁其中的Disposable对象。“无限事件序列”，最好的回收方法就是定义一个公用的DisposeBag，然后把它们统统装进去，当这个Bag的值为nil时，所有的序列就都被自动销毁了。

## 基于RxSwift的网络编程 - I

### 使用throttle控制请求频度

### 使用.flatMap转化Observable

如果经过映射后的结果是一个新的事件序列，那么flatMap把映射前的事件（在我们的例子里是UITextField的输入）和映射后的事件（在我们的例子里是一个网络请求）合并成一个事件发送给订阅者。

