//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Doğukan Aydemir on 15.11.2022.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    
    @IBOutlet var userEmailLabel: UILabel!
    
    @IBOutlet var commentLabel: UILabel!
    
    @IBOutlet var likeLabel: UILabel!
    
    @IBOutlet var userImageView: UIImageView!
    
    @IBOutlet var documentIdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let firestoreDatabase = Firestore.firestore()
        if let likeCount = Int(likeLabel.text!) {
            let
            likeStore = ["likes" : likeCount + 1] as [String : Any]
            firestoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
    }
}
