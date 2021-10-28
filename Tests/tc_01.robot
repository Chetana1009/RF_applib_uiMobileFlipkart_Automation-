*** Settings ***
Library  AppiumLibrary

*** Test Cases ***
User should be able to search in flipkart application
    [Tags]  01_tc
    Launch the flipkart application
    User verifies screen content
    #User goes to Electronics tab
    User is able to click search icon 
    Scroll until mobile is visible
    
    
*** Keywords ***
Launch the flipkart application
    Open application  ${flip_srver}  platformName=${proj_name}  platformVersion=${version_device}  deviceName=${name_device}  app=${app_loc}

User verifies screen content
    Wait Until Page Contains    English  timeout=40s
    Click text    text=English
    Wait Until Page Contains    CONTINUE    timeout=15s  
    Click Element    id=${btn_cont}
    Capture Page Screenshot  tc01.png
    Log Source


#User goes to Electronics tab
    

User is able to click search icon
    Wait Until Page Contains Element    id=${srch}    timeout=30s
    Click Element    id=${srch}
    Click Text    text=mobiles    exact_match=True
    Wait Until Page Contains Element    id=${cont}    timeout=15s 
    Click Text    text=CONTINUE    exact_match=True
    Wait Until Page Contains Element    id=${allow_id}    timeout=10s
    Click Text    text=ALLOW    exact_match=True

Scroll until mobile is visible
    Swipe By Percent    60  90  70  10
    #Swipe By Percent    60  90  80  10
    #Wait Until Page Contains    timeout=30s
    #Click Element   robot -d Result -i 01_tc Tests
    Capture Page Screenshot  tc02.png
    Wait Until Page Contains Element    class=${view_mob}    timeout=30s
    Click Element    class=${view_mob}
    Log Source

    

***Variables***
${flip_srver} =  http://localhost:4723/wd/hub
${name_device} =  emulator-5554
${version_device}  = 9.0
${app_loc} =  C:/FlipkartAppium/Mobile/Flipkart-7.18.apk
${proj_name} =  Android
${btn_cont}=    com.flipkart.android:id/select_btn
${elmt}=    com.flipkart.android:id/banner_image 
${srch}=    com.flipkart.android:id/search_widget_textbox
${cont}=    android:id/content   
${allow_id}=    com.android.packageinstaller:id/permission_allow_button  
${view_mob}=    android.widget.TextView
