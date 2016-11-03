//
//  GoodViewController.swift
//  Joke-iKid
//
//  Created by Litthideth Phansiri on 11/1/16.
//  Copyright © 2016 Lit Phansiri. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {
    private var goodViewController: GoodViewController!
    private var goodTwoViewController: GoodTwoViewController!
    private var goodThreeViewController: GoodThreeViewController!
    private var goodFourViewController: GoodFourViewController!
    private var goodFiveViewController: GoodFiveViewController!
    
    private func firstBuilder() {
        if goodViewController == nil {
            goodViewController = storyboard?.instantiateViewController(withIdentifier: "GoodFirst")as! GoodViewController
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

    @IBAction func generateButton(_ sender: UIButton) {
        flipping()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstBuilder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func flipping() {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationRepeatCount(4)
        UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
        UIView.commitAnimations()
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
