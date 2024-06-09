import Foundation

extension String {

    var date: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: self) else { return nil }

        return date
    }

}
