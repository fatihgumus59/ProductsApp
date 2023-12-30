//
//  DetaySayfa.swift
//  ProductsApp
//
//  Created by Fatih Gümüş on 30.12.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var urunFiyatLabel: UILabel!
    
    var urunler : Urunler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // source : https://stackoverflow.com/questions/48984009/how-to-get-the-currency-formatter-with-decimal-and-grouping-separator-in-swift-u
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyAccounting
        formatter.locale = Locale(identifier: "TR")
        formatter.currencyCode = "TRY"
        //********************************************
        
        
        if let u = urunler{
            self.navigationItem.title = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            urunFiyatLabel.text = formatter.string(from: u.fiyat! as NSNumber)
        }


    }
    
    @IBAction func sepeteEkle(_ sender: Any) {
        if let u = urunler{
            print("Detay sayfa: \(u.ad!) ürün sepete eklendi")
        }
    }
    


}
