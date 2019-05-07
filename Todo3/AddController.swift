//
//  AddController.swift
//  Todo3
//
//  Created by Kiyoto Ryuman on 2019/02/20.
//  Copyright © 2019 Kiyoto Ryuman. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    
    @IBOutlet weak var monday: UIButton!
    @IBOutlet weak var tuesday: UIButton!
    @IBOutlet weak var wednesday: UIButton!
    @IBOutlet weak var thursday: UIButton!
    @IBOutlet weak var friday: UIButton!
    @IBOutlet weak var saturday: UIButton!
    @IBOutlet weak var sunday: UIButton!
    
    static var  mondayContent = [String]()
    static var tuesdayContent = [String]()
    static var  wednesdayContent = [String]()
    static var thursdayContent = [String]()
    static var fridayContent = [String]()
    static var saturdayContent = [String]()
    static var sundayContent = [String]()
    
    var isMonday: Bool = false
    var isTuesday: Bool = false
    var isWednesday: Bool = false
    var isThursday: Bool = false
    var isFriday: Bool = false
    var isSaturday: Bool = false
    var isSunday: Bool = false
    @IBOutlet weak var TodoTextField: UITextField!
    var mondayViewControllerDelegate: MondayControllerDelegate!
    var tuesdayViewControllerDelegate: TuesdayControllerDelegate!
    var wednesdayViewControllerDelegate: WednesdayControllerDelegate!
    var thursdayViewControllerDelegate: ThursdayControllerDelegate!
    var fridayViewControllerDelegate: FridayControllerDelegate!
    var saturdayViewControllerDelegate: SaturdayControllerDelegate!
    var sundayViewControllerDelegate: SundayControllerDelegate!
    
    static var sendNumber: Int!
    @IBAction func monday(_ sender: Any) {
        if isMonday == false {
            isMonday = true
            monday.setTitle("ON", for: .normal)
        }else if isMonday == true{
            isMonday = false
             monday.setTitle("OFF", for: .normal)
        }
    }
    
    @IBAction func tuesday(_ sender: Any) {
        if isTuesday == false{
            isTuesday = true
            tuesday.setTitle("ON", for: .normal)
        }else{
            isTuesday = false
            tuesday.setTitle("OFF", for: .normal)
        }
    }
    
    @IBAction func wednesday(_ sender: Any) {
        if isWednesday == false{
            isWednesday = true
            wednesday.setTitle("ON", for: .normal)
        }else{
            isWednesday = false
            wednesday.setTitle("OFF", for: .normal)
        }
    }
    
    @IBAction func thursday(_ sender: Any) {
        if isThursday == false{
            isThursday = true
            thursday.setTitle("ON", for: .normal)
        }else{
            isThursday = false
            thursday.setTitle("OFF", for: .normal)
        }
    }
    
    
    @IBAction func friday(_ sender: Any) {
        if isFriday == false{
            isFriday = true
            friday.setTitle("ON", for: .normal)
        }else{
            isFriday = false
            friday.setTitle("OFF", for: .normal)
        }
    }
    
    @IBAction func saturday(_ sender: Any) {
        if isSaturday == false{
            isSaturday = true
            saturday.setTitle("ON", for: .normal)
        }else{
            isSaturday = false
            saturday.setTitle("OFF", for: .normal)
        }
    }
    @IBAction func sunday(_ sender: Any) {
        if isSunday == false{
            isSunday = true
            sunday.setTitle("ON", for: .normal)
        }else{
            isSunday = false
            sunday.setTitle("OFF", for: .normal)
        }
    }
    
    @IBAction func TodoAddButton(_ sender: Any) {
        //変数の中身をUDに追加
        if isMonday == true{
            AddController.mondayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.mondayContent, forKey: "monday" )
        }
        
        if isTuesday == true{
            AddController.tuesdayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.tuesdayContent, forKey: "tuesday" )
        }
        
        if isWednesday == true{
            AddController.wednesdayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.wednesdayContent, forKey: "wednesday" )
        }
        
        if isThursday == true{
            AddController.thursdayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.thursdayContent, forKey: "thursday" )
        }
        
        if isFriday == true{
            AddController.fridayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.fridayContent, forKey: "friday" )
        }
        
        if isSaturday == true{
            AddController.saturdayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.saturdayContent, forKey: "saturday" )
        }
        
        if isSunday == true{
            AddController.sundayContent.append(TodoTextField.text!)
            UserDefaults.standard.set( AddController.sundayContent, forKey: "sunday")
        }
        
        TodoTextField.text = ""
        
    }
    
    @IBAction func backbutton(_ sender: Any) {
        switch AddController.sendNumber{
        case 1:
            let parentVC = self.presentingViewController as! MondayController
            parentVC.updateTableView()
        case 2:
            let parentVC = self.presentingViewController as! TuesdayController
            parentVC.updateTableView()
        case 3:
            let parentVC = self.presentingViewController as! WednesdayController
            parentVC.updateTableView()
        case 4:
            let parentVC = self.presentingViewController as! ThursdayController
            parentVC.updateTableView()
        case 5:
            let parentVC = self.presentingViewController as! FridayController
            parentVC.updateTableView()
        case 6:
            let parentVC = self.presentingViewController as! SaturdayController
            parentVC.updateTableView()
        case 7:
            let parentVC = self.presentingViewController as! SundayController
            parentVC.updateTableView()
        case .none:
            let parentVC = self.presentingViewController as! MondayController
            parentVC.updateTableView()
        case .some(_):
            let parentVC = self.presentingViewController as! MondayController
            parentVC.updateTableView()
        }
        self.dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
