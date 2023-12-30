//
//  urunlerHucre.swift
//  ProductsApp
//
//  Created by Fatih Gümüş on 30.12.2023.
//

import UIKit

class UrunlerHucre: UITableViewCell {

    @IBOutlet weak var hucreArkaplan: UIView!
    
    @IBOutlet weak var urunResim: UIImageView!
    
    @IBOutlet weak var urunAdLabel: UILabel!
        
    @IBOutlet weak var urunFiyatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sepeteEkleButton(_ sender: Any) {
    }
}
