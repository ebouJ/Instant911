//
//  ViewController.swift
//  Safe App
//
//  Created by Ebou Jobe on 2017-01-21.
//  Copyright © 2017 Ebou Jobe. All rights reserved.
//

import UIKit
import AVFoundation
import MapKit
import MessageUI

class ViewController: UIViewController , CLLocationManagerDelegate , MFMessageComposeViewControllerDelegate {
    var locationManager = CLLocationManager()
    var textMessage = ""
    var s = "Hello, I am in a state of emergency and cannot speak. Please send help to my coordinates.\n"
    var cordinates = ""
    
 
    override func viewDidLoad() {
         print(profileViewController.GlobalVariable.tempMessage)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sendSms(_ sender: Any) {
        
        let msgVC = MFMessageComposeViewController()
        msgVC.body = s + "\n" + cordinates + profileViewController.GlobalVariable.tempMessage
        msgVC.recipients = ["4388738573"]
        msgVC.messageComposeDelegate = self
        self.present(msgVC, animated: true, completion: nil)

        
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func listenVolumeButton() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true)
        } catch {
            print("some error")
        }
        audioSession.addObserver(self, forKeyPath: "outputVolume", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume" {
            let msgVC = MFMessageComposeViewController()
            msgVC.body = s + "\n" + cordinates + profileViewController.GlobalVariable.tempMessage
            msgVC.recipients = ["4385586814"]
            msgVC.messageComposeDelegate = self
            self.present(msgVC, animated: true, completion: nil)
            print("got in here")
        }
    }
    override func viewWillAppear(_ animated: Bool){
        listenVolumeButton()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
         cordinates = "Latitude: " + (String)(latitude) + "\nLongitude: " + (String)(longitude) + "\n"
        
        
        
            }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }

}

