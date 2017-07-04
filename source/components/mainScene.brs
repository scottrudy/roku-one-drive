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
    m.HomeButtonGroup.Buttons = ["Exit"]
    m.HomeTitle.Text = "Coming soon!"
End Sub

Sub onHomeButtonSelected(event as object)
    print "onButtonSelected"
    If m.HomeButtonGroup.buttonSelected = 0
        print "Exit Button Selected"
        m.HomeExiter.control = "RUN"
    Else
        print "Error. There's nothing here"
    End If
End Sub