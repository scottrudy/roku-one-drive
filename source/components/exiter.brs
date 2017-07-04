Sub init()
    m.Top.functionName = "go"
End Sub

Sub go()
    DeviceInfo = CreateObject("roDeviceInfo")
    IPAddr = DeviceInfo.getIPAddrs()
    transfer = createObject("roUrlTransfer")
    for each item in IPAddr
        url = "http://" + IPAddr[item] + ":8060/keypress/Back"
        transfer.setUrl(url)
        transfer.PostFromString("") 'TODO: Address Sync-wait interruption if necessary
    end for
End Sub