import Foundation

struct SingUpResponse {
    let user: User
}

extension SingUpResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case user
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try container.decode(User.self, forKey: .user)
    }
}
