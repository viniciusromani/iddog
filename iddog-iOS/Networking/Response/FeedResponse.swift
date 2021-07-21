import Foundation

struct FeedResponse {
    let images: [String]
}
//{"category":"husky","list"
extension FeedResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case images = "list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.images = try container.decode([String].self, forKey: .images)
    }
}


//struct FeedResponse: Decodable {
    // O seguinte JSON é um exemplo de resposta do endpoint "/feed". Como decodificá-lo?
    
    /*
     {
       "images": [
            "http://xpto.com/img1.png",
            "http://xpto.com/img2.png",
            "http://xpto.com/img3.png"
        ]
     }
     */

    // Lembre-se que estas URLs são imagens que devem ser renderizadas em células de uma UICollectionView.
//}
