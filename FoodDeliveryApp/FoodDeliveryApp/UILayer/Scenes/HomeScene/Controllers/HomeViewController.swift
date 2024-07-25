//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Дарья Балацун on 9.04.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let searchField = FDSearchField()
    private let geoMarkImage = UIImageView()
    private let geoLabel = UILabel()
    
    lazy var smallHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        return collection
    }()

    lazy var bigHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        return collection
    }()
    
    lazy var bigVCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.tag = 3
        return collection
    }()
    
    func calculateContentSize() {
        var totalHeight: CGFloat = 400 + smallHCollection.bounds.height + bigHCollection.bounds.height
        for index in 0..<bigVCollection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: index, section: 0)
            let cellHieght = collectionView(bigVCollection, layout: bigHCollection.collectionViewLayout, sizeForItemAt: indexPath).height
            totalHeight += cellHieght
        }
        
        let spacing = CGFloat(bigHCollection.numberOfItems(inSection: 0) - 1) * 30
        contentView.heightAnchor.constraint(equalToConstant: totalHeight + spacing).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
    }
}
// MARK: - Layout
extension HomeViewController {
    func setupLayout() {
        setupScrollView()
        setupContentView()
        setupSearchFiew()
        setupLabel()
        setupSmallHCollection()
        setupBigHCollection()
        setupBigVCollection()
        calculateContentSize()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func  setupSearchFiew() {
        contentView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            searchField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupLabel() {
        contentView.addSubview(geoLabel)
        contentView.addSubview(geoMarkImage)
        geoMarkImage.translatesAutoresizingMaskIntoConstraints = false
        geoLabel.translatesAutoresizingMaskIntoConstraints = false
        geoLabel.text = "9 West 46 Th Street, New York City"
        geoMarkImage.image = UIImage(resource: .pin1)
        
        NSLayoutConstraint.activate([
            geoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            geoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            geoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            geoLabel.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    func setupSmallHCollection() {
        contentView.addSubview(smallHCollection)
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        smallHCollection.backgroundColor = .red
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCViewCell.self, forCellWithReuseIdentifier: "SmallHCViewCell")
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            smallHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            smallHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            smallHCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    func setupBigHCollection() {
        contentView.addSubview(bigHCollection)
        bigHCollection.translatesAutoresizingMaskIntoConstraints = false
        bigHCollection.backgroundColor = .red
        bigHCollection.delegate = self
        bigHCollection.dataSource = self
        bigHCollection.register(BigHViewCell.self, forCellWithReuseIdentifier: "BigHViewCell")
        
        NSLayoutConstraint.activate([
            bigHCollection.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 50),
            bigHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bigHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollection.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func setupBigVCollection() {
        contentView.addSubview(bigVCollection)
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        bigVCollection.backgroundColor = .red
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigHViewCell.self, forCellWithReuseIdentifier: "BigHViewCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: bigHCollection.bottomAnchor, constant: 50),
            bigVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollection.heightAnchor.constraint(equalToConstant: 1000),
            bigVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
                
// MARK: - CollectionView delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return 30
        case 2:
            return 15
        case 3:
            return 20
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCViewCell", for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHViewCell", for: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHViewCell", for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        } 
    }
}
  
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 70, height: 91)
        case 2:
            return CGSize(width: 130, height: 130)
        case 3:
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 130)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
                                          
                                          
                                    
