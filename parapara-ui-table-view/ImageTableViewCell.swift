//
//  ImageTableViewCell.swift
//  parapara-ui-table-view
//
//  Created by JotaroSugiyama on 2023/02/15.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(customImageView)
        
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            customImageView.widthAnchor.constraint(equalTo: customImageView.heightAnchor, multiplier: 16/9)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
