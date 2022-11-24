//
//  DetailViewController.swift
//  DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 12/11/22.
//

import UIKit

//MARK: - PROTOCOLO -
protocol DetailViewProtocol: AnyObject {
    func updateView(data: HomeCellModel)
}


//MARK: - CLASE -
class DetailViewController: UIViewController {

    @IBOutlet weak var heroeDescription: UITextView!
    @IBOutlet weak var heroeName: UILabel!
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeVillain: UILabel!
    
    var viewModel: DetailViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.onViewsLoaded()
    }
    
}

//MARK: - EXTENSION -
extension DetailViewController: DetailViewProtocol {
    //FUNCION CARGA DESCRIPTION
    private func update(description: String?) {
        heroeDescription.text = description
    }
    //FUNCION CARGA IMAGE
    private func update(image: String?) {
        heroeImage.image = UIImage(named: image ?? "")
    }
    //FUNCION CARGA NAME
    private func update(name: String?) {
        heroeName.text = name
    }
    //FUNCIO CARGA VILLAIN-HEROE
    private func update(type: Bool) {
        if type == true {
            heroeVillain.text = "VILLANO"
        }else {
            heroeVillain.text = "HEROE"
        }
    }
    //FUNCION CARGAR
    func updateView(data: HomeCellModel) {
        update(name: data.name)
        update(image: data.image)
        update(description: data.description)
        update(type: data.isVillain)
    }
}
