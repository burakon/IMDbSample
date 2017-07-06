//
//  TopListTableViewController.swift
//  IMDbSample
//
//  Created by Reiko Goto on 2017/07/03.
//  Copyright © 2017年 Her. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class TopListTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var model  : [TopListViewMadel] = []
    var cellHeight : CGFloat?
    //    let usecase = TopListeUseCase.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopListViewCell", bundle: nil), forCellReuseIdentifier: "TopListViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopListViewCell") as! TopListViewCell
        cellHeight = cell.frame.height
        setNavigationBarFromPosition(position: 0, height: cellHeight!)
        //通信
        Alamofire.request("http://sg.media-imdb.com/suggests/c/Cinderella.json").responseString { response in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            if let str = response.result.value{
                //いらない文字列削除
                let json = str[str.index(str.startIndex, offsetBy: 16)..<str.index((str.endIndex), offsetBy: -1)]
                let jsonData = json.data(using: String.Encoding.utf8)!
                let data = JSON(data: jsonData)
                let all = (data["d"])
                
                all.enumerated().forEach {
                    let detailModel = TopListViewMadel.init(data: (all[$0.0]))
                    self.model.append(detailModel)
                }
                self.tableView.reloadData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension TopListTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopListViewCell")  as? TopListViewCell
        cell?.setModel(model: model[indexPath.row])
        return cell!
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = tableView.contentOffset
        if let height = cellHeight {
            setNavigationBarFromPosition(position: offset.y, height: height)
        }
    }
}
