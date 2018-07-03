//
//  UIImage+More.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "UIImage+More.h"

@implementation UIImage (More)

- (CGFloat)Width
{
    return self.size.width;
}

- (CGFloat)Height
{
    return self.size.height;
}


#pragma mark - 类方法

// 来自相机或相册的相片大小处理
/// 1. 等比绽放图片     照相出来时 1936.000000  2592.000000
+ (UIImage *)getScaleImage:(UIImage *)image toSize:(CGSize)size
{
    //压缩图片
    int iWidth  = image.size.width;
    int iHeight = image.size.height;
    if (iWidth > size.width)   // 自定义大小，想要弄多大，就弄多大
    {
        iWidth  = size.width;
        iHeight = image.size.height*iWidth/image.size.width;
        if (iHeight > size.height)
        {
            iHeight = size.height;
            iWidth  = image.size.width*iHeight/image.size.height;
        }
    }
    
    //主要在这里
    UIGraphicsBeginImageContext(CGSizeMake(iWidth, iHeight)); // 创建一个context
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, iWidth, iHeight)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

/// 2. 截取图中某部分小图
+ (UIImage *)getSubImageFromImage:(UIImage *)oldImage withRect:(CGRect)rect
{
    CGImageRef imageRef = oldImage.CGImage;
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, rect);
    
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
    
    // 创建一个新图像上下文
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, rect, subImageRef);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}

/// 3. 固定某张图片方向 向上
+ (UIImage *)fixOrientationForImage:(UIImage *)image
{
    // No-op if the orientation is already correct
    if (image.imageOrientation == UIImageOrientationUp) return image;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    //    if(self.imageOrientation == UIImageOrientationDown)
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage), 0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

/// 4. 获取自适应大小的图片
+ (UIImage *)getResizableImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
    return image;
}


@end
