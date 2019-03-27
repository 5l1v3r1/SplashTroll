#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=SplashTroll.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

FileInstall("SplashTroll.jpg", @TempDir & "\SplashTroll.jpg", 1)
FileInstall("SplashTroll.wav", @TempDir & "\SplashTroll.wav", 1)
FileInstall("authread.au3", @TempDir & "\authread.au3", 1)

#include "authread.au3"

Global $imageDestination = @TempDir & "\SplashTroll.jpg"
Global $soundDestination = @TempDir & "\SplashTroll.wav"
Global $imageSize = 400

Global $xDesktop = @DesktopWidth - $imageSize
Global $yDesktop = @DesktopHeight - $imageSize

_AuThread_Startup()
For $i = 1 To 5 Step 1
	_AuThread_StartThread("loop")
	Sleep(420)
Next
_AuThread_StartThread("playsound")
HotKeySet("{ESC}", "_exit")
While 1
	Sleep(2147483647)
WEnd

Func loop()
	While 1
		Local $xPos = Random(0, $xDesktop, 1)
		Local $yPos = Random(0, $yDesktop, 1)
		SplashImageOn("", $imageDestination, $imageSize, $imageSize, $xPos, $yPos, 1)
		Sleep(300)
		SplashOff()
	WEnd
EndFunc

Func playsound()
	While 1
		SoundPlay($soundDestination, 1)
	WEnd
EndFunc

Func _exit()
	Exit