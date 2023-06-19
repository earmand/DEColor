//  Converted to Swift 4 by Swiftify v4.2.6866 - https://objectivec2swift.com/
//
//  DEColor.swift
//  TopoMap
//
//  Created by earmand on 1/31/17.
//  Copyright © 2017 Earman Consulting. All rights reserved.
//

//  1   (blue,green+)  (blue-,green) (green red+) (green-,red) (red, blue+), (red-, blue)

//
//  DEColor.swift
//  TopoMap
//
//  Created by earmand on 1/31/17.
//  Copyright © 2017 Earman Consulting. All rights reserved.
//

import Foundation

class DEColor {
/*
func Mask8(x: Any) -> Any {
    return x & 0xff
}
func R(x: Any) {
    Mask8(x)
}
func G(x: Any) {
    Mask8(x >> 8)
}
func B(x: Any) {
    Mask8(x >> 16)
}
func A(x: Any) {
    Mask8(x >> 24)
}

class func RGBAMake(r: Any, g: Any, b: Any, a: Any) -> Int {
    return Mask8(r) | Mask8(g) << 8 | Mask8(b) << 16 | Mask8(a) << 24
}
*/
    
    class func RGBAMake(r:Int,g:Int,b:Int,a:Int) -> UInt32 {
        return (UInt32(r) & 0xff | (UInt32(g) & 0xff) << 8 | (UInt32(b) & 0xff) << 16 | (UInt32(a) & 0xff) << 24)}

    //  Value float from 0..1
    // Alpha int 0..255
    class func rgba3ColorGradient(from value: Float, alpha: Int, colors: Int) -> UInt32 {
        var red: Int = 0
        var blue: Int = 0
        var green: Int = 0

        if value >= 1.0 {
            blue = 10
            red = 10
            green = 10
        } else if value > 0 {
            //float colorWheel = fmin(1, deltaValue/maxValue) * colorWheelMax;
            //colorWheel = floorf(colors*colorWheel)/(float)colors;

            let colorWheel = floorf(value * Float(colors)) / Float(colors)

            let offset = Int(colorWheel * 256 * 6)
            let colorBase: Int = offset / 256
            let colorDelta: Int = offset % 256

            switch colorBase {
                case 0:
                    blue = 255
                    green = colorDelta
                    red = 0
                case 1:
                    blue = 255 - colorDelta
                    green = 255
                    red = 0
                case 2:
                    blue = 0
                    green = 255
                    red = colorDelta
                case 3:
                    blue = 0
                    green = 255 - colorDelta
                    red = 255
                case 4:
                    blue = colorDelta
                    green = 0
                    red = 255
                case 5:
                    blue = 255
                    green = 0
                    red = 255 - colorDelta
                default:
                    blue = 255
                    green = 255
                    red = 255
                    print("Integer out of range")
            }
        }

        let color = self.RGBAMake(r:red, g:green, b:blue, a:alpha)
        return UInt32(color)

    }

    //  Value float from 0..1
    // Alpha int 0..255
    class func rgba3ColorGradient(from value: Float, alpha: Int) -> UInt32 {
        let offset = Int(value * 256 * 5 - 1)
        let colorBase: Int = offset / 256
        let colorDelta: Int = offset % 256

        var red: Int = 0
        var blue: Int = 0
        var green: Int = 0

        switch colorBase {
            case 0:
                blue = 255
                green = colorDelta
                red = 0
            case 1:
                blue = 255 - colorDelta
                green = 255
                red = 0
            case 2:
                blue = 0
                green = 255
                red = colorDelta
            case 3:
                blue = 0
                green = 255 - colorDelta
                red = 255
            case 4:
                blue = colorDelta
                green = 0
                red = 255
            case 5:
                blue = 255
                green = 0
                red = 255 - colorDelta
            default:
                blue = 255
                green = 255
                red = 255
                print("Integer out of range")
        }

        let color = RGBAMake(r:red, g:green, b:blue, a:alpha)
        return color

    }

/*
    class func rgba3ColorGradient(fromFloat2 value: Float, alpha: Int) -> UInt32 {

        var color: Int32 = 0
        //color = deltaValue;
        //color = color | 0xFF000000;
        let deltaValue: Int = 0

        if (false) {
            if deltaValue < 0 {
                color = RGBAMake(0, 0, 0, 0)
            } else if deltaValue < 200 {
                color = RGBAMake(0, 0, 255, alpha)
            } else if deltaValue < 400 {
                color = RGBAMake(0, 255, 0, alpha)
            } else if deltaValue < 600 {
                color = RGBAMake(255, 255, 0, alpha)
            } else if deltaValue < 800 {
                color = RGBAMake(255, 0, 0, alpha)
            } else {
                color = RGBAMake(160, 0, 255, alpha)
            }
        }

        return color
    }
 */
}
