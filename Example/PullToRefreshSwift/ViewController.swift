//
//  PullToRefreshConst.swift
//  PullToRefreshSwift
//
//  Created by Yuji Hato on 12/11/14.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var texts = ["Swift", "Java", "Objective-C", "Perl", "C", "C++", "Ruby", "Javascript", "Go", "PHP", "Python", "Scala"]
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        self.tableView.addPullToRefresh({ () -> () in
            // some code
            sleep(1)
            self.texts.shuffle()
            self.tableView.reloadData()
            self.tableView.stopPullToRefresh()
            println("Completed")
        })
    }
    
    override func viewDidAppear(animated: Bool) {
       
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.font = UIFont.italicSystemFontOfSize(18)
        cell.textLabel?.textColor = UIColor(red: 44/255, green: 62/255, blue: 88/255, alpha: 1.0)
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
    
}

