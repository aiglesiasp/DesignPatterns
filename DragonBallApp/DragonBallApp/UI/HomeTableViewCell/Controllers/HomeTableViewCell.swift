//
//  HomeTableViewCell.swift
//  DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 12/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var heroeIsVillain: UILabel!
    @IBOutlet weak var heroeDescription: UILabel!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        heroeImage.layer.cornerRadius = 25.0
    }
    
    //LIMPIA AL USAR LA CELDA
    override func prepareForReuse() {
        heroName.text = nil
        heroeDescription.text = nil
        heroeImage.image = nil
        heroeIsVillain.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //FUNCION PARA CARGAR VISTAS CUANDO ME PASEN DATOS
    func updateViews(data: HomeCellModel) {
        update(name: data.name)
        update(image: data.image)
        update(isVillain: data.isVillain)
        update(description: data.description)
    }
    
    //FUNCION CARGA DESCRIPTION
    private func update(isVillain: Bool) {
        if isVillain == true {
            heroeIsVillain.text = "VILLANO"
            heroeIsVillain.backgroundColor = .red
        }else {
            heroeIsVillain.text = "HEROE"
            heroeIsVillain.backgroundColor = .green
        }
    }
    //FUNCION CARGA IMAGE
    private func update(image: String?) {
        heroeImage.image = UIImage(named: image ?? "")
    }
    //FUNCION CARGA NAME
    private func update(name: String?) {
        heroName.text = name
    }
    
    private func update(description: String?) {
        heroeDescription.text = description
    }
    
}
