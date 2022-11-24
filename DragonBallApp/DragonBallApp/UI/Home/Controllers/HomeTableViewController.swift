//
//  HomeTableViewController.swift
//  DragonBallApp
//
//  Created by Aitor Iglesias Pubill on 12/11/22.
//

import UIKit

//MARK: - PROTOCOLO -
protocol HomeTableViewProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with data: HomeCellModel?)
}



//MARK: - CLASE -
class HomeTableViewController: UITableViewController {
        
    //Para conectar la vista con el viewmodel
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: REGITRAR CELDA
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "HomeTableViewCell")
        
        //Le digo al viewModel que se ha cargado la vista
        viewModel?.onViewsLoaded()
        
    }

    // MARK: - Table view data source

    //MARK: Numero secciones
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //MARK: Numero de Rows por seccion
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.dataCount ?? 0
    }

    //MARK: formato de celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Casteamos que sea nuestro tipo de celda
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        
        if let data = viewModel?.data(for: indexPath.row) {
            cell.updateViews(data: data)
        }
        
        //COMPROVAR QUE SEA DE NUESTRO TIPO

        return cell
    }
    
    
    //MARK: Pasar a la siguiente pantalla
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel?.onItemSelected(at: indexPath.row)
        
    }
    
}


//MARK: - EXTENSION -
extension HomeTableViewController: HomeTableViewProtocol {
    func updateViews() {
        tableView.reloadData()
    }
    
    
    func navigateToDetail(with data: HomeCellModel?) {
        let nextVC = DetailViewController()
        guard let data = data else {return}
        nextVC.viewModel = DetailViewModel(data: data, viewDelegate: nextVC)
        //TODO: Pasar dato al detalle
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
