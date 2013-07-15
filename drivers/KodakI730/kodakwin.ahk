DetectHiddenText, Off

IfWinExist, KODAK i730 Scanner, Setti&ngs
{
    MsgBox, We are in the Home window
    ;List of presets, buttons: settings TO image or device (as prev), preview, scan
}
else IfWinExist, KODAK i730 Scanner, De&vice
{
    MsgBox, We are in the Image window
    ;to home<home device> to device preview, scan
}
else IfWinExist, E:\, FolderView
{
    MsgBox, We are in the E window
}
else IfWinExist, KODAK i730 Scanner, &Image
{
    MsgBox, We are in the Device window
    ;to home<home image> to
}
else IfWinExist, KODAK i730 Scanner
{
    MsgBox, We are in the scanner window, but who knows where
}
else
    MsgBox, We don't know where the hell we are

ExitApp
