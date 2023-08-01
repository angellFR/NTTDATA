//
//  TableViewCell.swift
//  NTTDATA
//
//  Created by Luis Fernando Flores Rivera on 31/07/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var labelName : UILabel = {
        let label = UILabel()
        label.text = "NOMBRE"
        return label
    }()
    
    var labelPrecio : UILabel = {
        let label = UILabel()
        label.text = "Precio"
        return label
    }()
    
    var labelDescripcion : UILabel = {
        let label = UILabel()
        label.text = "Descripcion"
        label.numberOfLines = 0
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        // Configure the view for the selected state
    }
    
    func setupUI(){
        
        addSubview(labelName)
        labelName.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 5, right: nil, bottom: nil)
        addSubview(labelDescripcion)
        labelDescripcion.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 5, right: 10, bottom: nil, withAnchor: .top, relativeToView: labelName)
        addSubview(labelPrecio)
        labelPrecio.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 5, right: nil, bottom: 0, withAnchor: .top, relativeToView: labelDescripcion)
        
    }

}
