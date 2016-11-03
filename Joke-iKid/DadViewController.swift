
//  DadViewController.swift
//  Joke-iKid
//
//  Created by Litthideth Phansiri on 11/1/16.
//  Copyright © 2016 Lit Phansiri. All rights reserved.
//

import UIKit

class DadViewController: UIViewController {
    private var dadTwoViewController: DadTwoViewController!
    private var dadThreeViewController: DadThreeViewController!
    
    private func firstBuilder() {
        if dadTwoViewController == nil {
            dadTwoViewController = storyboard?.instantiateViewController(withIdentifier: "Two") as! DadTwoViewController
        }
    }

    private func secondBuilder() {
        if dadThreeViewController == nil {
            dadThreeViewController = storyboard?.instantiateViewController(withIdentifier: "Three") as! DadThreeViewController
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        firstBuilder()
        secondBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        
        if dadTwoViewController != nil && dadTwoViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadThreeViewController.view.frame = view.frame
            switchViewController(from: dadTwoViewController, to: dadThreeViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadTwoViewController.view.frame = view.frame
            switchViewController(from: dadThreeViewController, to: dadTwoViewController)
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
        switchViewController(from: nil, to: dadTwoViewController)
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
