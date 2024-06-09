import Foundation

extension Date {

    var modifiedAt: String {
        var modifiedAt: String = ""

        if Calendar.current.isDate(self, inSameDayAs: .now) {
            modifiedAt = "Today"
        } else if Calendar.current.isDate(self, equalTo: .now, toGranularity: .weekOfMonth) {
            modifiedAt = "This week"
        } else if Calendar.current.isDate(self, equalTo: .now, toGranularity: .month) {
            modifiedAt = "This month"
        } else if Calendar.current.isDate(self, equalTo: .now, toGranularity: .year) {
            modifiedAt =  "This year"
        } else {
            let components = Calendar.current.dateComponents(
                [.year, .month, .weekOfYear, .day, .hour, .minute, .second],
                from: self,
                to: Date())

            let year = components.year ?? .zero

            if year > .zero {
                if year > 1 {
                    modifiedAt = "\(year) years ago"
                } else {
                    modifiedAt = "\(year) year ago"
                }

            }
        }

        return modifiedAt
    }

}
