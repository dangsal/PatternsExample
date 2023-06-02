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
print("--------------------------------------------------------------------")
// -----------------------------------------------------------------------------------------
class DangsalSubscriber: Subscriber {
    typealias Input = String
    
    typealias Failure = Never
    
    // subscriber에게 publisher 를 성공적으로 구독했음을 알리고 item을 요청 할 수 있음
    func receive(subscription: Subscription) {
        print("구독 시작")
        subscription.request(.unlimited)
    }
    // subsriber에게 publisher 가 element를 생성했음을 알림
    func receive(_ input: String) -> Subscribers.Demand {
        print("\(input)")
        return .none
    }
    // subscriber에게 publisher가 정상적으로 또는 오류로 publish를 완료했음을 알림
    func receive(completion: Subscribers.Completion<Never>) {
        print("완료", completion)
    }
}

let name = Just("Lee Sung Ho")
name.subscribe(DangsalSubscriber())
