
public enum AppService: String, Codable {
    case appGroup = "app_group"
    case applePay = "apple_pay"
    case associatedDomains = "associated_domains"
    case dataProtection = "data_protection"
    case gameCenter = "game_center"
    case healthKit = "health_kit"
    case homeKit = "home_kit"
    case wirelessAccessory = "wireless_accessory"
    case cloud = "cloud"
    case cloudKit = "cloud_kit"
    case inAppPurchase = "in_app_purchase"
    case interAppAudio = "inter_app_audio"
    case passbook = "passbook"
    case pushNotification = "push_notification"
    case siriKit = "siri_kit"
    case vpnConfiguration = "vpn_configuration"
    case networkExtension = "network_extension"
    case hotspot = "hotspot"
    case multipath = "multipath"
    case nfcTagReading = "nfc_tag_reading"

    public var serviceId: String {
        switch self {
        case .appGroup:             return "APG3427HIY"
        case .applePay:             return "OM633U5T5G"
        case .associatedDomains:    return "SKC3T5S89Y"
        case .dataProtection:       return "dataProtection"
        case .gameCenter:           return "gameCenter"
        case .healthKit:            return "HK421J6T7P"
        case .homeKit:              return "homeKit"
        case .wirelessAccessory:    return "WC421J6T7P"
        case .cloud:                return "iCloud"
        case .cloudKit:             return "cloudKitVersion"
        case .inAppPurchase:        return "inAppPurchase"
        case .interAppAudio:        return "IAD53UNK2F"
        case .passbook:             return "pass"
        case .pushNotification:     return "push"
        case .siriKit:              return "SI015DKUHP"
        case .vpnConfiguration:     return "V66P55NK2I"
        case .networkExtension:     return "NWEXT04537"
        case .hotspot:              return "HSC639VEI8"
        case .multipath:            return "MP49FN762P"
        case .nfcTagReading:        return "NFCTRMAY17"
        }
    }

    public var serviceURI: String {
        if serviceId == "push" {
            return "account/ios/identifiers/updatePushService.action"
        } else {
            return "account/ios/identifiers/updateService.action"
        }
    }

    public var values: [String: Any]? {
        switch self {
        case .dataProtection:
            return [
                 "off": "",
                 "complete": "complete",
                 "unless_open": "unlessopen",
                 "until_first_auth": "untilfirstauth"
            ]
        case .cloudKit:
            return [
                "xcode5_compatible": 1,
                "cloud_kit": 2
            ]
        default:
            return nil
        }
    }
}
