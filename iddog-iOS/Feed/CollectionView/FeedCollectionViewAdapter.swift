import UIKit

protocol FeedCollectionViewAdapterDelegate: AnyObject {
    
}

class FeedCollectionViewAdapter: NSObject {
    private let collection: UICollectionView
    private let delegate: FeedCollectionViewAdapterDelegate
    private var viewModel: [URL]?
    private let cellIdentifier = DogImageCollectionViewCell.identifier

    init(collection: UICollectionView,
         delegate: FeedCollectionViewAdapterDelegate) {
        self.collection = collection
        self.delegate = delegate

        super.init()

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10

        self.collection.collectionViewLayout = flowLayout
        self.collection.delegate = self
        self.collection.dataSource = self
        let nib = UINib(nibName: "DogImageCollectionViewCell", bundle: nil)
        self.collection.register(nib, forCellWithReuseIdentifier: self.cellIdentifier)
    }
}

extension FeedCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier,
                                                        for: indexPath) as? DogImageCollectionViewCell,
              let unwrapped = self.viewModel else {
            return UICollectionViewCell()
        }
        cell.set(image: unwrapped[indexPath.row])
        return cell
    }
}

extension FeedCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = CGFloat(250)
        let cellSpacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 10
        let halfOfWidth = (collectionView.bounds.width - (cellSpacing * 2)) / 2
        let size = CGSize(width: halfOfWidth - (cellSpacing * 2), height: cellHeight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellSpacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 10
        return UIEdgeInsets(top: 0,
                            left: cellSpacing * 2,
                            bottom: 0,
                            right: cellSpacing * 2)
    }
}

extension FeedCollectionViewAdapter {
    func set(images: [URL]) {
        self.viewModel = images
        self.collection.reloadAnimated()
    }
}
