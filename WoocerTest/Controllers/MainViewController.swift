//
//  ViewController.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import UIKit

class MainViewController: MasterViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell{
            cell.configuration(productData: productsData![indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    

    @IBOutlet weak var tabelView: UITableView!
    var productsData : [ProductsDataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func setupUI() {
        tabelView.delegate = self
        tabelView.dataSource = self
        
        //register tableview
        let productCell = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tabelView.register(productCell, forCellReuseIdentifier: "ProductTableViewCell")
    }

}

