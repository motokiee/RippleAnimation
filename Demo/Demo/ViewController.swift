//
//  ViewController.swift
//  Demo
//
//  Created by Motoki on 2015/12/22.
//  Copyright (c) 2015 MotokiNarita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: properties
    let colors = [
        (UIColor.alizarin(), false),
        (UIColor.carrot(), true),
        (UIColor.sunflower(), false),
        (UIColor.turquoize(), true),
        (UIColor.river(), false),
        (UIColor.amethyst(), true) ]

    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? OriginalCell else {
            fatalError()
        }
        cell.configure(colors[indexPath.row])
        return cell
    }


    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }


    // MARK: Action
    @IBAction func tapped(sender: UIButton) {
        // !!!: example for ripple animation for UIView
        sender.rippleAnimate(color: UIColor.alizarin()) { print("ripple!!") }
    }

}
