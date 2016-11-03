//
//  GoodViewController.swift
//  Joke-iKid
//
//  Created by Litthideth Phansiri on 11/1/16.
//  Copyright © 2016 Lit Phansiri. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {
    private var goodViewController: GoodOriginViewController!
    private var goodTwoViewController: GoodTwoViewController!
    private var goodThreeViewController: GoodThreeViewController!
    private var goodFourViewController: GoodFourViewController!
    private var goodFiveViewController: GoodFiveViewController!
        
    private func firstBuilder() {
        if goodViewController == nil {
            goodViewController = storyboard?.instantiateViewController(withIdentifier: "GoodFirst")as! GoodOriginViewController
        }
    }
    private func secondBuilder() {
        if goodTwoViewController == nil {
            goodTwoViewController = storyboard?.instantiateViewController(withIdentifier: "GoodSecond") as! GoodTwoViewController
        }
    }
    private func threeBuilder() {
        if goodThreeViewController == nil {
            goodThreeViewController = storyboard?.instantiateViewController(withIdentifier: "GoodThree")as! GoodThreeViewController
        }
    }
    private func fourBuilder() {
        if goodFourViewController == nil {
            goodFourViewController = storyboard?.instantiateViewController(withIdentifier: "GoodFour") as! GoodFourViewController
        }
    }
    private func fiveBuilder() {
        if goodFiveViewController == nil {
            goodFiveViewController = storyboard?.instantiateViewController(withIdentifier: "GoodFive") as! GoodFiveViewController
        }
    }

    @IBAction func nextButton(_ sender: UIButton) {
        firstBuilder(); secondBuilder(); threeBuilder(); fourBuilder(); fiveBuilder();
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if goodViewController != nil && goodViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodTwoViewController.view.frame = view.frame
            switchViewController(from: goodViewController, to: goodTwoViewController)
        } else if goodTwoViewController != nil && goodTwoViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodThreeViewController.view.frame = view.frame
            switchViewController(from: goodTwoViewController, to: goodThreeViewController)
        } else if goodThreeViewController != nil && goodThreeViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodFourViewController.view.frame = view.frame
            switchViewController(from: goodThreeViewController, to: goodFourViewController)
        } else if goodFourViewController != nil && goodFourViewController.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodFourViewController.view.frame = view.frame
            switchViewController(from: goodFourViewController, to: goodFiveViewController)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodFourViewController.view.frame = view.frame
            switchViewController(from: goodFiveViewController, to: goodViewController)
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
        switchViewController(from: nil, to: goodViewController)
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
