'*************************************************************
'** OneDrive for Roku 
'** Copyright (c) 2017 Sprudy.  All rights reserved.
'** Use of the Roku Platform is subject to the Roku SDK Licence Agreement:
'** https://docs.roku.com/doc/developersdk/en-us
'*************************************************************

' All components are loaded before this routine executes

sub Main(input as Dynamic)
    print "Main"
    ' Add deep linking support here. Input is an associative array containing
    ' parameters that the client defines. Examples include "options, contentID, etc."
    ' See guide here: https://sdkdocs.roku.com/display/sdkdoc/External+Control+Guide
    ' For example, if a user clicks on an ad for a movie that your app provides,
    ' you will have mapped that movie to a contentID and you can parse that ID
    ' out from the input parameter here.
    '
    ' Call the service provider API to look up the content details, or required data
    ' for id

    ' If a variable is not Invalid, then it can be cast to an Object
    if input <> Invalid
        if input.reason <> Invalid And input.reason = "ad" then
            'show ad
        end if
        if input.contentID <> Invalid
            m.contentID = input.contentID
            'customize content for content id
        end if
    end if
    showMainScene(input)
end sub

sub showMainScene(input as Object)
    print "in showMainScene"

    'Indicate this is a Roku SceneGraph application'
    screen = CreateObject("roSGScreen") 'Create the screen object
    m.port = CreateObject("roMessagePort") 'Create the message port
    screen.setMessagePort(m.port) 'Set message port to listen to the screen

    scene = screen.CreateScene("mainScene") 'Create MainScene

    'Deep link params
    m.global = screen.getGlobalNode()
    m.global.addFields({ input: input })

    screen.show()

    'event loop
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            print "received screen event"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

