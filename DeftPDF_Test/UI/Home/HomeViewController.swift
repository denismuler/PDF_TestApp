//
//  ViewController.swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 05.07.2022.
//

import PDFKit
import UIKit
import MobileCoreServices
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PDFViewDelegate {
    
    private var collectionView: UICollectionView?
    let searchController = UISearchController()
    private var pdfFIles: [PDFFileModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        retrieveItems()
    }
    
    func configureUI() {
        
        navigationItem.searchController = searchController
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/2)-4)
        
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        view.backgroundColor = .systemBackground
        
        UITabBar.appearance().barTintColor = .systemBackground
        
        let button = UIButton(
            frame: CGRect(x: 300, y: 650, width: 75, height: 75)
        )
        button.backgroundColor = UIColor(red: 0.49, green: 0.30, blue: 1.00, alpha: 1.00)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setImage(UIImage(named:"plus-1"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.clipsToBounds = false
        
        button.snp.makeConstraints { make in
            
            make.right.bottom.equalTo(15)
            make.height.equalTo(50)
            make.left.equalTo(100)
            
//            make.left.equalToSuperview()
//            make.top.equalToSuperview()
//            make.right.equalToSuperview().inset(15)
//            make.bottom.equalToSuperview().inset(60)
        }
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 0.49, green: 0.30, blue: 1.00, alpha: 1.00), UIColor.white.cgColor]
        gradient.frame = button.bounds
        button.layer.insertSublayer(gradient, at: 0)
        
        let pop = popUpView()
        view.addSubview(pop)
        
        self.view.bringSubviewToFront(pop)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        let documentPicker = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
        
        print("Button tapped")
    }
    
    //MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pdfFIles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier,
                                                      for: indexPath) as! CustomCollectionViewCell
//        cell.configure(label: pdfFIles[indexPath.row].name)
        cell.pdfFile = pdfFIles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let PDFVC:PDFViewController = self.storyboard?.instantiateViewController(withIdentifier: "PDFViewController") as! PDFViewController
    }

    private func createPdfView(withFrame frame: CGRect) -> PDFView {
        let pdfView = PDFView(frame: frame)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfView.autoScales = true
        
        return pdfView
    }
    
    private func retrieveItems() {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            print(fileURLs)
            print(documentsURL)
            // Retrieve files
            for fileURL in fileURLs {
                // model PDFFile
                self.pdfFIles.append(.init(name: fileURL.lastPathComponent))
            }
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
    }
}

extension HomeViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationPath = documentDirectory.appendingPathComponent(url.lastPathComponent)
        print(url)
        FileManager.default.copyItem(fileURL: url, to: destinationPath) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let string):
                print(string)
                self.retrieveItems()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        controller.dismiss(animated: true)
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        for url in urls {
            print(url)
            let destinationPath = documentDirectory.appendingPathComponent(url.lastPathComponent)
            FileManager.default.copyItem(fileURL: url, to: destinationPath) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let string):
                    print(string)
                    self.retrieveItems()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        self.retrieveItems()
        controller.dismiss(animated: true)
    }
    
    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true)
    }
}
