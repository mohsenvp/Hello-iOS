//
//  ProductTableViewCell.swift
//  WoocerTest
//
//  Created by Mohsen on 12/13/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 25
        productImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configuration(_ offData : ProductRealmModel){
//        if productData != nil {
//            if let url = URL(string:productData.images[0].src){
//                self.productImage.load(url: url)
//               }
//            titleLabel.text = productData.name
//            descriptionLabel.text = productData.slug
//
//            inStockLabel.text = productData.stockQuantity ?? 0 > 0 ? "In Stock" : "Out Of Stuck"
//            inStockLabel.textColor = productData.stockQuantity ?? 0 > 0 ? .green : .red
//            priceLabel.text = productData.price
            
//        }else{
            if let url = URL(string:offData.image){
                self.productImage.load(url: url)
               }
            titleLabel.text = offData.name
            descriptionLabel.text = offData.desc

            inStockLabel.text = offData.stockQuantity ?? 0 > 0 ? "In Stock" : "Out Of Stuck"
            inStockLabel.textColor = offData.stockQuantity ?? 0 > 0 ? .green : .red
            priceLabel.text = offData.price
//
//        }

        
    }
    
}
