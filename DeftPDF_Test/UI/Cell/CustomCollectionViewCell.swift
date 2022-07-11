//
//  CustomCollectionViewCell.swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 05.07.2022.
//

import UIKit
import PDFKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    private var pdfFIles: [PDFFileModel] = []

    var pdfFile: PDFFileModel?
//    {
////        didSet {
////            myImageView.image = generatePdfThumbnail(of: CGSize(width: 100, height: 100), for: , atPage: 0)
////        }
//    }
//    
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
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
             print("Button Clicked")
        }
//    func pdfThumbnail(url: URL, width: CGFloat = 240) -> UIImage? {
//      guard let data = try? Data(contentsOf: url),
//      let page = PDFDocument(data: data)?.page(at: 0) else {
//        return nil
//      }
//        let pageSize = page.bounds(for: .mediaBox)
//        let pdfScale = width / pageSize.width
//
//        return page.thumbnail(of: .zero, for: .mediaBox)
//    }
    
    func generatePdfThumbnail(of thumbnailSize: CGSize , for documentUrl: URL, atPage pageIndex: Int) -> UIImage? {
        let pdfDocument = PDFDocument(url: documentUrl)
        let pdfDocumentPage = pdfDocument?.page(at: pageIndex)
        return pdfDocumentPage?.thumbnail(of: thumbnailSize, for: PDFDisplayBox.trimBox)
    }
    let thumbnailSize = CGSize(width: 100, height: 100)
//    let thumbnail = generatePdfThumbnail(of: thumbnailSize, for: url, atPage: 0)

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
