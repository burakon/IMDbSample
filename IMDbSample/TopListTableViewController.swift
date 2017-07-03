//
//  TopListTableViewController.swift
//  IMDbSample
//
//  Created by Reiko Goto on 2017/07/03.
//  Copyright © 2017年 Her. All rights reserved.
//

import UIKit

class TopListTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var model  : TopListViewMadel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TopListViewCell", bundle: nil), forCellReuseIdentifier: "TopListViewCell")
    }
    /// ナビゲーションバーの透過処理
    ///
    /// - Parameter position: <#position description#>
    func setNavigationBarFromPosition(position: CGFloat) {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopListViewCell") as! TopListViewCell
        let showHeight = cell.frame.height * 2
        let alpha = Double(position / showHeight)
        //set alpha
        let tabColor = (UIColor.lightGray).withAlphaComponent(CGFloat(alpha))
        self.navigationController?.navigationBar.backgroundColor = tabColor
        UIApplication.shared.statusBarView?.backgroundColor = tabColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : (UIColor.white).withAlphaComponent(CGFloat(alpha - 1))]
        if alpha < 1 {
            self.navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            self.navigationController?.navigationBar.shadowImage = nil
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBarFromPosition(position: 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
extension TopListTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "TopListViewCell")  as? TopListViewCell
//        cell?.setModel(model: model)
        return cell!
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = tableView.contentOffset
        setNavigationBarFromPosition(position: offset.y)
    }
}
