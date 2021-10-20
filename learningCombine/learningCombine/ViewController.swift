import UIKit
import Combine

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        sampleCombine1()
                sampleCombine2()
        //        sampleCombine3()
//        sampleCombine4()
//        sampleCombine5()
    }
    
    func sampleCombine1() {
        let a = CurrentValueSubject<Int, Never>(3)
        let b = Just(1)
        
        let publisher = b.combineLatest(a).sink{r in
            print(r)
        }
        
        a.value = 4
        a.value = 5
        a.send(6)
    }
    
    func sampleCombine2() {
        
        struct APIError: Error {
            var description: String
        }

        
        // PublisherとOperator
        let publisher = Future<String, APIError> { promise in
            promise(.success("Hello Combine!"))
            print("1")

            Thread.sleep(forTimeInterval: 5.0)
            
            //通信エラーがあった場合
            //promise(.failure(APIError(description: "通信エラー")))
        }
        .map {
            $0 + " This is map operator"
        }
        print("2")

        // sinkでsubscribe（購読）している
        let cancellable = publisher.sink(receiveCompletion: { completion in
            print("4")

            switch completion {
            case .finished:
                print("5")

                print("finished")
            case .failure(let error):
                print("error \(error.description)")
            }
        }, receiveValue: { message in
            print("received message: \(message)")
            print("3")
        })
        
        print("6")
        
    }
    
    func sampleCombine3() {
        Just(10).sink(receiveCompletion: {completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("finished")
            }
        },receiveValue: {value in
            print("recive:\(value)")
        })
    }
    
    func sampleCombine4() {
        //値を出力する
        let publisher = Just(100)
        
        //値を受け取る
        let subscriber = Subscribers.Sink<Int, Never>(receiveCompletion:{completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("終了")
            }
        },receiveValue: {value in
            print(value)}
        )
        
        //実行
        publisher.subscribe(subscriber)
    }
    
    // publisherの独自実装
    struct MyPublisher: Publisher {

        typealias Output = String
        typealias Failure = MyError
        struct MyError: Error {}

        func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            // なんやかんやして結果を出力
            // recieveでOutPutを何回でも渡すことができる
            subscriber.receive("A")

            // finishとfailureはどちらか1回呼べます
            subscriber.receive(completion: .finished)
    //      subscriber.receive(completion: .failure(.init()))
        }
    }
    
    func sampleCombine5() {
        
        MyPublisher().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finish")
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { value in
            print(value)
        })
    }
    
}

