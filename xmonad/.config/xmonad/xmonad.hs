import XMonad

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Actions.Navigation2D
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Run
import  XMonad.Util.Hacks
import System.IO (stdout)


-- TODO: Make xmessage doFloat


scratchpads = [
              NS "ScratchPad" "kitty --title scratchPad --name scratchPad" (title =? "scratchPad")
                  (customFloating $ W.RationalRect 0.05 0.05 0.90 0.90),
              NS  "Yazi" "kitty --title yazi --name yazi -e yazi" (title =? "yazi")
                  (customFloating $ W.RationalRect 0.05 0.05 0.90 0.90)
              ] where role = stringProperty "WM_WINDOW_ROLE"

main = do
        xmproc <- spawnPipe "xmobar"
        xmonad $ docks $ withNavigation2DConfig def $ defaults xmproc

defaults xmproc = def {
            modMask = mod4Mask,
            logHook = dynamicLogWithPP xmobarPP 
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        },
            manageHook = namedScratchpadManageHook scratchpads,
            layoutHook = avoidStruts $ layoutHook def
} `additionalKeys`
  [ ((mod4Mask, xK_Return), spawn "kitty"),
    ((mod4Mask .|. shiftMask, xK_Return), spawn "qutebrowser"),
    ((mod4Mask, xK_space), spawn "adams_menu"),
    ((mod4Mask .|. controlMask, xK_Left), sendMessage Shrink),
    ((mod4Mask .|. controlMask, xK_Right), sendMessage Expand),
    ((mod4Mask, xK_Delete), kill),
    ((0, xK_F1), namedScratchpadAction scratchpads "ScratchPad"),
    ((0, xK_F12), namedScratchpadAction scratchpads "Yazi"),
    ((0, xK_Print), namedScratchpadAction scratchpads "Yazi"),
    ((mod4Mask, xK_Tab), sendMessage NextLayout),
    ((mod4Mask, xK_Left), windowGo L False),
    ((mod4Mask, xK_Right), windowGo R False),
    ((mod4Mask, xK_Up), windowGo U False),
    ((mod4Mask, xK_Down), windowGo D False),
    ((mod4Mask .|. shiftMask, xK_Left), windowSwap L False),
    ((mod4Mask .|. shiftMask, xK_Right), windowSwap R False),
    ((mod4Mask .|. shiftMask, xK_Up), windowSwap U False),
    ((mod4Mask .|. shiftMask, xK_Down), windowSwap D False)
  ]
