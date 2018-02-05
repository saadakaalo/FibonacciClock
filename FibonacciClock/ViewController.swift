//
//  ViewController.swift
//  FibonacciClock
//
//  Created by ac-mac on 1/13/17.
//  Copyright © 2017 ac-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var fiveView: UIView!
    @IBOutlet weak var threeView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var oneLeft: UIView!
    @IBOutlet weak var oneRight: UIView!
    
    let maroon = UIColor(red: 128.0/255.0, green: 0, blue: 64.0/255.0, alpha: 1)
    let moss = UIColor(red: 0, green: 128.0/255.0, blue: 64.0/255.0, alpha: 1)
    let teal = UIColor(red: 0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.setBordersToViews()
        self.colorTheViews()
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.colorTheViews), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func setBordersToViews() {
        rootView.layer.borderWidth = 10.0
        rootView.layer.borderColor = UIColor.whiteColor().CGColor
        
        fiveView.layer.borderWidth = 5.0
        fiveView.layer.borderColor = UIColor.whiteColor().CGColor
        
        threeView.layer.borderWidth = 5.0
        threeView.layer.borderColor = UIColor.whiteColor().CGColor
        
        twoView.layer.borderWidth = 5.0
        twoView.layer.borderColor = UIColor.whiteColor().CGColor
        
        oneLeft.layer.borderWidth = 5.0
        oneLeft.layer.borderColor = UIColor.whiteColor().CGColor
        
        oneRight.layer.borderWidth = 5.0
        oneRight.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    func colorTheViews() {
        let date = NSDate()
        let calender = NSCalendar.currentCalendar()
        var hour = calender.component(.Hour, fromDate: date)%12
        hour = hour==0 ? 12:hour
        var minitue = calender.component(.Second, fromDate: date)/5
        print(hour,minitue*5)
        
        let hoursColor = maroon
        let minituesColor = moss
        let concurrentColor = teal
        
        if hour>=5 {
            self.fiveView.backgroundColor = hoursColor
            hour -= 5
        }
        if hour>=3 {
            self.threeView.backgroundColor = hoursColor
            hour -= 3
        }
        if hour>=2 {
            self.twoView.backgroundColor = hoursColor
            hour -= 2
        }
        if hour>=1 {
            self.oneLeft.backgroundColor = hoursColor
            hour -= 1
        }
        if hour>=1 {
            self.oneRight.backgroundColor = hoursColor
            hour -= 1
        }
        
        
        
        
        if minitue>=1 {
            if self.oneRight.backgroundColor == hoursColor {
                self.oneRight.backgroundColor = concurrentColor
            }
            else {
                self.oneRight.backgroundColor = minituesColor
            }
            minitue -= 1
        }
        
        if minitue>=1 {
            if self.oneLeft.backgroundColor == hoursColor {
                self.oneLeft.backgroundColor = concurrentColor
            }
            else {
                self.oneLeft.backgroundColor = minituesColor
            }
            minitue -= 1
        }
        
        if minitue>=2 {
            if self.twoView.backgroundColor == hoursColor {
                self.twoView.backgroundColor = concurrentColor
            }
            else {
                self.twoView.backgroundColor = minituesColor
            }
            minitue -= 2
        }
        if minitue>=3 {
            if self.threeView.backgroundColor == hoursColor {
                self.threeView.backgroundColor = concurrentColor
            }
            else {
                self.threeView.backgroundColor = minituesColor
            }
            minitue -= 3
        }
        if minitue>=5 {
            if self.fiveView.backgroundColor == hoursColor {
                self.fiveView.backgroundColor = concurrentColor
            }
            else {
                self.fiveView.backgroundColor = minituesColor
            }
            minitue -= 5
        }
        
    }


}

