*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn
Library           Collections

*** Variables ***
${URL}            https://www.saucedemo.com/
${username_field}    xpath://input[@id='user-name']
${password_field}    xpath://input[@id='password']
${login_button}    xpath://input[@id='login-button']

*** Tasks ***
TC1: Check Username and Password emty
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username is required
    Close Browser

TC2: Check Username empty
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username is required
    Close Browser

TC3: Check Password empty
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Password is required
    Close Browser

TC4: Check Username and Password
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    trinh
    Input Password    //*[@id="password"]    trinh
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username and password do not match any user in this service
    Close Browser

TC5: Dung ten sai mat khau
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    trinh
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username and password do not match any user in this service
    Close Browser

TC6: Dung mat khau sai ten
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    trinh
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username and password do not match any user in this service
    Close Browser

TC7: Dung ten: standard_user va mat khau: secret_sauce
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC8: sai ten: locked_out_user va mat khau: secret_sauce
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    locked_out_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Sorry, this user has been locked out.
    Close Browser

TC9: Dung ten: problem_user va mat khau: secret_sauce
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC10: Dung ten: performance_glitch_user va mat khau: secret_sauce
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC11: Dung ten: error_user va mat khau: secret_sauce
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC12: Dung ten: visual_user va mat khau: secret_sauce
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC13: Check Username and Password emty Set Window Size 800 600
    Open Browser    ${URL}    Chrome
    Set Window Size    800    600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username is required
    Close Browser

TC14: Dung mat khau sai ten kich thuoc man hinh tu do trên edge
    Open Browser    ${URL}    edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    trinh
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username and password do not match any user in this service
    Close Browser

TC15: Dung ten: error_user va mat khau: secret_sauce kich thuoc man hinh tu do trên edge
    Open Browser    ${URL}    edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC16: Check Username empty Set Window Size 800 600 tren firefox
    Open Browser    ${URL}    firefox
    Set Window Size    800    600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username is required
    Close Browser

TC17: Dung ten: visual_user va mat khau: secret_sauce Set Window Size 800 600
    Open Browser    ${URL}    Chrome
    Set Window Size    800    600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Close Browser

TC18: Check Username and Password emty Set Window Size 800 600
    Open Browser    ${URL}    Chrome
    Set Window Size    800    600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    ${EMPTY}
    Input Password    //*[@id="password"]    ${EMPTY}
    Click Element    ${login_button}
    Wait Until Element Is Visible    ${login_button}    timeout=5s
    ${username_class}    Get Element Attribute    ${username_field}    class
    ${password_class}    Get Element Attribute    ${password_field}    class
    Should Contain    ${username_class}    input_error
    Should Contain    ${password_class}    input_error
    ${actual_text}    Get Text    //*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${actual_text}    Epic sadface: Username is required
    Close Browser
