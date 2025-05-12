import XMonad

import XMonad.Util.EZConfig
import XMonad.Actions.Navigation2D



main :: IO ()
main = xmonad $ withNavigation2DConfig def
              $ additionalNav2DKeys (xK_Up, xK_Left, xK_Down, xK_Right)
                                    [(mod4Mask,               windowGo  ),
                                     (mod4Mask .|. shiftMask, windowSwap)]
                                    False
              $ additionalNav2DKeys (xK_u, xK_l, xK_d, xK_r)
                                    [(mod4Mask,               screenGo  ),
                                     (mod4Mask .|. shiftMask, screenSwap)]
                                    False
              $ def
    { 
      modMask = mod4Mask
    }
    `additionalKeysP`
    [ ("M-<Return>", spawn "kitty"),
      ("M-S-<Return>", spawn "qutebrowser"),
      ("M-<Space>", spawn "adams_menu"),
      ("M-C-<Left>", sendMessage Shrink),
      ("M-C-<Right>", sendMessage Expand),
      ("M-<Delete>", kill)
    ]

