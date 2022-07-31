//
//  Video.swift
//  TikTokClone
//
//  Created by Comus Hardman IV on 7/29/22.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id: Int
    var player: AVPlayer
    var replay: Bool
}
