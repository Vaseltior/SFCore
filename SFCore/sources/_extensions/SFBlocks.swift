//
//  SkyrimFramework.h
//  SkyrimFramework
//
//  Created by Samuel Grau on 01/03/2015.
//  Copyright (c) 2015 Samuel Grau. All rights reserved.
//

import Foundation
import SFErrors

typealias SFVoidCompletionBlock = (Void) -> (Void)
typealias SFModelCompletionBlock = (SFErrors.SFFailable) -> (Void)
typealias SFModelDataCompletionBlock = (SFErrors.SFFailable, AnyObject?) -> (Void)
