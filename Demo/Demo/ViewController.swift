//
//  ViewController.swift
//  Demo
//
//  Created by Motoki on 2015/12/22.
//  Copyright (c) 2015 MotokiNarita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: properties
    let colors = [
        OriginalCell.CellInfo(color: UIColor.alizarin(), clipsToBouds: false),
        OriginalCell.CellInfo(color: UIColor.carrot(), clipsToBouds: true),
        OriginalCell.CellInfo(color: UIColor.sunflower(), clipsToBouds: false),
        OriginalCell.CellInfo(color: UIColor.turquoize(), clipsToBouds: true),
        OriginalCell.CellInfo(color: UIColor.river(), clipsToBouds: false),
        OriginalCell.CellInfo(color: UIColor.amethyst(), clipsToBouds: true) ]

    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Action
    @IBAction func tapped(_ sender: UIButton) {
        // !!!: example for ripple animation for UIView
        let config = UIView.RippleConfiguration(color: UIColor.alizarin())
        sender.rippleAnimate(with: config, completionHandler: {
            print("ripple!!")
        })
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? OriginalCell else {
            fatalError()
        }
        cell.configure(colors[indexPath.row])
        return cell
    }


    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
