//
//  ViewController.swift
//  TrafficPRJ
//
//  Created by Apple on 16/06/2021.
//
enum Time {
    case Start
    case Pause
}
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ResetUI: UIButton!
    @IBOutlet weak var TrafficUI: UIView!
    @IBOutlet weak var RedLightUI: UIView!
    @IBOutlet weak var YellowLightUI: UIView!
    @IBOutlet weak var GreenLightUI: UIView!
    @IBOutlet weak var ButtonUI: UIButton!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var NumberView: UIView!
    
    var timer : Timer!
    var second: Int = 0
    var count = 90
    var timeType :Time = .Start
    var currentAlpha: CGFloat = 0.5
    override func viewDidLoad() {
       super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.99, green: 0.80, blue: 0.00, alpha: 1.00)
        RedLightUI.alpha = currentAlpha
        YellowLightUI.alpha = currentAlpha
        GreenLightUI.alpha = currentAlpha
        RedLightUI.layer.cornerRadius = 50
        GreenLightUI.layer.cornerRadius = 50
        YellowLightUI.layer.cornerRadius = 50
        TrafficUI.backgroundColor = UIColor.black
        TrafficUI.layer.cornerRadius = 50
        number.text = String(count)
        number.textColor = .white
        NumberView.backgroundColor = .black
        NumberView.layer.cornerRadius = 20
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeLoop), userInfo: nil, repeats: true)
    }
    @objc func timeLoop () {
        count -= 1
        number.text = String(count)
        if  RedLightUI.alpha == YellowLightUI.alpha {
        RedLightUI.alpha = 1
        
    } else if count == 60 {
        YellowLightUI.alpha = 1
        RedLightUI.alpha = currentAlpha
    } else if count == 30 {
        GreenLightUI.alpha = 1
        YellowLightUI.alpha = currentAlpha
        RedLightUI.alpha = currentAlpha
    } else if count == 1 {
        GreenLightUI.alpha = 1
        YellowLightUI.alpha = currentAlpha
        RedLightUI.alpha = currentAlpha
        timer.invalidate()
    
    }
        
    }
    @IBAction func changPress(_ sender: Any) {
        if timeType == Time.Start {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeLoop), userInfo: nil, repeats: true)
            ButtonUI.setTitle("Pause", for: .normal)
            timeType = .Pause
        } else {
            ButtonUI.setTitle("Start", for: .normal)
            timeType = .Start
            timer.invalidate()
        }
    }
    
    @IBAction func ResetPress(_ sender: Any) {
        second = 0
        number.text = String (count)
        timeType = .Start
        timer.invalidate()
    }
}


