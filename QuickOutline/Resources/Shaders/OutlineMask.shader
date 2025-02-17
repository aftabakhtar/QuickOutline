﻿//
//  OutlineMask.shader
//  QuickOutline
//
//  Created by Chris Nolet on 2/21/18.
//  Copyright © 2018 Chris Nolet. All rights reserved.
//

Shader "Custom/Outline Mask" {
    Properties {
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest("ZTest", Float) = 0
        _StencilRef("Stencil Reference", Range(1, 255)) = 1
    }

    SubShader {
        Tags {
            "Queue" = "Transparent+100"
            "RenderType" = "Transparent"
        }

        Pass {
            Name "Mask"
            Cull Off
            ZTest LEqual  // Change this to LEqual
            ZWrite On     // Enable Z writing
            ColorMask 0

            Stencil {
                Ref [_StencilRef]
                Pass Replace
                Comp Always
            }
        }
    }
}
