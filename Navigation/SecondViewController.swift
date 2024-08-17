//
//  SecondViewController.swift
//  Navigation
//
//  Created by Finartz on 23.07.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblCollectionName: UILabel!
    @IBOutlet weak var lblCollectionPrice: UILabel!
    @IBOutlet weak var imgArtist: UIImageView!
    
    var result: ResultData?
    
    var textOne = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateScreen()
    }
    func getLabels(product: ResultData) {
        result = product
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func updateScreen() {
        
            
        
            self.lblArtistName.text = ("Artist Name: ") + (self.result?.artistName ?? "")
            self.lblCollectionName.text = ("Collection Name: ") + (self.result?.collectionName ?? "")
            self.lblCollectionPrice.text = ("Collection Price: ") + ("\(String(describing: self.result?.collectionPrice))")
        
            if let imgString = self.result?.artworkUrl100,
           let imageUrl = URL(string: imgString) {
            self.getData(from: imageUrl) {
                data, response, error in
                if let error {
                    self.imgArtist = nil
                }
                if let data = data,
                    let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imgArtist.layer.cornerRadius = self.imgArtist.frame.size.width / 2
                        self.imgArtist.layer.masksToBounds = true
                        self.imgArtist.image = image
            
                    }
                }
            }
        }
        else {
            self.imgArtist.image = nil
//            print("No Image Found for cell: \(indexPath.item)")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
