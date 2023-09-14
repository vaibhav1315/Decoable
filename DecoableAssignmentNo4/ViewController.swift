//
//  ViewController.swift
//  DecoableAssignmentNo4
//
//  Created by Mac on 18/08/23.
//

import UIKit
import SDWebImage
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var usercollectionview: UICollectionView!
    private let urlstring = "https://reqres.in/api/users?page=2"
    var urlRequst : URLRequest?
    var jsonDecoder : JSONDecoder?
    var url : URL?
    private let reuseidentifierforcollectionviewcell = "UserCollectionViewCell"
    
    var Users : [User] = [User]()
                
    override func viewDidLoad() {
        super.viewDidLoad()
        url = URL(string: urlstring)
        urlRequst = URLRequest(url: url!)
        registerAnXIB()
        jsonparcing()
        
    }
    func registerAnXIB() {
        let uiNib = UINib(nibName: reuseidentifierforcollectionviewcell, bundle: nil)
        self.usercollectionview.register(uiNib, forCellWithReuseIdentifier: reuseidentifierforcollectionviewcell)
    }
    func jsonparcing() {
        URLSession.shared.dataTask(with: urlRequst!) { data , response , error  in
            
            print(error)
            print(response)
            
            let responserecived = try! JSONDecoder().decode(APIResponse.self, from: data!)
            self.Users = responserecived.data
            
            DispatchQueue.main.async {
                self.usercollectionview.reloadData()
            }
        }.resume()
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let UserCollectionViewCell = self.usercollectionview.dequeueReusableCell(withReuseIdentifier: reuseidentifierforcollectionviewcell, for: indexPath) as! UserCollectionViewCell
        
        UserCollectionViewCell.userlabelone.text = String(Users[indexPath.row].first_name)
        UserCollectionViewCell.userlabeltwo.text = String(Users[indexPath.row].last_name)
        
        let userimageString = Users[indexPath.row].avatar

        UserCollectionViewCell.userimageview.kf.setImage(with: URL(string: userimageString))
        
        return UserCollectionViewCell

        
    }
        
}

