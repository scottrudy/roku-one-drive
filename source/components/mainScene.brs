Sub init()
    m.HomeScreen = m.Top.findNode("homeScreen")
    m.HomeTitle = m.Top.findNode("homeTitle")
    m.HomeExiter = m.Top.findNode("homeExiter")
    m.HomeButtonGroup = m.Top.findNode("homeButtonGroup")
    m.HomeImage = m.Top.findNode("homeImage")
    setContent()
    m.HomeButtonGroup.setFocus(true)
    m.HomeButtonGroup.observeField("buttonSelected","onHomeButtonSelected")
End Sub

Sub setContent()
    print "Setting Content"
    m.HomeImage.Uri="pkg:/images/channel-poster_sd.png"
    m.HomeButtonGroup.Buttons = ["Nothing", "Exit"]
    m.HomeTitle.Text = "Choose exit to leave"
End Sub

Sub onHomeButtonSelected(event as object)
    print "onButtonSelected"
    If m.HomeButtonGroup.buttonSelected = 0
        print "Nothing Button Selected"
    Else
        print "Exit Button Selected"
        m.HomeExiter.control = "RUN"
    End If
End Sub