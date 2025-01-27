// FFmpeg-iOS: Swift package to use FFmpeg in your iOS apps
// Copyright (C) 2023  Changbeom Ahn
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

import Foundation
//import ffmpeg
import Hook

var argv: [UnsafeMutablePointer<CChar>?] = []

public func ffmpeg(_ args: String...) -> Int {
    ffmpeg(args)
}

public func ffmpeg(_ args: [String]) -> Int {
    print(#function, args)
    argv = args.map { strdup($0) } // FIXME: free
    let ret = HookMain(Int32(args.count), &argv)
    return Int(ret)
}
