import UIKit

class MessageDecryptor: NSObject {

    func decryptMessage(_ message: String) -> String {
        if (message.count <= 1 && message.count >= 60) {
            return "nil"
        }
        var unshifr = message
        while let ourRang = unshifr.range(of: #"[0-9]+\[[a-z]+\]"#, options: .regularExpression){
            var index = ourRang.lowerBound
            var couner = ""
            var str = ""

            while index != ourRang.upperBound {
                if unshifr[index].isNumber {
                    couner.append(unshifr[index])
                } else if unshifr[index].isLetter {
                    str.append(unshifr[index])
                }
                index = unshifr.index(after: index)
            }
            let count = Int(couner) ?? 0
            if count < 1 || count > 300  {
                return ""
            }
            unshifr.removeSubrange(ourRang)
            unshifr.insert(contentsOf: String.init(repeating: str, count: count), at: ourRang.lowerBound)
        }
        if let range = unshifr.range(of: #"[a-z]+"#, options: .regularExpression) {
            return String(unshifr[range.lowerBound ... unshifr.index(before: (range.upperBound))])
        }
        return ""
    }
}
