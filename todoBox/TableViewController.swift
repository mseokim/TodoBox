//
//  TableViewController.swift
//  todoBox
//
//  Created by 김민서 on 2017. 6. 4..
//  Copyright © 2017년 minseo. All rights reserved.
//

import UIKit

    var items = [String]()
    var itemImageFile = [String]()
    var itemSubIntro = [String]()
    var datePicker = [String]()

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemImageFile[(indexPath as NSIndexPath).row])
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemImageFile.remove(at: (indexPath as NSIndexPath).row)
            itemSubIntro.remove(at: (indexPath as NSIndexPath).row)
            datePicker.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemImageFile[(fromIndexPath as NSIndexPath).row]
        let itemSubToMove = itemSubIntro[(fromIndexPath as NSIndexPath).row]
        let itemDatePickerToMove = datePicker[(fromIndexPath as NSIndexPath).row]
        
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        itemSubIntro.remove(at: (fromIndexPath as NSIndexPath).row)
        datePicker.remove(at: (fromIndexPath as NSIndexPath).row)
        
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        itemSubIntro.insert(itemSubToMove, at: (to as NSIndexPath).row)
        datePicker.insert(itemDatePickerToMove, at: (to as NSIndexPath).row)
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for:cell)
            let detailView = segue.destination as! DetailViewController
            
            detailView.receiveItem(items[((indexPath as NSIndexPath?)?.row)!])
            detailView.receiveSub(itemSubIntro[((indexPath as NSIndexPath?)?.row)!])
            detailView.receiveTime(datePicker[((indexPath as NSIndexPath?)?.row)!])
        }
    }
    
}
