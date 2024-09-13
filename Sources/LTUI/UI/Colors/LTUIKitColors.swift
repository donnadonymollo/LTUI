//
//  LTUIKitColors.swift
//
//
//  Created by Mollo Quicaño Donnadony on 27/08/24.
//

import UIKit

public extension UIColor {
    
    convenience init?(hex: String) {
        let startIndex: String.Index
        if hex.hasPrefix("#") {
            startIndex = hex.index(hex.startIndex, offsetBy: 1)
        } else {
            startIndex = hex.startIndex
        }
        let hexColor = String(hex[startIndex...])
        guard hexColor.count == 8 else { return nil }
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            let green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            let blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            let alpha = CGFloat(hexNumber & 0x000000ff) / 255
            self.init(red: red, green: green, blue: blue, alpha: alpha)
            return
        }
        return nil
    }
    
    // MARK: - URL: http://www.htmlcsscolor.com
    
    /// Color d3d3d3
    static let LT_gray_light = UIColor(hex: "#D3D3D3FF")!
    /// Color 00000000
    static let LT_transparent = UIColor(hex: "#00000000")!
    /// Color 05BE50FF
    static let LT_green = UIColor(hex: "#05BE50FF")!
    /// Color 66D683
    static let LT_green_very_light = UIColor(hex: "#66D683FF")!
    /// Color D6F6C9
    static let LT_green_tea = UIColor(hex: "#D6F6C9FF")!
    /// Color ECEDEDFF
    static let LT_blue_gray = UIColor(hex: "#ECEDEDFF")!
    /// Color FFFFFFFF
    static let LT_white = UIColor(hex: "#FFFFFFFF")!
    /// Color B7BABCFF
    static let LT_gray = UIColor(hex: "#B7BABCFF")!
    /// Color DCDCDD -  Separator View
    static let LT_gray_gainsboro = UIColor(hex: "#DCDCDDFF")!
    /// Color EDEEEE -  Border View
    static let LT_gray_bright = UIColor(hex: "#EDEEEEFF")!
    /// Color A7A8A9
    static let LT_gray_description = UIColor(hex: "#A7A8A9FF")!
    /// Color 0F191EFF
    static let LT_black_pearl = UIColor(hex: "#0F191EFF")!
    /// Color 0F191E Alpha 0.5 - Background Modal
    static let LT_black_pearl_semitransparent = UIColor(hex: "#0F191EFF")!.withAlphaComponent(0.5)
    /// Color 0F191E Alpha 0.25 - InputText shadow
    static let LT_black_pearl_semitransparent_2 = UIColor(hex: "#0F191EFF")!.withAlphaComponent(0.25)
    /// Color 3333337F
    static let LT_night_rider_transparent = UIColor(hex: "#3333337F")!
    /// Color 3333331F
    static let LT_night_rider_transparent_2 = UIColor(hex: "#3333331F")!
    /// Color 333333FF
    static let LT_night_rider = UIColor(hex: "#333333FF")!
    /// Color 878C8FFF
    static let LT_aluminium = UIColor (hex: "#878C8FFF")!
    /// Color EB0046FF
    static let LT_razzmatazz = UIColor (hex: "#EB0046FF")!
    /// Color D9DADBFF
    static let LT_link_water = UIColor (hex: "#D9DADBFF")!
    /// Color FFEFCAFF
    static let LT_blanched_almond = UIColor(hex: "#FFEFCAFF")!
    /// Color E0F0FAFF
    static let LT_azureish_white = UIColor(hex: "#E0F0FAFF")!
    /// Color CCD7ED
    static let LT_blue_columbia = UIColor(hex: "#CCD7EDFF")!
    /// Color C1E1F5
    static let LT_blue_beau = UIColor(hex: "#C1E1F5FF")!
    /// Color 83C3EB - BLUE TC
    static let LT_blue_sky = UIColor(hex: "#83C3EBFF")!
    /// Color 87BBDAFF - Amex Blue
    static let LT_blue_sky_dark = UIColor(hex: "#87BBDAFF")!
    /// Color 64B4E6FF
    static let LT_blue_jeans = UIColor(hex: "#64B4E6FF")!
    /// Color FFB406FF
    static let LT_gold = UIColor(hex: "#FFB406FF")!
    /// Color D9AC47
    static let LT_gold_metallic = UIColor(hex: "#D9AC47FF")!
    /// Color CDF2DCFF
    static let LT_white_ice = UIColor (hex: "#CDF2DCFF")!
    ///Color 69D890FF
    static let LT_silver_tree = UIColor (hex: "#69D890FF")!
    ///Color 99B0DBFF
    static let LT_echo_blue = UIColor (hex: "#99B0DBFF")!
    ///Color F6F6F6FF
    static let LT_white_smoke = UIColor (hex: "#F6F6F6FF")!
    /// Color F4F4F4
    static let LT_White_smoke_F4 = UIColor(hex: "#F4F4F4FF")!
    /// Color 0039A6FF
    static let LT_klein_blue = UIColor(hex: "#0039A6FF")!
    /// Color FBFBFBFF
    static let LT_snow = UIColor(hex: "#FBFBFBFF")!
    /// Color F5F5F5FF
    static let LT_gray_smoke = UIColor(hex: "#F5F5F5FF")!
    /// Color 37CB73FF
    static let LT_medium_sea_green = UIColor(hex: "#37CB73FF")!
    /// Color C1DFC7
    static let LT_jet_stream = UIColor(hex: "#C1DFC7FF")!
    /// Color 009B3AFF
    static let LT_pigment_green = UIColor(hex: "#009B3AFF")!
    /// Color FF0000FF
    static let LT_red = UIColor(hex: "#FF0000FF")!
    /// Color A7A8A9FF
    static let LT_gray_chateau = UIColor(hex: "#A7A8A9FF")!
    /// Color 3361B8FF
    static let LT_cerulean_blue = UIColor(hex: "#3361B8FF")!
    /// Color 505050
    static let LT_dark_liver = UIColor(hex: "#505050FF")!
    /// Color 000000
    static let LT_black = UIColor(hex: "#000000FF")!
    /// Color FFCD00
    static let LT_yellow = UIColor(hex: "#FFCD00FF")!
    /// Color ECECEC
    static let LT_gray_1 = UIColor(hex: "#ECECECFF")!
    /// Color 0D1A1E
    static let LT_black_pearl_second = UIColor(hex: "#0D1A1EFF")!
    
    /// Color EB0046FF
    static var LT_error: UIColor { .LT_razzmatazz }
    /// Color 0F191EFF
    static var LT_primary_text: UIColor { .LT_black_pearl }
    /// Color 0F191EFF
    static var LT_visa_infinite: UIColor { .LT_dark_liver }
    /// Color D9AC47FF
    static var LT_visa_gold: UIColor { .LT_gold_metallic }
    /// Color D6F6C9FF
    static var LT_access: UIColor { .LT_green_tea }
    /// Color 87BBDAFF
    static var LT_amex_blue : UIColor { .LT_blue_sky_dark }
    // Color C1DFC7FF
    static var LT_amex : UIColor { .LT_jet_stream }
    /// Color F4F4F4
    static var LT_shimmer : UIColor { .LT_White_smoke_F4 }
    /// Color FDFDFDFF
    static let LT_very_gray_lite = UIColor(hex: "FDFDFDFF")!
    /// Color F8F8F8FF
    static let LT_gray_lite = UIColor(hex: "F8F8F8FF")!
    /// Color A9A9A9FF
    static let LT_dark_gray = UIColor(hex: "#A9A9A9FF")!
    /// Color 393939
    static let LT_eclipse = UIColor(hex: "#393939FF")!
    /// Color DDF6E7
    static let LT_green_honeydew = UIColor(hex: "#DDF6E7FF")!
    /// Color FBCCDA
    static let LT_red_light = UIColor(hex: "#FBCCDAFF")!
    /// Color F9F9F1
    static let LT_yellow_light = UIColor(hex: "#F9F9F1FF")!
    /// Color 001E5F
    static let LT_blue_light = UIColor(hex: "#001E5FFF")!
    /// Color F3F3E3
    static let LT_beige = UIColor(hex: "#F3F3E3FF")!
    /// Color 001E5F
    static let LT_blue_plin = UIColor(hex: "#2D76FFFF")!
    /// Color CCF9F5
    static let LT_foam = UIColor(hex: "#CCF9F5FF")!
    /// Color 248CF5
    static let LT_dodger_blue = UIColor(hex: "#248CF5FF")!
    /// Color F6F6EA
    static let LT_promenade = UIColor(hex: "#F6F6EAFF")!
    /// Color 00E4D6
    static let LT_bright_turquoise = UIColor(hex: "#00E4D6FF")!
    /// Color B5FBFF
    static let LT_pale_turquoise = UIColor(hex: "#B5FBFFFF")!
    /// Color 68F08B
    static let LT_pastel_green = UIColor(hex: "#68F08BFF")!
    /// Color 575757
    static let LT_matterhorn = UIColor(hex: "#57575714")!
    /// Color F0F0DC
    static let LT_sugar_cane = UIColor(hex: "#F0F0DCFF")!
    /// Color FCFCF8
    static let LT_ivory = UIColor(hex: "#FCFCF8FF")!
    /// Color EEFAF2
    static let LT_bubbles = UIColor(hex: "#EEFAF2FF")!
    /// Color 9BE5B9
    static let LT_vista_blue = UIColor(hex: "#9BE5B9FF")!
    
}

