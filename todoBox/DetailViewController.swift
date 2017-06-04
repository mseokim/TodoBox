//
//  DetailViewController.swift
//  todoBox
//
//  Created by 김민서 on 2017. 6. 4..
//  Copyright © 2017년 minseo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let timeSelector: Selector = #selector(DetailViewController.updateTime)
    let interval = 1.0
    let count = 0
    
    var receiveItem = ""
    var receiveSub = ""
    var receiveTime = ""

    @IBOutlet weak var lblAddItem: UILabel!
    @IBOutlet weak var lblAddSub: UILabel!
    @IBOutlet weak var lblAddDate: UILabel!
    @IBOutlet weak var lblCurrenTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblAddItem.text = receiveItem
        lblAddSub.text = receiveSub
        lblAddDate.text = receiveTime
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        lblCurrenTime.textColor = .white
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
    
    func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrenTime.text = formatter.string(from: date as Date)
        
        if(lblCurrenTime.text == lblAddDate.text)
        {
            let alarmAlert = UIAlertController(title: "알람", message: "설정하신 시간입니다", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "알람 확인", style: UIAlertActionStyle.default, handler: nil)
            alarmAlert.addAction(onAction)
            present(alarmAlert, animated: true, completion: nil)
        }
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
