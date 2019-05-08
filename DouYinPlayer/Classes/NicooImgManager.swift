

import UIKit

class NicooImgManager: UIView {
    class func foundImage(imageName:String) -> UIImage? {
        let bundleB  = Bundle(for: self.classForCoder()) //先找到最外层Bundle
        guard let resrouseURL = bundleB.url(forResource: "DouYinPlayer", withExtension: "bundle") else { return nil }
        let bundle = Bundle(url: resrouseURL) // 根据URL找到自己的Bundle
        return UIImage(named: imageName, in: bundle , compatibleWith: nil) //在自己的Bundle中找图片
    }
    
}
public struct  NicooVideoModel {
    public var videoName: String?
    public var videoUrl: String?
    public var videoPlaySinceTime: Float = 0
}


class TextManager: NSObject {
    
    open class func getAttributeStringWithString(_ string: String, lineSpace: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        let paragraphStye = NSMutableParagraphStyle()
        //调整行间距
        paragraphStye.lineSpacing = lineSpace
        let rang = NSMakeRange(0, CFStringGetLength(string as CFString?))
        
        attributedString.addAttribute(.paragraphStyle, value: paragraphStye, range: rang)
        
        return attributedString
    }
    
    open class func configScoreString(allString: String) -> NSAttributedString? {
        let strings = allString.components(separatedBy: ".")
        if strings.count < 2 { return nil }
        
        let attribute = [NSAttributedString.Key.font : UIFont(name: "American Typewriter", size: 20) ?? UIFont.systemFont(ofSize: 20)] as [NSAttributedString.Key : Any]
        let attSting = strings.first
        if  attSting != nil && !attSting!.isEmpty {
            let pointString = NSMutableAttributedString(string: allString)
            pointString.addAttributes(attribute, range: NSRange.init(location: 0, length: attSting!.count))
            return pointString
        }
        return nil
    }
    
    
}


public extension UIDevice {
    
    /// 判断是否为X系列
    ///
    /// - Returns: 兼容X系列手机
    public func isXSeriesDevices() -> Bool {
        return (iPhoneType() == "iPhoneX" || iPhoneType() == "iPhoneXS" || iPhoneType() == "iPhoneXSMax" || iPhoneType() == "iPhoneXR")
    }
   
    func iPhoneType() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
            return String(cString: ptr)
        }
        if platform == "iPhone6,1" { return "iPhone5S"}
        if platform == "iPhone6,2" { return "iPhone5S"}
        if platform == "iPhone7,1" { return "iPhone6Plus"}
        if platform == "iPhone7,2" { return "iPhone6"}
        if platform == "iPhone8,1" { return "iPhone6S"}
        if platform == "iPhone8,2" { return "iPhone6SPlus"}
        if platform == "iPhone8,4" { return "iPhoneSE"}
        if platform == "iPhone9,1" { return "iPhone7"}
        if platform == "iPhone9,2" { return "iPhone7Plus"}
        if platform == "iPhone10,1" { return "iPhone8"}
        if platform == "iPhone10,2" { return "iPhone8Plus"}
        if platform == "iPhone10,3" { return "iPhoneX"}    // 国行
        if platform == "iPhone10,4" { return "iPhone8"}
        if platform == "iPhone10,5" { return "iPhone8Plus"}
        if platform == "iPhone10,6" { return "iPhoneX"}   // 美港
        if platform == "iPhone11,2" { return "iPhoneXS"}
        if platform == "iPhone11,4" { return "iPhoneXSMax"} // 国行
        if platform == "iPhone11,6" { return "iPhoneXSMax"} // 美港
        if platform == "iPhone11,8" { return "iPhoneXR"}
        if platform == "i386"   { return "Simulator"}
        if platform == "x86_64" { return "Simulator"}
        return platform
    }
    /// 兼容iPad
    ///
    /// - Returns: 判断是否为iPad
    public func isiPad() -> Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        return false
    }
}
