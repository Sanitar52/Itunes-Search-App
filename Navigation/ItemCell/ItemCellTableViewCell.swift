//
//  ItemCellTableViewCell.swift
//  TableViewTest
//
//  Created by Finartz on 22.07.2024.
//

import UIKit

class ItemCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblCollectionName: UILabel!
    @IBOutlet weak var imgVwArtistView: UIImageView!
    @IBOutlet weak var lblCollectionPrice: UILabel!
    
    var resultData: ResultData? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        lblArtistName.text = resultData?.artistName
        lblCollectionName.text = resultData?.collectionName
        lblCollectionPrice.text = "\(resultData?.collectionPrice ?? 0.0)"
        
        if let imgString = resultData?.artworkUrl100,
           let imageUrl = URL(string: imgString) {
            self.getData(from: imageUrl) {
                data, response, error in
                if let error {
                    self.imgVwArtistView = nil
                }
                if let data = data,
                    let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imgVwArtistView.layer.cornerRadius = self.imgVwArtistView.frame.size.width / 2
                        self.imgVwArtistView.layer.masksToBounds = true
                        self.imgVwArtistView.image = image
            
                    }
                }
            }
        }
        else {
            self.imgVwArtistView.image = nil
//            print("No Image Found for cell: \(indexPath.item)")
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    
}
