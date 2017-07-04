'*************************************************************
'** OneDrive for Roku 
'** Copyright (c) 2017 Sprudy.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

' All components are loaded before this routine executes

' input is an associative array that will allow for features like deep linking
Sub main(input as Dynamic)
    print "Main"
    showMainScene()
End Sub

Sub showMainScene()
    print "in showMainScene"

    'Indicate this is a Roku SceneGraph application'
    screen = createObject("roSGScreen") 'Create the screen object
    m.Port = createObject("roMessagePort") 'Create the message port
    screen.setMessagePort(m.Port) 'Set message port to listen to the screen

    scene = screen.createScene("mainScene") 'Create MainScene
    screen.show()

    'event loop
    While(true)
        msg = wait(0, m.port)
        If type(msg) = "roSGScreenEvent"
            If msg.isScreenClosed() Then Return
        End If
    End While
End Sub

