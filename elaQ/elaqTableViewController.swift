//
//  elaqTableViewController.swift
//  elaQ
//
//  Created by ビ ユウ on 2018/11/10.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class elaqTableViewController: UITableViewController {
    var articles: [boArticle] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MenuInfoCell", bundle: nil), forCellReuseIdentifier: "MenuInfoCell")
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNewData() {
        NetWorkUtil.testPost(txid: ["6A34F0F0A6D5F9F4EFC481587143CFC0100811911CD67B3DA98663FB609A8493"],completion: {ariticle in
            self.generateNewData(newData: ariticle)
        })
    }
    
    func generateNewData(newData: boArticle) {
        print(newData)
        articles.append(newData)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuInfoCell", for: indexPath) as! MenuInfoCell
        
        // Configure the cell...
        cell.configureCell(entity: articles[indexPath.row])
        return cell
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        getNewData()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        
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
