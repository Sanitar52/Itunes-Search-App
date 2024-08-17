//
//  FirstViewController.swift
//  Navigation
//
//  Created by Finartz on 23.07.2024.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtSearchField: UITextField!
    var viewModel = ItunesViewModel()
    let cellIdentifier = "ItemCellIdentifier"
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           tableView.register(UINib(nibName: "ItemCellTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        viewModel.delegate = self
           setupViewModel()
    }
    
    
    func goToSecondViewController(product: ResultData){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.getLabels(product: product)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
    
    @IBAction func btnSearcha() {
            guard let searchText = getValueFromSearchField() else {
                return
            }

            viewModel.searchTerm(term: searchText)
        }
    
    
    
    func getValueFromSearchField() -> String? {
        let txtfldText = txtSearchField.text
        if let text = txtfldText {
            return text
        }
        else {
            return nil
        }
    }
    

    func setupViewModel() {
            // Set up the closure to reload table view on data update
//            viewModel.onUpdate = { [weak self] in
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            }

            // Initial search
            viewModel.searchTerm(term: "Taylor")
        }
}
extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                                        for: indexPath) as! ItemCellTableViewCell
        cell.resultData = viewModel.products?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(viewModel.products?[indexPath.row].artistName)")
        goToSecondViewController(product: (viewModel.products?[indexPath.row])!)
    
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

extension FirstViewController: ItunesViewModelDelegate{
    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            
        
            self?.tableView.reloadData()
        }
    }
}
