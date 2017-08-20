//
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import ObjectMapper

/**
 response to a manual refund
 */
public class ManualRefundResponse:BaseResponse {

    /// the credit object for the manual refund
  public private(set) var credit:CLVModels.Payments.Credit?
    /// :nodoc:
  public private(set) var transactionNumber:String?

    

    init(success:Bool, result:ResultCode, credit:CLVModels.Payments.Credit?=nil, transactionNumber:String?=nil, reason:String?=nil) {
        super.init(success:success, result:result, reason:reason, message:nil)
        self.credit = credit
        self.transactionNumber = transactionNumber
    }
    /// :nodoc:
    required public init?(_ map: Map) {
        super.init(map)
    }
    /// :nodoc:
    public override func mapping(map: Map) {
        super.mapping(map)
        credit <- (map["credit"], Message.creditTransform)
        transactionNumber <- map["transactionNumber"]
    }
    
}

