import Foundation

enum Dog {
    case hound
    case pug
    case husky
    
    var apiValue: String {
        switch self {
        case .hound: return "hound"
        case .pug: return "pug"
        case .husky: return "husky"
        }
    }
    
    var readableValue: String {
        switch self {
        case .hound: return "Hound"
        case .pug: return "Pug"
        case .husky: return "Husky"
        }
    }
    
    static func all() -> [Dog] {
        return [.hound, .pug, .husky]
    }
}
