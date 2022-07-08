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
    
    private let myThreeDots: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dots"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(myThreeDots)
        contentView.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-70,
                               width: contentView.frame.size.width-10,
                               height: 40)
        
        myImageView.frame = CGRect(x: 20,
                               y: 5,
                               width: contentView.frame.size.width-40,
                               height: contentView.frame.size.height-70)
        
        myFileSize.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-60,
                               width: contentView.frame.size.width-5,
                               height: 30)
        
        myThreeDots.frame = CGRect(x: 50,
                                   y: contentView.frame.size.height-20,
                                   width: 30,
                                   height: 10 )
        
    }
    
    public func configure(label: String) {
        myLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myFileSize.text = nil
    }
}
