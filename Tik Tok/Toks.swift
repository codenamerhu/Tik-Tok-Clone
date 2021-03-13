//
//  Toks.swift
//  Tik Tok
//
//  Created by Rhulani Ndhlovu on 3/13/21.
//  Copyright © 2021 Codenamerhu. All rights reserved.
//

import Foundation

struct Toks: Codable {
    var toks:  [TikToks]
}

struct TikToks : Codable {
    var username: String
    var title: String?
    var video: URL
    var song: String
}
