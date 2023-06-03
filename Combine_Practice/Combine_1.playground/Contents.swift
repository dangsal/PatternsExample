import UIKit
import Combine


// Just로 publusher 생성, sink, receivedCompletion 사용
let publisher = Just("dangsal").sink { result in
    switch result {
    case .finished:
        print("finished")
    case .failure(let error):
        print(error.localizedDescription)
    }
} receiveValue: { value in
    print(value)
}
// Future로 publisher 생성
print("------------------------------1-------------------------------------")
// -----------------------------------------------------------------------------------------
class DangsalSubscriber: Subscriber {
    typealias Input = String
    
    typealias Failure = Never
    
    // subscriber에게 publisher 를 성공적으로 구독했음을 알리고 item을 요청 할 수 있음
    func receive(subscription: Subscription) {
        print("구독 시작")
        subscription.request(.max(1))
    }
    // subsriber에게 publisher 가 element를 생성했음을 알림
    func receive(_ input: String) -> Subscribers.Demand {
        print("\(input)")
        return .max(1)
    }
    // subscriber에게 publisher가 정상적으로 또는 오류로 publish를 완료했음을 알림
    func receive(completion: Subscribers.Completion<Never>) {
        print("완료", completion)
    }
}

let name = Just("Lee Sung Ho")
name.subscribe(DangsalSubscriber())

print("-----------------------------------2------------------------------------")


let names = ["hoya", "ginger", "chemi", "mary", "id"].publisher
names.print().subscribe(DangsalSubscriber())

print("----------------------------------3-------------------------------------")

names.print().sink { print($0) }

print("----------------------------------4-------------------------------------")

class IntSubscriber: Subscriber {
    typealias Input = Int
    
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    func receive(_ input: Int) -> Subscribers.Demand {
        print(input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        
    }
    
}

let intArray: [Int] = [1, 2, 3, 4, 5]

intArray.publisher
    .subscribe(IntSubscriber())

print("----------------------------------Just-------------------------------------")

let just = Just("This is Output")
just
    .sink { completion in
        print("received completion: \(completion)")
    } receiveValue: { value in
        print("received value: \(value)")
    }

