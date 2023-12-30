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
        
        if let u = urunler{
            self.navigationItem.title = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            urunFiyatLabel.text = "\(u.fiyat!) ₺"
        }


    }
    
    @IBAction func sepeteEkle(_ sender: Any) {
        if let u = urunler{
            print("Detay sayfa: \(u.ad!) ürün sepete eklendi")
        }
    }
    


}
