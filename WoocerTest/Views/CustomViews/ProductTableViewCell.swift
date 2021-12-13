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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configuration(productData : ProductsDataModel){
        if let url = URL(string:productData.images[0].src){
            self.productImage.load(url: url)
           }
        titleLabel.text = productData.name
        descriptionLabel.text = productData.name
        
    }
    
}
