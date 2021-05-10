//
//  ViewController.swift
//  SkeletonViewTest
//
//  Created by Zsolt Kovacs on 07.05.21.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    static let reuseIdentifier = "RID"

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Self.reuseIdentifier)

        tableView.dataSource = self
        view.isSkeletonable = true
        tableView.isSkeletonable = true
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.showSkeleton(transition: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [self] in
            view.hideSkeleton(transition: .none)
        }
    }
}

extension ViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseIdentifier, for: indexPath) as! TableViewCell
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return Self.reuseIdentifier
    }
}
