//
//  DetailProductViewController.swift
//  NTTDATA
//
//  Created Luis Fernando Flores Rivera on 31/07/23.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailProductViewController: UIViewController {

    //MARK: - Protocol Properties
	var presenter: DetailProductPresenterProtocol?

    //MARK: - Properties
    var data : Product? = nil
    
    private lazy var button : UIButton = {
        let button = UIButton()
        button.setTitle("Regresar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .white
        button.layer.borderColor = UIColor(named: "Title")?.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(regresar), for: .touchUpInside)
        button.layer.backgroundColor = UIColor.white.cgColor
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
   private lazy var labelName : UILabel = {
        let label = UILabel()
       label.text = data?.title
        return label
    }()
    
    private lazy var labelDescripcion : UILabel = {
        let label = UILabel()
        label.text = data?.description
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Methods
    private func setupUI(){
        view.addSubview(imageView)
        imageView.addAnchorsAndCenter(centerX: true, centerY: false, width: 200, height: 200, left: nil, top: 100, right: nil, bottom: nil)
        view.addSubview(labelName)
        labelName.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: nil, left: nil, top: 24, right: nil, bottom: nil,withAnchor: .top,relativeToView: imageView)
        view.addSubview(labelDescripcion)
        labelDescripcion.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 20, right: 20, bottom: nil,withAnchor: .top, relativeToView: labelName)
        view.addSubview(button)
        button.addAnchorsAndSize(width: nil, height: 50, left: 30, top: 100, right: 50, bottom: nil, withAnchor: .top, relativeToView: labelDescripcion)
        
        if let urlString = data?.thumbnail as? String {
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else{
                        return }
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}

//MARK: - View Methods
extension DetailProductViewController: DetailProductViewProtocol {
    @objc func regresar(){
        print("regresar")
        self.navigationController?.popViewController(animated: true)
    }

    
}

//MARK: - Private functions
extension DetailProductViewController {
    
}
