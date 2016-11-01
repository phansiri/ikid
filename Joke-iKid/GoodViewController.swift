//
//  GoodViewController.swift
//  Joke-iKid
//
//  Created by Litthideth Phansiri on 11/1/16.
//  Copyright © 2016 Lit Phansiri. All rights reserved.
//

import UIKit

class GoodViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    @IBAction func generateButton(_ sender: UIButton) {
        flipping()
    }
    @IBAction func answerButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
