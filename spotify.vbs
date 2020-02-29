'Kill the Spotify and HueSync Apps if they're already running since 
'Spotify will not auto play if it was already running
'Hue Sync will not start syncing your lights if its not restarted and there is no way 
'begin syncing from command line arguments

Dim oShell : Set oShell = CreateObject("WScript.Shell")
oShell.Run "taskkill /f /im spotify.exe", , True
oShell.Run "taskkill /f /im HueSync.exe", , True


Set WshShell = WScript.CreateObject("WScript.Shell")
Comandline = "C:\Users\dsouz\AppData\Roaming\Spotify\Spotify.exe"
WScript.sleep 500
'Start the spotify app and navigate to the specified playlist
'Right now, for some reason it does not actually start playing from the playlist for me
'It will just play the last song it was playing
CreateObject("WScript.Shell").Run("spotify:user:dsouzadrian:playlist:https://open.spotify.com/playlist/6SRy9rNrNmzfgqDXuANECN?si=")
WScript.sleep 3000
'Start playing 
WshShell.SendKeys " "
WScript.sleep 100
'Skipping over to the next song.
WshShell.SendKeys "^{RIGHT}"

'Will begin light sync only after 6 PM.
Dim nightTime
currentTime = Time
nightTime = CDate("06:00:00 PM")

if currentTime > nightTime then
    'Code To run Philips Hue Sync
    Set WshShell1 = WScript.CreateObject("WScript.Shell")
    WshShell1.Run("""C:\Program Files\Hue Sync\HueSync.exe""")
end if


