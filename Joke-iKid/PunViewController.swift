//
//  PunViewController.swift
//  Joke-iKid
//
//  Created by Litthideth Phansiri on 11/1/16.
//  Copyright © 2016 Lit Phansiri. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {
    private var punFirstViewController: PunFirstViewController!
    private var punSecondViewController: PunSecondViewController!
    
    private func firstBuilder() {
        if punFirstViewController == nil {
            punFirstViewController = storyboard?.instantiateViewController(withIdentifier: "PunFirst") as! PunFirstViewController
        }
    }
    
    private func secondBuilder() {
        if punSecondViewController == nil {
            punSecondViewController = storyboard?.instantiateViewController(withIdentifier: "PunSecond") as! PunSecondViewController
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        firstBuilder(); secondBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if punFirstViewController != nil && punFirstViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            punSecondViewController.view.frame = view.frame
            switchViewController(from: punFirstViewController, to: punSecondViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punFirstViewController.view.frame = view.frame
            switchViewController(from: punSecondViewController, to: punFirstViewController)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstBuilder()
        switchViewController(from: nil, to: punFirstViewController)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
