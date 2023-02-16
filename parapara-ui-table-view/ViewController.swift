//
//  ViewController.swift
//  parapara-ui-table-view
//
//  Created by JotaroSugiyama on 2023/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var imageArray: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!,
        UIImage(named: "image5")!,
        UIImage(named: "image6")!,
        UIImage(named: "image7")!,
        UIImage(named: "image8")!
    ]
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        view.addSubview(tableView)
        
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func adjustCellsOpacity() {
        for cell in tableView.visibleCells {
            let cellRect = tableView.convert(cell.frame, to: tableView.superview)
            let cellBottom = cellRect.maxY
            let tableBottom = tableView.frame.maxY
            
            var opacity = CGFloat(1.0)
            if cellBottom > tableBottom {
                opacity = 0.0
            } else {
                opacity = 1.0
            }
            cell.alpha = opacity
        }
        
        for (index, image) in imageArray.enumerated() {
            if let cell = tableView.visibleCells.first(where: { ($0 as? ImageTableViewCell)?.customImageView.image == image }) {
                tableView.sendSubviewToBack(cell)
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        
        cell.customImageView.image = imageArray[indexPath.row]
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 3 / 10
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        adjustCellsOpacity()
    }
}
