//
//  ViewController.swift
//  ProductsApp
//
//  Created by Fatih Gümüş on 30.12.2023.
//

import UIKit

class Anasayfa: UIViewController {

     
    @IBOutlet weak var urunlerTableView: UITableView!
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        urunlerTableView.dataSource = self
        urunlerTableView.delegate = self
        
        let u1 = Urunler(id: 1, ad: "Macbook Pro", resim: "bilgisayar", fiyat: 48500)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 3250)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 5895)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 3750)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 9750)
        let u6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge", fiyat: 19850)
        let u7 = Urunler(id: 7, ad: "Iphone 13", resim: "telefon", fiyat: 36999)
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }


}

extension Anasayfa : UITableViewDelegate,UITableViewDataSource,HucreProtokol{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        
        // source : https://stackoverflow.com/questions/48984009/how-to-get-the-currency-formatter-with-decimal-and-grouping-separator-in-swift-u
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyAccounting
        formatter.locale = Locale(identifier: "TR")
        formatter.currencyCode = "TRY"
        //********************************************
        
        hucre.urunResim.image = UIImage(named: urun.resim!)
        hucre.urunAdLabel.text = urun.ad
        hucre.urunFiyatLabel.text = formatter.string(from: urun.fiyat! as NSNumber)
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaplan.layer.cornerRadius = 10
        
        hucre.selectionStyle = .none
        
        hucre.hucreProtokol = self
        hucre.indexPath = indexPath
        
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            contectualAction,view,bool in
            
            print("\(urun.ad!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            contectualAction,view,bool in
            
            print("\(urun.ad!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urun)
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let urun = sender as? Urunler{
               
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urunler = urun
            }
        }
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete gönderildi.")
    }
}

