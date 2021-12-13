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
            cell.selectionStyle = .none
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = Storyboard.Main.viewController(name: ProductDetailsViewController.self)
//        detailVC.detailData = productsData![indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    @IBOutlet weak var tabelView: UITableView!
    var productsData : [ProductsDataModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func setupUI() {
        tabelView.delegate = self
        tabelView.dataSource = self
        
//        tabelView.layer.cornerRadius = 25
//        tabelView.layer.masksToBounds = true
        //register tableview
        let productCell = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tabelView.register(productCell, forCellReuseIdentifier: "ProductTableViewCell")
    }

}

