//
//  FileManager+copyItem().swift
//  DeftPDF_Test
//
//  Created by Georgie Muler on 08.07.2022.
//

import Foundation

extension FileManager {

  open func copyItem(fileURL srcURL: URL, to dstURL: URL, completed: @escaping (Result<String, Error>) -> Void ) {
        do {
            if FileManager.default.fileExists(atPath: dstURL.path) {
                try FileManager.default.removeItem(at: dstURL)
                completed(.success("Fuck you"))
            }
            try FileManager.default.copyItem(at: srcURL, to: dstURL)
        } catch (let error) {
            print("Cannot copy item at \(srcURL) to \(dstURL): \(error)")
        }
    }
}
