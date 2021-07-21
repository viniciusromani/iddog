import UIKit

protocol LoadableView {
    var activityIndicator: UIActivityIndicatorView { get }
    
    func showLoading()
    func hideLoading()
}

extension LoadableView where Self: UIView {
    func showLoading() {
        let loadingView = UIView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.backgroundColor = self.backgroundColor
        
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        loadingView.addSubview(self.activityIndicator)
        self.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: loadingView.topAnchor),
            self.leftAnchor.constraint(equalTo: loadingView.leftAnchor),
            self.rightAnchor.constraint(equalTo: loadingView.rightAnchor),
            self.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: self.activityIndicator.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: self.activityIndicator.centerYAnchor),
        ])

        self.bringSubviewToFront(loadingView)
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        guard let loadingView = self.activityIndicator.superview else {
            return
        }
        loadingView.removeFromSuperview()
    }
}

