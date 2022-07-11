//
//  PDFViewController .swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 09.07.2022.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController, PDFViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewPDF()
    }
    
    private func viewPDF() {
        let pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
//        pdfConteinerView.addSubview(pdfView)
            
//        pdfView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
//                pdfView.trailingAnchor.constraint(equalTo: pdfContenierView.safeAreaLayoutGuide.trailingAnchor).isActive = true
//                pdfView.topAnchor.constraint(equalTo: pdfConteinerView.safeAreaLayoutGuide.topAnchor).isActive = true
//                pdfView.bottomAnchor.constraint(equalTo: pdfConteinerView.safeAreaLayoutGuide.bottomAnchor).isActive = true
//
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .vertical
                
                ///Open pdf with help of FileManager URL
                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let bookWithPdf = ".pdf"
                    let fileURL = dir.appendingPathComponent(bookWithPdf)
                    let document = PDFDocument(url: fileURL)
                    pdfView.document = document
                }
    }
}
