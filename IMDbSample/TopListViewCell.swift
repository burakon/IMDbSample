import Foundation
import UIKit
class TopListViewCell: UITableViewCell {
    @IBOutlet weak var titleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setModel(model: TopListViewMadel){
//       print(model.text)
    }
}
