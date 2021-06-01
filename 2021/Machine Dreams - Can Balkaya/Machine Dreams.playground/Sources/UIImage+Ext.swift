import UIKit

extension UIImage {
    
    // MARK: - Methods
    func getPixelColor(pos: CGPoint) -> UIColor {
        /// convert to standard sRGB image
        guard let cgImage = cgImage,
            let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
            let context = CGContext(data: nil,
                width: Int(size.width), height: Int(size.height),
                bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace,
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        else { return .white }

        context.draw(cgImage, in: CGRect(origin: .zero, size: size))
        
        /// Get the newly converted cgImage
        guard let newCGImage = context.makeImage(),
            let newDataProvider = newCGImage.dataProvider,
            let data = newDataProvider.data
        else { return .white }
        let pixelData: UnsafePointer<UInt8> = CFDataGetBytePtr(data)

        /// Calculate the pixel position based on point given
        let remaining = 8 - ((Int(size.width)) % 8)
        let padding = (remaining < 8) ? remaining : 0
        let pixelInfo: Int = (((Int(size.width) + padding) * Int(pos.y)) + Int(pos.x)) * 4
        
        let red = CGFloat(pixelData[pixelInfo]) / CGFloat(255)
        let green = CGFloat(pixelData[pixelInfo+1]) / CGFloat(255)
        let blue = CGFloat(pixelData[pixelInfo+2]) / CGFloat(255)
        let alpha = CGFloat(pixelData[pixelInfo+3]) / CGFloat(255)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
