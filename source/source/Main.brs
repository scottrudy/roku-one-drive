'*************************************************************
'** OneDrive for Roku 
'** Copyright (c) 2017 Sprudy.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

' All components are loaded before this routine executes

sub Main()
    print "in showChannelSGScreen"
    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen") 'Create the screen object
    m.port = CreateObject("roMessagePort") 'Create the message port
    screen.setMessagePort(m.port) 'Set message port to listen to the screen

    scene = screen.CreateScene("OneDriveForRoku") 'Create HomeScene
    screen.show()

    'event loop
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

