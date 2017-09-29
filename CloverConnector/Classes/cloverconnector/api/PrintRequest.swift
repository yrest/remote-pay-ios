//
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation

@objc
public class PrintRequest: NSObject {
    //MARK: Private data source for the print request. These should not be modifiable externally, because for now we want to make sure that only one type of data is printed
    public private(set) var images = [ImageClass]()
    public private(set) var imageURLS = [NSURL]()
    public private(set) var text = [String]()
    public var printRequestId: String?
    public var printDeviceId: String?
    

    /// Create a PrintRequest to print a given Image
    ///
    /// - Parameters:
    ///   - image: Image to print
    ///   - printRequestId: Optional identifier to give to the print job, so it can later be queried
    ///   - printDeviceId: Optional identifier to speciy which printer to use
    public init(image: ImageClass, printRequestId: String?, printDeviceId: String?) {
        self.images.append(image)
        self.printRequestId = printRequestId
        self.printDeviceId = printDeviceId
    }
    
    /// Create a PrintRequest to print an image at a given URL
    ///
    /// - Parameters:
    ///   - imageURL: URL to the image to print
    ///   - printRequestId: Optional identifier to give to the print job, so it can later be queried
    ///   - printDeviceId: Optional identifier to speciy which printer to use
    public init(imageURL: NSURL, printRequestId: String?, printDeviceId: String?) {
        self.imageURLS.append(imageURL)
        self.printRequestId = printRequestId
        self.printDeviceId = printDeviceId
    }
    
    /// Create a PrintRequest to print an array of strings to print
    ///
    /// - Parameters:
    ///   - text: Array of strings to be printed
    ///   - printRequestId: Optional identifier to give to the print job, so it can later be queried
    ///   - printDeviceId: Optional identifier to speciy which printer to use
    public init?(text: [String], printRequestId: String?, printDeviceId: String?) {
        if text.count < 1 {
            return nil
        }
        
        self.text = text
        self.printRequestId = printRequestId
        self.printDeviceId = printDeviceId
    }
    
    private override init() {} //marking as private to enforce object creation through one of the other initializers
}
