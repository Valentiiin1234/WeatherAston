//
//  TodayViewController.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import UIKit


final class TodayViewController: UIViewController, UISearchBarDelegate {
    
    var city: City!

    let label = UILabel()
    
    private let searchController = UISearchController()
    
    private let viewModel: TodayViewOutput
    
    init(viewModel: TodayViewOutput) {
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
    
    //MARK: - setupUI
    private func setupUI(){
        view.addSubview(label)
        
        label.backgroundColor = .systemBackground
        label.text = "label city"
        
        view.backgroundColor = .black
        title = "Today"
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter city"
        searchController.searchBar.delegate = self
        
       
        
    }
    //MARK: - setupConstraints
    func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    //MARK: - MethodsDelegate
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {return}
        viewModel.display(for: text)
    }
}

//MARK: - TodayViewInput
extension TodayViewController: TodayViewInput {
   
    
    
}








