Option Explicit
Dim URL,WshShell,i,songName,args,arg,WshShell1
Set args = Wscript.Arguments

'Building the song name from the arguments passed in through the google home. The entire song name is 
'sent as separate words. So we loop through all arguments passed in and build the song name.
For Each arg In args
  songName = songName & arg
Next
URL = "https://duckduckgo.com/?q=!ducky+"& songName &"+site%3Ayoutube.com"
Set WshShell = CreateObject("WScript.shell")
For i = 0 to 50
    WshShell.SendKeys(chr(175))
Next
WshShell.run "CMD /C start chrome.exe " & URL & "",0,False


'Will begin light sync only after 6 PM.
Dim nightTime,currentTime
currentTime = Time
nightTime = CDate("06:00:00 PM")

if currentTime > nightTime then
    'Code To run Philips Hue Sync
    Set WshShell1 = WScript.CreateObject("WScript.Shell")
    WshShell1.Run("""C:\Program Files\Hue Sync\HueSync.exe""")
end if