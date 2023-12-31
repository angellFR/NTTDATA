//
//  HomeViewController.swift
//  NTTDATA
//
//  Created Luis Fernando Flores Rivera on 31/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Protocol Properties
	var presenter: HomePresenterProtocol?
    private var dataSource : dataInfo?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Productos"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        label.textAlignment = .center
        label.textColor = UIColor(named: "Title")
        return label
    }()
    private lazy var stackViewTitle: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    //MARK: - Properties
    
    //MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        presenter?.getInitData()
    }
    
    //MARK: - Methods

func setupUI(){
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(stackViewTitle)
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableView.topAnchor.constraint(equalTo: stackViewTitle.bottomAnchor,constant: 5),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
    ])
  
    stackViewTitle.addAnchorsAndSize(width: width, height: 24, left: nil, top: 70, right: nil, bottom: nil)
    stackViewTitle.addArrangedSubview(labelTitle)
    labelTitle.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: nil, left: nil, top: nil, right: nil, bottom: nil)
}
}


//MARK: - View Methods
extension HomeViewController: HomeViewProtocol {
    func dataSource(data: dataInfo) {
        print("data:::: \(data)")
        dataSource = data
        tableView.reloadData()
    }

}

//MARK: - Private functions
extension HomeViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        guard let name = dataSource?.products[indexPath.row].title else { return cell}
        guard let precio = dataSource?.products[indexPath.row].price else { return cell}
        cell.labelName.text = "Nombre: \(name)"
        cell.labelDescripcion.text = dataSource?.products[indexPath.row].description
        cell.labelPrecio.text = "Prrecio: $\(precio)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detalle = dataSource?.products[indexPath.row] else { return }
        presenter?.nextView(info: detalle)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    

}
