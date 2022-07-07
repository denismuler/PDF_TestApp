//
//  CustomCollectionViewCell.swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 05.07.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "")
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "optional text"
        label.textAlignment = .center
        return label
    }()
    
    private let myFileSize: UILabel = {
        let label = UILabel()
        label.text = "optional text"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                               width: contentView.frame.size.width-10,
                               height: 50)
        
        myImageView.frame = CGRect(x: 20,
                               y: 0,
                               width: contentView.frame.size.width-40,
                               height: contentView.frame.size.height-50)
        
        myFileSize.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-60,
                               width: contentView.frame.size.width-5,
                               height: 30)
    }
    
    public func configure(label: String) {
        myLabel.text = label
    }
    
    public func configureFileSize(labelSize: String) {
        myFileSize.text = labelSize
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myFileSize.text = nil
    }
}
