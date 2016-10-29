//
//  FViewController.swift
//  FreeTheSlaves2
//
//  Created by Janson Lau on 10/28/16.
//  Copyright © 2016 Janson LauJanson Lau. All rights reserved.
//

import UIKit

class FViewController: UIViewController {
    var question = 0;
    var answerReportF = [Int]()
    var lastIndex = 0;


    let questionsF = ["There is an anti-slavery community group that meets regularly", "The community group has good leadership", "Slavery survivors participate effectively in the group", "Poorer households participate effectively in the group", "Discriminated groups participate effectively in the group", "Women participate effectively in the group", "The community group has strong internal cohesion", "The community group is well accepted within the community (while recognizing that those connected with slaveholders and trafficking may not accept the group)", "The group can resolve internal disagreements and maintain unity and trust"]
    @IBOutlet weak var questionF: UILabel!
    @IBOutlet weak var segControlF: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func enterPressedF(_ sender: Any) {
        if(question < questionsF.count-1) {
            answerReportF[lastIndex+question] = segControlF.selectedSegmentIndex

            question += 1
            questionF.text = questionsF[question]
        }
        else {
            performSegue(withIdentifier: "FtoG", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FtoG"  {
            let gviewc = segue.destination as! GViewController
            gviewc.answerReportG = answerReportF
            gviewc.lastIndex = question;

        }
    }

}
