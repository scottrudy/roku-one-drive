Sub init()
    m.Top.functionName = "go"
End Sub

Sub go()
    deviceInfo = createObject("roDeviceInfo")
    ipAddress = DeviceInfo.getIPAddrs()
    transfer = createObject("roUrlTransfer")
    For Each item In ipAddress
        url = "http://" + ipAddress[item] + ":8060/keypress/Back"
        transfer.setUrl(url)
        transfer.postFromString("") 'TODO: Address Sync-wait interruption if necessary
    End For
End Sub