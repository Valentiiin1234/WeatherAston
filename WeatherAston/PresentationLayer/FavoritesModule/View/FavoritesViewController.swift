//
//  FavoritesViewController.swift
//  WeatherAston
//
//  Created by Mac on 10.11.2023.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 40, right: 15)
        layout.scrollDirection = .vertical
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: CityCell.cellIdentifier)
        return collectionView
    }()
    
    private var cities: [EntityCity] = []

    private let viewModel: FavoritesViewOutput
    
    init(viewModel: FavoritesViewOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.showCities()
    }
    //MARK: - setupUI
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.title = "Favorites City"
        view.backgroundColor = .systemBackground

    }
    //MARK: - setupConstraints
    private func setupConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
//MARK: - FavoritesViewInput
extension FavoritesViewController: FavoritesViewInput {
  
    func setupCities(cities: [EntityCity]) {
        self.cities = cities
        collectionView.reloadData()
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCell.cellIdentifier, for: indexPath) as? CityCell else {return UICollectionViewCell()}
        let city = cities[indexPath.row]
       
        viewModel.getTemperature(for: city.name ?? "")
        cell.settingCell(with: city)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeWidth = view.frame.width / 2 - 30
        let sizeHeight = view.frame.height / 7.4
        return CGSize(width: sizeWidth, height: sizeHeight)
    }
}
