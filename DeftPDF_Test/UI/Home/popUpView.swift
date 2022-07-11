//
//  popUpView.swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 11.07.2022.
//

import UIKit
import SnapKit

class popUpView: UIView {
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        let container = UIView()
        container.backgroundColor = .systemGray
        self.addSubview(container)

        container.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview().inset(15)
            make.height.equalToSuperview().inset(150)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
}
