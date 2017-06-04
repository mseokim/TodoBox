//
//  DetailViewController.swift
//  todoBox
//
//  Created by 김민서 on 2017. 6. 4..
//  Copyright © 2017년 minseo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    var receiveSub = ""
    var receiveTime = ""

    @IBOutlet weak var lblAddItem: UILabel!
    @IBOutlet weak var lblAddSub: UILabel!
    @IBOutlet weak var lblAddDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblAddItem.text = receiveItem
        lblAddSub.text = receiveSub
        lblAddDate.text = receiveTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveItem(_ item: String)
    {
        receiveItem = item
    }
    
    func receiveSub(_ sub:String)
    {
        receiveSub = sub
    }
    
    func receiveTime(_ time: String)
    {
        receiveTime = time
    }
    
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
    }
*/

}
