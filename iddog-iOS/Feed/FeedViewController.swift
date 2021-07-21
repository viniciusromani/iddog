import UIKit

protocol FeedViewProtocol: AnyObject {
    func dogSorted(_ dog: Dog)
    func sortedDogIsSame(_ message: String)
    func set(dog: Dog)
    
    func imagesFetched(_ images: [URL])
    func errorFetchingImages(_ message: String)
}

class FeedViewController: UIViewController {
    private let viewModel: FeedViewModel
    
    @IBOutlet weak var dogLabel: UILabel!
    @IBOutlet weak var sortButton: LoadableUIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dogImagesCollectionView: UICollectionView!
    
    private lazy var adapter = FeedCollectionViewAdapter(collection: self.dogImagesCollectionView,
                                                         delegate: self)
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        self.viewModel.sortDog()
    }
    
    private func configure() {
        self.navigationItem.title = "Dog Images"
        
        self.sortButton.layer.cornerRadius = 4
        self.sortButton.layer.masksToBounds = true
    }
    
    private func displayLoadingState() {
        self.statusLabel.text = ""
        self.sortButton.showLoading()
    }
    
    private func removeLoadingState() {
        self.statusLabel.text = ""
        self.sortButton.hideLoading()
    }
    
    @IBAction func sortTapped(_ sender: UIButton) {
        self.displayLoadingState()
        
        self.viewModel.sortDog()
    }
}

extension FeedViewController: FeedViewProtocol {
    func dogSorted(_ dog: Dog) {
        self.viewModel.retrieveImages(for: dog)
    }
    
    func sortedDogIsSame(_ message: String) {
        self.removeLoadingState()
        
        self.statusLabel.textColor = .primary
        self.statusLabel.text = message
    }
    
    func set(dog: Dog) {
        self.removeLoadingState()
        
        self.dogLabel.text = dog.readableValue
    }
    
    func imagesFetched(_ images: [URL]) {
        self.removeLoadingState()
        
        self.adapter.set(images: images)
    }
    
    func errorFetchingImages(_ message: String) {
        self.removeLoadingState()
        
        self.statusLabel.textColor = .red
        self.statusLabel.text = message
    }
}

extension FeedViewController: FeedCollectionViewAdapterDelegate {
    
}
