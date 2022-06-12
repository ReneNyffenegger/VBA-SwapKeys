' vi: ft=basic
'
' V.1

option explicit

implements IKeyboardEvent

dim inputs(0 to 0) as INPUT_KI


public sub init()
   inputs(0).dwType      = INPUT_KEYBOARD
   inputs(0).dwFlags     = 0
   inputs(0).dwTime      = 0
   inputs(0).dwExtraInfo = 0
end sub

public function IKeyboardEvent_ev(vk_keyCode as long, pressed as boolean, alt as boolean, scanCode as long, time as long) ' {

   debug.print "vk_keyCode = " & vk_keyCode & ", pressed = " & pressed & ", alt = " & alt & ", scanCode = " & scanCode & ", time = " & time


   if     vk_keyCode = VK_ESCAPE  then

          inputs(0).wVK = VK_CAPITAL 
          debug.print "   VK_ESCAPE -> VK_CAPITAL"

   elseif vk_keyCode = VK_CAPITAL then

          inputs(0).wVK = VK_ESCAPE 
          debug.print "   VK_CAPITAL -> VK_ESCAPE"

   elseif vk_keyCode = VK_RMENU   then

          inputs(0).wVK = VK_RCONTROL
          debug.print "   VK_RMENU -> VK_RCONTROL"

   else
           IKeyboardEvent_ev = false
          debug.print "   exit function"
           exit function
   end if


   if pressed then
      inputs(0).dwFlags = 0
   else
      inputs(0).dwFlags = KEYEVENTF_KEYUP
   end if


   SendInput 1, inputs(0), lenB(inputs(0))

   IKeyboardEvent_ev = true

end function ' }
