Sub init()
    m.HomeScreen = m.Top.findNode("homeScreen")
    m.HomeTitle = m.top.findNode("homeTitle")
    m.HomeExiter = m.top.findNode("homeExiter")
    m.HomeButtonGroup = m.top.findNode("homeButtonGroup")
    m.HomeImage = m.top.findNode("homeImage")
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
End sub