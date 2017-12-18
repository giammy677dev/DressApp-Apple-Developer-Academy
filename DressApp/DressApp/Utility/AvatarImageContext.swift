//
//  AvatarImageContext.swift
//  DressApp
//
//  Created by Stefano Formicola on 15/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

func takeSnapshotOfView(view: UIView) -> UIImage? {
    /*
     Takes a view and returns the UIImage like a screenshot:
     */
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 1.0)
    view.drawHierarchy(in: view.frame, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
    
}
