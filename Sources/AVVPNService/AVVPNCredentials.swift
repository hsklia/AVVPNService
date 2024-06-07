//
//  Credentials.swift
//  AVVPNService
//
//  Created by Andrey Vasilev on 21.04.2020.
//  Copyright © 2020 Andrey Vasilev. All rights reserved.
//

import Foundation

public enum AVVPNType: String, CaseIterable {
    case ike2 = "IKEv2"
    case ipsec = "IPSec"
}

public class AVVPNCredentials {

    let type: AVVPNType
    let title: String
    let server: String
    let username: String
    let password: String
    let killSwitch : Bool

    private init(_ type: AVVPNType, title: String, server: String, username: String, password: String, killSwitch: Bool) {
        self.type = type
        self.title = title
        self.server = server
        self.username = username
        self.password = password
        self.killSwitch = killSwitch
    }

    public class IPSec: AVVPNCredentials {
        let shared: String

        public init(title: String = "AVVPNService", server: String, username: String, password: String, shared: String, killSwitch : Bool) {
            self.shared = shared
            super.init(.ipsec, title: title, server: server, username: username, password: password, killSwitch: killSwitch)
        }
    }

    public class IKEv2: AVVPNCredentials {
        let remoteId: String
        let localId: String

        public init(title: String = "AVVPNService", server: String, username: String, password: String, remoteId: String, localId: String, killSwitch : Bool) {
            self.remoteId = remoteId
            self.localId = localId
            super.init(.ike2, title: title, server: server, username: username, password: password, killSwitch: killSwitch)
        }
    }
}
