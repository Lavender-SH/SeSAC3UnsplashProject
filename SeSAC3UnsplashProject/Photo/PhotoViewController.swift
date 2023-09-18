//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let viewModel = PhotoViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        collectionView.collectionViewLayout = createLayout()
        
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.updateSnapshot()
            }
        }
        
        configureDataSource()
        updateSnapshot()
        
        
//        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
//        self.navigationController?.navigationBar.isHidden = false
//        searchBar.barTintColor = .blue
//        searchBar.tintColor = .white


    }
    
    private func configureDataSource() {
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, PhotoResult> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = "\(itemIdentifier.likes)"
            
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    content.image = UIImage(data: data!)
                    cell.contentConfiguration = content
                }
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.list.value.results)
        dataSource.apply(snapshot)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .lightGray
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}

extension PhotoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchPhoto(text: searchBar.text!)
    }
}
