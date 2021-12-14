//
//  ViewController.swift
//  WoocerTest
//
//  Created by Mohsen on 12/12/21.
//

import UIKit
import RealmSwift

class MainViewController: MasterViewController {
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var tabelView: UITableView!
    var productsData : [ProductsDataModel]?
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability.isConnectedToNetwork(){
            try! realm.write {
                realm.deleteAll()
            }
        }else{
            return
        }
        

        let objectsRealmList = List<ProductRealmModel>()
        var obj = ProductRealmModel()
        for item in productsData!{
            obj = ProductRealmModel()
            obj.id = item.id
            obj.stockQuantity = item.stockQuantity ?? 0
            obj.name = item.name
            obj.price = item.price
            obj.image = item.images[0].src
            obj.desc = item.slug
            objectsRealmList.append(obj)
        }
        
//        productsData!.indices.forEach{
//            realmData[$0].id = productsData![$0].id
//            realmData[$0].name = productsData![$0].name
//            realmData[$0].image = productsData![$0].images[0].src
//            realmData[$0].price = productsData![$0].price
//            realmData[$0].desc = productsData![$0].slug
//        }

        print("Realm is located at:", realm.configuration.fileURL!)
        try! realm.write {
            realm.add(objectsRealmList)
        }
        
        DispatchQueue.main.async {
            let puppies = self.realm.objects(ProductRealmModel.self)
            print(puppies.count)
        }

        
    }

    override func setupUI() {
        tabelView.delegate = self
        tabelView.dataSource = self
        let productCell = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tabelView.register(productCell, forCellReuseIdentifier: "ProductTableViewCell")
        containView.roundCorners(corners: [.topLeft], radius: 25)
    }
}

extension MainViewController :  UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if productsData == nil{
        return self.realm.objects(ProductRealmModel.self).count//productsData != nil ? productsData?.count :
//        }else{
//            return productsData!.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell{
            let offlineData = try!  Realm().objects(ProductRealmModel.self)
            cell.configuration(offlineData[indexPath.row])
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

}
