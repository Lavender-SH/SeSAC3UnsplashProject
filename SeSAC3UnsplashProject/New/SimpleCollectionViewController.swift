//
//  SimpleCollectionViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이승현 on 2023/09/14.
//

import UIKit
import SnapKit
    
class SimpleCollectionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 2000
        case second = 1
    }
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    let viewModel = SimpleCollectionViewModel()
    // UICollectionViewListCell: 시스템 셀
    //var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    //⭐️
    var dataSource: UICollectionViewDiffableDataSource<Section, User>! //Int, Section 타입을 맞춰줘야함
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        configureDataSource()
       
        viewModel.list.bind { user in
            self.updateSnapshot()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.append()
        }
//        //⭐️
//        // UICollectionViewDiffableDataSource<Int, User> -> 같은 데이터 포맷을 유지해야함
//        var snapshot = NSDiffableDataSourceSnapshot<Int, User>()
//        //var snapshot = NSDiffableDataSourceSnapshot<Section, User>() //Int, Section 타입을 맞춰줘야함
//        //snapshot.appendSections(Section.allCases) // [first, second]
//        snapshot.appendSections([2000,1]) // 섹션은 2개 사용할거야!
//        //snapshot.appendSections([Section.first.rawValue, Section.second.rawValue])
//        snapshot.appendItems(list, toSection: 1) // 해당 섹션에 넣을 데이터.  인덱스패스 개념은 사라지고 배열의 숫자와 맞아야됨
//        snapshot.appendItems(list2, toSection: 2000)
//        //snapshot.appendItems(list, toSection: Section.second.rawValue)
//        //snapshot.appendItems(list2, toSection: Section.first.rawValue)
//
//        dataSource.apply(snapshot)
    }
    
    func updateSnapshot() {
        //UICollectionViewDiffableDataSource<Int, User> -> 같은 데이터 포맷을 유지해야함.
        var snapShot = NSDiffableDataSourceSnapshot<Section, User>()
        // 섹션은 한개 사용할거야! [0,1,2,3]
        // 섹션 번호는 겹치지만 않으면 어떠한 번호를 사용해도 상관 X
        snapShot.appendSections(Section.allCases)
        snapShot.appendItems(viewModel.list.value, toSection: .first)
        snapShot.appendItems(viewModel.list2, toSection: .second)
        //snapshot.appendItems(list) // 해당 섹션에 넣을 데이터
        dataSource.apply(snapShot)
    }
    
    static func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .lightGray
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configureDataSource() {
        //UICollectionViewListCell: 시스템 셀
        //UICollectionView.CellRegistration // iOS14, 메서드 대신 제네릭을 사용, 셀이 생성될 때마다 클로저가 호출
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User>(handler: { cell, indexPath, itemIdentifier in
            // 셀 디자인 및 데이터 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .black
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .systemRed
            content.prefersSideBySideTextAndSecondaryText = false // text <-> secondaryText: false(상하), true(좌우)
            content.textToSecondaryTextVerticalPadding = 20
            cell.contentConfiguration = content
            // Background Design
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .systemCyan
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemRed
            cell.backgroundConfiguration = backgroundConfig
        })
        
        //⭐️ cellForItemAt
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}

extension SimpleCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let user = viewModel.list.value[indexPath.item]
        guard let item = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        dump(item)
//        viewModel.removeUser(idx: indexPath.item)
    }
}

extension SimpleCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertUser(name: searchBar.text!)
    }
}




//extension SimpleCollectionViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(
//            using: cellRegistration,
//            for: indexPath,
//            item: list[indexPath.item]
//        )
//        return cell
//    }
//}










