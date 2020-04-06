//
//  MusicResponse.swift
//  MusicFinder
//
//  Created by Seong Moon Jo on 4/6/20.
//  Copyright © 2020 Seong Moon Jo. All rights reserved.
//

import Foundation

struct MusicResponse: Decodable {
    var result: [Detail]
}

struct Detail: Decodable {
    var artist: String
    var title: String
}
