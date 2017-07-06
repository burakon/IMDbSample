import Foundation
import UIKit
import AlamofireImage
class TopListViewCell: UITableViewCell {
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setModel(model: TopListViewMadel){
        guard let imageURL = URL(string: model.imageUrl) else {return}
        titleLabel.text = model.s
        titleImageView.af_setImage(withURL: imageURL)
    }
}
