' V.1
'
option explicit

private kbsk as IKeyboardEvent_SwapKeys

sub startSwapKeys() ' {

    set kbsk = new IKeyboardEvent_SwapKeys 
    kbsk.init

    startLowLevelKeyboardHook kbsk

end sub ' }
