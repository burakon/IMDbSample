//
//  TopListViewMadel.swift
//  IMDbSample
//
//  Created by Reiko Goto on 2017/07/03.
//  Copyright © 2017年 Her. All rights reserved.
//

import Foundation
import SwiftyJSON

class TopListViewMadel{
    let s: String!
    let l: String!
    let id: String!
    let imageUrl: String!
    
    init(data: JSON) {
        s = (data["s"].stringValue)
        l = (data["l"].stringValue)
        id = (data["id"].stringValue)
        imageUrl = (data["i"][0].stringValue)
    }
}
