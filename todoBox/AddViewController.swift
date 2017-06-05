//
//  AddViewController.swift
//  todoBox
//
//  Created by 김민서 on 2017. 6. 4..
//  Copyright © 2017년 minseo. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var pickTime: UILabel!
    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var tfAddSub: UITextField!
    @IBOutlet weak var dpAddDate: UIDatePicker!
    @IBOutlet weak var lblAlarm: UILabel!
    @IBOutlet weak var switchAlarm: UISwitch!
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickTime.text = "시간을 선택해주세요"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchAlarm(_ sender: Any) {
        if (isOn) {
//            dpAddDate.alpha = 1.0
//            lblAlarm.alpha = 1.0
            dpAddDate.isHidden = false
            lblAlarm.isHidden = false
            pickTime.isHidden = false
            pickTime.text = "시간을 선택해주세요"
        } else {
//            dpAddDate.alpha = 0.0
//            lblAlarm.alpha = 0.0
            dpAddDate.isHidden = true
            lblAlarm.isHidden = true
            pickTime.isHidden = true
            pickTime.text = "헤헤"
        }
        isOn = !isOn
    }
    
    
    @IBAction func btnAddItem(_ sender: Any) {
        
        if (tfAddItem.text == "") {
            let dangerAlert = UIAlertController(title: "경고", message: "할 일을 적어주세요", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertActionStyle.default, handler: nil)
            
            dangerAlert.addAction(onAction)
            present(dangerAlert, animated: true, completion: nil)
        }
        
        else if (tfAddSub.text == "") {
            let dangerAlert = UIAlertController(title: "경고", message: "설명을 적어주세요\n(설명이 없다면 띄어쓰기만 눌러주세요)", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertActionStyle.default, handler: nil)
            
            dangerAlert.addAction(onAction)
            present(dangerAlert, animated: true, completion: nil)
        }
        
        else if (pickTime.text == "시간을 선택해주세요") {
            let dangerAlert = UIAlertController(title: "경고", message: "시간을 선택해주세요\n(또는, 알람 스위치를 off해주세요)", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertActionStyle.default, handler: nil)
            
            dangerAlert.addAction(onAction)
            present(dangerAlert, animated: true, completion: nil)
        }
        
        else {
        items.append(tfAddItem.text!)
        tfAddItem.text = ""
//        itemImageFile.append("clock.png")
        itemSubIntro.append(tfAddSub.text!)
        tfAddSub.text = ""
        if (isOn) {
            datePicker.append("설정하지 않음")
            itemImageFile.append("blank.png")

        } else {
            datePicker.append(pickTime.text!)
            itemImageFile.append("clock.png")

        }
        _ = navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func datePIcker(_ sender: UIDatePicker) {
        let datePikcerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:00 EEE"
        pickTime.text = formatter.string(from: datePikcerView.date)
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
