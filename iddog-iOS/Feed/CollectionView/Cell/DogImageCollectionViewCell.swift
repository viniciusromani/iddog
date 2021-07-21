import UIKit
import Kingfisher

class DogImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dogImageView: UIImageView!
    static var identifier = "kDogImageCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configure()
    }
    
    private func configure() {
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.black.cgColor
        
        self.dogImageView.contentMode = .scaleAspectFill
    }
}

extension DogImageCollectionViewCell {
    func set(image: URL) {
        self.dogImageView.kf.setImage(with: image, options: [.transition(.fade(0.4))])
    }
}
