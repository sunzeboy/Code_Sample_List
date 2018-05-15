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
* [RxSwift \- step by step](#rxswift---step-by-step)
  * [理解create和debug operator](#%E7%90%86%E8%A7%A3create%E5%92%8Cdebug-operator)
    * [创建自定义事件的序列](#%E5%88%9B%E5%BB%BA%E8%87%AA%E5%AE%9A%E4%B9%89%E4%BA%8B%E4%BB%B6%E7%9A%84%E5%BA%8F%E5%88%97)
    * [事件序列的调试](#%E4%BA%8B%E4%BB%B6%E5%BA%8F%E5%88%97%E7%9A%84%E8%B0%83%E8%AF%95)
      * [do &amp; debug](#do--debug)
  * [四种Subject的基本用法](#%E5%9B%9B%E7%A7%8Dsubject%E7%9A%84%E5%9F%BA%E6%9C%AC%E7%94%A8%E6%B3%95)
    * [PublishSubject](#publishsubject)
    * [BehaviorSubject](#behaviorsubject)
    * [ReplaySubject](#replaysubject)
    * [Variable](#variable)
  * [Todo II \- 如何通过Subject传递数据](#todo-ii---%E5%A6%82%E4%BD%95%E9%80%9A%E8%BF%87subject%E4%BC%A0%E9%80%92%E6%95%B0%E6%8D%AE)
    * [创建PublishSubject](#%E5%88%9B%E5%BB%BApublishsubject)
    * [资源被正常回收了么？](#%E8%B5%84%E6%BA%90%E8%A2%AB%E6%AD%A3%E5%B8%B8%E5%9B%9E%E6%94%B6%E4%BA%86%E4%B9%88)
  * [常用的忽略事件操作符](#%E5%B8%B8%E7%94%A8%E7%9A%84%E5%BF%BD%E7%95%A5%E4%BA%8B%E4%BB%B6%E6%93%8D%E4%BD%9C%E7%AC%A6)
    * [ignoreElements](#ignoreelements)
    * [skip](#skip)
    * [skipWhile](#skipwhile)
    * [skipUntil](#skipuntil)
    * [distinctUntilChanged](#distinctuntilchanged)
  * [常用的获取事件操作符](#%E5%B8%B8%E7%94%A8%E7%9A%84%E8%8E%B7%E5%8F%96%E4%BA%8B%E4%BB%B6%E6%93%8D%E4%BD%9C%E7%AC%A6)
    * [elementAt](#elementat)
    * [filter](#filter)
    * [take](#take)
    * [takeWhile / takeWhileWithIndex](#takewhile--takewhilewithindex)
    * [takeUntil](#takeuntil)
  * [Todo V \- 理解重复订阅Observable的行为](#todo-v---%E7%90%86%E8%A7%A3%E9%87%8D%E5%A4%8D%E8%AE%A2%E9%98%85observable%E7%9A%84%E8%A1%8C%E4%B8%BA)
    * [scan](#scan)
  * [了解常用的transform operators](#%E4%BA%86%E8%A7%A3%E5%B8%B8%E7%94%A8%E7%9A%84transform-operators)
    * [toArray](#toarray)
    * [转换事件类型的map](#%E8%BD%AC%E6%8D%A2%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B%E7%9A%84map)
  * [为什么RxSwift也需要flatMap](#%E4%B8%BA%E4%BB%80%E4%B9%88rxswift%E4%B9%9F%E9%9C%80%E8%A6%81flatmap)
    * [把序列中的事件变成新的Observable](#%E6%8A%8A%E5%BA%8F%E5%88%97%E4%B8%AD%E7%9A%84%E4%BA%8B%E4%BB%B6%E5%8F%98%E6%88%90%E6%96%B0%E7%9A%84observable)
    * [合成所有转换过的序列](#%E5%90%88%E6%88%90%E6%89%80%E6%9C%89%E8%BD%AC%E6%8D%A2%E8%BF%87%E7%9A%84%E5%BA%8F%E5%88%97)
    * [flatMapLatest](#flatmaplatest)
  * [如何合并Observables](#%E5%A6%82%E4%BD%95%E5%90%88%E5%B9%B6observables)
    * [处理事件的前置条件](#%E5%A4%84%E7%90%86%E4%BA%8B%E4%BB%B6%E7%9A%84%E5%89%8D%E7%BD%AE%E6%9D%A1%E4%BB%B6)
      * [startWith](#startwith)
    * [串行合并多个事件序列](#%E4%B8%B2%E8%A1%8C%E5%90%88%E5%B9%B6%E5%A4%9A%E4%B8%AA%E4%BA%8B%E4%BB%B6%E5%BA%8F%E5%88%97)
      * [concat](#concat)
    * [理解合成后Observable的生命周期](#%E7%90%86%E8%A7%A3%E5%90%88%E6%88%90%E5%90%8Eobservable%E7%9A%84%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F)
    * [并行合并多个事件序列](#%E5%B9%B6%E8%A1%8C%E5%90%88%E5%B9%B6%E5%A4%9A%E4%B8%AA%E4%BA%8B%E4%BB%B6%E5%BA%8F%E5%88%97)
      * [merge](#merge)
    * [控制最大订阅数量](#%E6%8E%A7%E5%88%B6%E6%9C%80%E5%A4%A7%E8%AE%A2%E9%98%85%E6%95%B0%E9%87%8F)
  * [如何合并Observables中的事件](#%E5%A6%82%E4%BD%95%E5%90%88%E5%B9%B6observables%E4%B8%AD%E7%9A%84%E4%BA%8B%E4%BB%B6)
    * [把多个Observables中的事件合并为一个(combineLatest)](#%E6%8A%8A%E5%A4%9A%E4%B8%AAobservables%E4%B8%AD%E7%9A%84%E4%BA%8B%E4%BB%B6%E5%90%88%E5%B9%B6%E4%B8%BA%E4%B8%80%E4%B8%AAcombinelatest)
    * [合并事件类型不同的Sub\-observables](#%E5%90%88%E5%B9%B6%E4%BA%8B%E4%BB%B6%E7%B1%BB%E5%9E%8B%E4%B8%8D%E5%90%8C%E7%9A%84sub-observables)
    * [combineLatest的生命周期](#combinelatest%E7%9A%84%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F)
    * [真正只合并最新事件的operator（zip）](#%E7%9C%9F%E6%AD%A3%E5%8F%AA%E5%90%88%E5%B9%B6%E6%9C%80%E6%96%B0%E4%BA%8B%E4%BB%B6%E7%9A%84operatorzip)

     
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

# RxSwift - step by step

## 理解create和debug operator

### 创建自定义事件的序列

在Observable+Creation.swift里，可以看到create的签名是这样的：

```swift
public static func create(
    _ subscribe: @escaping (AnyObserver<E>) -> Disposable
) -> Observable<E>
```
这里，subscribe并不是指事件真正的订阅者，而是用来定义当有人订阅Observable中的事件时，应该如何向订阅者发送不同情况的事件，理解这个问题，是使用create的关键。

然后，再来看subscribe自身，当然，它是一个closure，此时，AnyObserver<E>在这个closure里，表示任意一个订阅的“替身”，我们要用这个“替身”来表达向订阅者发送各种事件的行为。理解了这个概念，我们的create调用就可以进一步细化成这样：

```swift
let customOb = Observable<Int>.create { observer in
    // next event
    observer.onNext(10)

    observer.onNext(11)

    // complete event
    observer.onCompleted()
}
```
表示，只要有人订阅了costomOb中的事件，我们就先向订阅者发送两次.next事件，值分别是10和11，然后，发送.completed表示Observable结束。

### 事件序列的调试
#### do & debug

用do进行调试并不方便，毕竟还要写一堆的on，再配上各自的closure，应该有一个专门可以穿插在各种operator之间进行调试的operator。实际上，do也的确不是为了调试而生的，我们只是借用了它的“旁路”特性而已。RxSwift提供了一个调试专属的operator，叫做debug，它可以安插在任意一个需要确认事件值的地方，像这样：

```swift
customOb.debug()
.subscribe(
    onNext: { print($0) },
    onError: { print($0) },
    onCompleted: { print("Completed") },
    onDisposed: { print("Game over") }
).addDisposableTo(disposeBag)
```


## 四种Subject的基本用法

### PublishSubject

PublishSubject执行的是“会员制”，它只会把最新的消息通知给消息发生之前的订阅者。用序列图表示出来，就是这样的：
![](https://image.boxueio.com/subject-basic-1@2x.png)

### BehaviorSubject

它和PublisherSubject唯一的区别，就是只要有人订阅，它就会向订阅者发送最新的一次事件作为“试用”。
![](https://image.boxueio.com/subject-basic-2@2x.png)
如图所示，BehaviorSubject带有一个紫灯作为默认消息，当红灯之前订阅时，就会收到紫色及以后的所有消息。而在绿灯之后订阅，就只会收到绿灯及以后的所有消息了。因此，当初始化一个BehaviorSubject对象的时候，要给它指定一个默认的推送消息

### ReplaySubject

ReplaySubject的行为和BehaviorSubject类似，都会给订阅者发送历史消息。不同地方有两点：

	1、ReplaySubject没有默认消息，订阅空的ReplaySubject不会收到任何消息；
	2、ReplaySubject自带一个缓冲区，当有订阅者订阅的时候，它会向订阅者发送缓冲区内的所有消息；
![](https://image.boxueio.com/subject-basic-3@2x.png)

### Variable

除了事件序列之外，在平时的编程中我们还经常需遇到一类场景，就是需要某个值是有“响应式”特性的，例如可以通过设置这个值来动态控制按钮是否禁用，是否显示某些内容等。为了方便这个操作，RxSwift还提供了一个特殊的subject，叫做Variable。

	当我们要订阅一个Variable对象的时候，要先明确使用asObservable()方法。而不像其他subject一样直接订阅；
	而当我们要给一个Variable设置新值的时候，要明确访问它的value属性，而不是使用onNext方法
	
Variable只用来表达一个“响应式”值的语义，因此，它有以下两点性质：

	绝不会发生.error事件；
	无需手动给它发送.complete事件表示完成；
	
## Todo II - 如何通过Subject传递数据

### 创建PublishSubject

```swift
class TodoDetailViewController: UITableViewController {
    fileprivate let todoSubject = PublishSubject<TodoItem>()
    var todo: Observable<TodoItem> {
        return todoSubject.asObservable()
    }
    // ...
}
```
为了避免todoSubject意外从TodoDetailViewController外部接受onNext事件，我们把它定义成了fileprivate属性。对外，只提供了一个仅供订阅的Observable属性todo

### 资源被正常回收了么？

在Podfile中添加下面的内容：

```swift
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'RxSwift'
      target.build_configurations.each do |config|
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
        end
      end
    end
  end
end
```
调用：

```swift
(RxSwift.Resources.total
```

## 常用的忽略事件操作符

### ignoreElements

它会忽略掉所有的.next事件，只接受.completed事件

![](https://image.boxueio.com/ignoring-ops-4@2x.png)

### skip

表示从事件序列中的第一个元素开始，忽略其参数指定个数的事件，用序列图表示，就是这样的：

![](https://image.boxueio.com/ignoring-ops-6@2x.png)

### skipWhile

它只忽略到第一个不满足条件的事件，然后，就完成任务了。用序列图表示，就是这样的：

![](https://image.boxueio.com/ignoring-ops-8@2x.png)

### skipUntil

会一直忽略tasks中的事件，直到bossIsAngry中发生事件为止。把它用序列图表示出来，是这样的：

![](https://image.boxueio.com/ignoring-ops-9@2x.png)

### distinctUntilChanged

忽略序列中连续重复的事件

![](https://image.boxueio.com/ignoring-ops-12@2x.png)

## 常用的获取事件操作符

### elementAt

选择序列中的第n个事件，要注意的是，elementAt的参数和数组的索引一样，第一个任务的索引是0，而不是1。它的序列图，是这样的：

![](https://image.boxueio.com/getting-ops-2@2x.png)

### filter

除了用事件的索引来选择之外，我们也可以用一个closure设置选择事件的标准，这就是filter的作用，它会选择序列中所有满足条件的元素。

![](https://image.boxueio.com/getting-ops-3@2x.png)

### take

除了选择订阅单一事件之外，我们也可以选择一次性订阅多个事件，例如，选择序列中的前两个事件：

```swift
tasks.take(2)
    .subscribe {
        print($0)
    }
    .addDisposableTo(bag)
```
### takeWhile / takeWhileWithIndex

只要条件为true就一直订阅下去,否则就只能订阅到.completed；

takeWhileWithIndex的closure有两个参数，第一个是事件的值，第二个是事件在序列中的索引。它的语义和takeWhile是完全一样的，需要注意的仍旧是，在closure里写的，是读取事件的条件，而不是终止读取的条件。

### takeUntil

直到某件事件发生前，一直订阅

## Todo V - 理解重复订阅Observable的行为

```swift
let numbers = Observable.of(1, 2, 3, 4, 5)

_ = numbers.subscribe(onNext: { print($0) })
_ = numbers.subscribe(onNext: { print($0) })
```
假设，我们希望这两次订阅实际上使用的是同一个Observable，但执行一下就会在控制台看到，打印了两次1 2 3 4 5，也就是说每次订阅，都会产生一个新的Observable对象，多次订阅的默认行为，并不是共享同一个序列上的事件。

为了在多次订阅的时候共享事件，我们可以使用share operator，为了观察这个效果，我们把numbers的定义改成这样：

```swift
let numbers = Observable.of(1, 2, 3, 4, 5).share()
```
重新再执行一下，就会发现，虽然订阅了两次，但我们只能看到打印了一次1 2 3 4 5。

### scan

它有点儿类似集合中的reduce，可以把一个序列中所有的事件，通过一个自定义的closure，最终归并到一个事件，用序列图表示，就是这样的：
![](https://image.boxueio.com/filter-ops-in-app-5@2x.png)

在上面这个图里，我们指定合并的初始值是0，合并动作是把历史和并结果和新的事件值相加。于是，在事件2的时候订阅，订阅到的结果就是3，3的时候订阅，订阅的结果就是6，以此类推。

## 了解常用的transform operators

### toArray

它把Observable<T>中所有的事件值，在订阅的时候，打包成一个Array<T>返回给订阅者。
![](https://image.boxueio.com/transform-ops-1@2x.png)

要注意的是，toArray的转换，是在订阅的时候，根据当前Observable中的值一次性完成转换的，后续的事件订阅则不会再进行转换。可能听着有点儿晕，我们来看个例子：

```swift
let numbers = PublishSubject<Int>()

numbers.asObservable()
    .toArray()
    .subscribe(onNext: {
        print($0)
    }).addDisposableTo(bag)


numbers.onNext(1)
numbers.onNext(2)
numbers.onNext(3)
```
对于这个例子来说，在订阅的时候，使用了toArray，但此时，numbers中没有任何值，toArray变换出来的，就是个空数组。即便之后numbers中发生了事件123，但是，我们订阅的，已经不是numbers，而是numbers在订阅的时候转换成的Observable<Array<Int>>

### 转换事件类型的map

map也提供了一个withIndex的版本，像这样：

```swift
Observable.of(1, 2, 3)
    .mapWithIndex {
        value, index in
        index < 1 ? value * 2 : value
    }.subscribe(onNext: {
        print($0)
    }).addDisposableTo(bag)
```
mapWithIndex的closure接受两个参数，第一个表示事件本身，第二个表示事件在序列中的位置。因此，在上面的例子里，当把第一个发生的事件值乘以2，之后的都返回事件值本身。这样，就可以得到“2 2 3”这样的结果了。


## 为什么RxSwift也需要flatMap

### 把序列中的事件变成新的Observable
![](https://image.boxueio.com/transform-ops-ii-1@2x.png)
其中，John是player序列中发生的事件，通过flatMap我们把它变成了一个Observable<Int>。这就是flatMap定义前半句的含义：Transform the items emitted by an Observable into Observables。

### 合成所有转换过的序列
![](https://image.boxueio.com/transform-ops-ii-2@2x.png)
当我们在75和80之间加入Jole的时候，flatMap会把Jole中事件的值和John中事件的值合并到一起，变成一个Observable<Int>，这种把两个Observable<Int>变成一个的过程，就是flatMap定义中，flatten的含义。

实际上，经过flatMap合并过的Observable<Int>会按发生的顺序，反映John和Jole中的所有事件。

### flatMapLatest

当原序列中有新事件发生的时候，flatMapLatest就会自动取消上一个事件的订阅，然后转换到新事件的订阅。而flatMap则会保持原序列中的所有事件订阅。

## 如何合并Observables

### 处理事件的前置条件

#### startWith
![](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/assets/WhichOperator/Operators/startWith.png)
startWith 操作符会在 Observable 头部插入一些元素。

### 串行合并多个事件序列
#### concat

把两个并行的Observable合并起来串行处理

### 理解合成后Observable的生命周期

### 并行合并多个事件序列

#### merge
![](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/assets/WhichOperator/Operators/merge.png)
通过使用 merge 操作符你可以将多个 Observables 合并成一个，当某一个 Observable 发出一个元素时，他就将这个元素发出。

如果，某一个 Observable 发出一个 onError 事件，那么被合并的 Observable 也会将它发出，并且立即终止序列。

### 控制最大订阅数量
如果我们想只同时订阅到一个事件，就可以这样：

```swift
let sequence1 = Observable.of(
    queueA.asObservable(),
    queueB.asObservable())
    .merge(maxConcurrent: 1)
```
还是之前的事件序列，这次，我们就只能订阅到A1 -> A2 -> Disposable，因为maxConcurrent指定了只能“同时”订阅1个队列。如果我们在B1发生前，让queueA结束，就可以订阅到queueB中的事件了：

```swift
queueA.onNext("A1")
queueA.onNext("A2")
queueA.onCompleted()
queueB.onNext("B1")
```

## 如何合并Observables中的事件

### 把多个Observables中的事件合并为一个(combineLatest)

![](https://image.boxueio.com/combine-events-1@2x.png)
在这个图中，有以下几点是需要关注的：

	1、当queueA中发生A1时，由于queueB中还没有任何事件，此时，不会发生任何combine的动作。只有在每一个Sub-observable中都发生过一个事件之后，combineLatest才会执行我们定义的closure；
	2、于是，当queueB中发生B1时，我们就订阅到了第一个合并后的事件，值是“A1,B1”；
	3、接下来，当queueA中发生A2时，对于queueA来说，当前的事件就是A2，对于queueB来说，当前的事件仍就是B1，因此，我们会订阅到“A2,B1”；
	4、最后，当B2发生时，我们会订阅到“A2,B2”；
	
因此，对于这个例子来说，我们一共会订阅到三次合并后的事件。

### 合并事件类型不同的Sub-observables

### combineLatest的生命周期

### 真正只合并最新事件的operator（zip）
![](https://image.boxueio.com/combine-events-2@2x.png)
zip合成的Observable中，其中任何一个Sub-observable发生了Completed事件，整个合成的Observable就完成了。

## 如何在不同的Observables之间跳转

### 模拟表单提交

```swift
let textField = BehaviorSubject<String>(value: "boxu")
let submitBtn = PublishSubject<Void>()

submitBtn.withLatestFrom(textField)
    .subscribe(onNext: { dump($0) })
    .addDisposableTo(bag)
```
上面的代码可以理解为，每当submitBtn中有事件发生的时候，就读取textField中的最新事件。这样，就实现submit按钮被点击的时候，订阅到当前表单内容的效果了.把一个Observable中的事件作为跳转到另外一个Observable的“触发器”
![](https://image.boxueio.com/switch-obs-1@2x.png)

### 在多个Observables之间进行跳转 （switchLatest）

switchLatest 有点像其他语言的 switch 方法，可以对事件流进行转换。
比如本来监听的 subject1，我可以通过更改 variable 里面的 value 更换事件源。变成监听 subject2。
![](http://www.hangge.com/blog_uploads/201801/2018011317122482241.png)

使用样例：

```swift
let disposeBag = DisposeBag()
 
let subject1 = BehaviorSubject(value: "A")
let subject2 = BehaviorSubject(value: "1")
 
let variable = Variable(subject1)
 
variable.asObservable()
    .switchLatest()
    .subscribe(onNext: { print($0) })
    .disposed(by: disposeBag)
 
subject1.onNext("B")
subject1.onNext("C")
 
//改变事件源
variable.value = subject2
subject1.onNext("D")
subject2.onNext("2")
 
//改变事件源
variable.value = subject1
subject2.onNext("3")
subject1.onNext("E")
```
运行结果如下：

![](http://www.hangge.com/blog_uploads/201801/2018011609322871752.png)

## 为什么需要connectable operator

### 使用publish发布事件

### 使用multicast operator

## 使用connectable operator回放事件

### 订阅时，回放指定个数的事件

#### replay & replayAll

### 为事件的回放指定缓冲区

#### buffer

```swift
let interval = Observable<Int>
    .interval(1, scheduler: MainScheduler.instance)
    .buffer(timeSpan: 4, count: 2, scheduler: MainScheduler.instance)
```

要注意的是，使用了buffer之后，interval就不再是connectable observable了。它有三个参数:


* timeSpan：缓冲区的时间跨度，尽管interval每隔1秒钟发生一次事件，但经过buffer处理后，就变成了最长timeSpan秒发生一次事件了，事件的值，就是由所有缓存的事件值构成的数组。如果timeSpan过后没有任何事件发生，就向事件的订阅者发送一个空数组；
* count：缓冲区在timeSpan时间里可以缓存的最大事件数量，当达到这个值之后，buffer就会立即把缓存的事件用一个数组发送给订阅者，并重置timeSpan；
* scheduler：表示Observable事件序列发生在主线程，在后面的内容里，我们还会专门介绍RxSwift中的各种scheduler；

于是，现在的interval就表示每隔4秒，或者最大缓存两个事件，就发送给订阅者。

### 由Observable填充的缓冲区

#### window

```swift
let interval = Observable<Int>
    .interval(1, scheduler: MainScheduler.instance)
    .window(timeSpan: 4, count: 4, scheduler: MainScheduler.instance)
```
我们的事件序列就会每隔4秒打开一个窗口，每个窗口周期最多处理4个事件，然后关闭当前窗口，打开新的窗口。

# iOS 101
## 一个纯手工的Single View Application

1. UIApplicationMain分别创建UIApplication和AppDelegate，并且把它们保持在内存里；
2. AppDelegate创建UIWindow对象，并且把它保存在AppDelegate.window对象里；
3. 创建了UIWindow之后，创建rootViewController，让root view就绪；
4. 调用makeKeyAndVisible让UI显示出来；

