*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://www.saucedemo.com/
${browser}        chrome
${input_name}     id=user-name
${input_pwd}      id=password
${btn_login}      id=login-button
${btn_logout}     xpath=//a[contains(text(), "Logout")]
${link_item1}     id=item_4_title_link
${add_item1}      id=add-to-cart-sauce-labs-backpack
${input_fname}    id=first-name
${input_lname}    id=last-name
${input_code}     id=postal-code


*** Test Cases ***
TC1_Verify logout on the view product page
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    # Verify url, cookie after login successfully
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the view product page after logout
    Check msg after logout    https://www.saucedemo.com/inventory.html    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close Browser

TC2_Verify logout on the product detail page
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${link_item1}
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory-item.html?id=4
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the product detail after logout
    Check msg after logout    https://www.saucedemo.com/inventory-item.html?id=4    Epic sadface: You can only access '/inventory-item.html' when you are logged in.
    Close Browser

TC3_Verify logout on the cart page
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    # Navigate to the cart page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/cart.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the cart page after logout
    Check msg after logout    https://www.saucedemo.com/cart.html    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC4_Verify logout on the checkout step one page
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-one.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-one.html    Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.
    Close Browser

TC5_Verify logout on the checkout step two page
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-two.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-two.html    Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.
    Close Browser

TC6_Verify logout on the checkout complete page
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    Click Button    id=finish
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-complete.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-complete.html    Epic sadface: You can only access '/checkout-complete.html' when you are logged in.
    Close Browser

TC7_Verify logout in 2 tab
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}
    # Login and verify url, cookie in tab 1
    Login    standard_user    secret_sauce
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    # Open new tab and login
    Execute JavaScript    window.open('about:blank', '_blank')
    Switch Window    NEW
    Go To    ${url}
    Login    standard_user    secret_sauce
    # Verify url, cookie in tab 2
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie in tab 2
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to tab 1 and click cart
    Switch Window
    Click Element    id=shopping_cart_container
    ${error_text}    Get Text    class=error-message-container
    Should Be Equal As Strings    ${error_text}    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC8_Verify logout on the view product page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    # Verify url, cookie after login successfully
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the view product page after logout
    Check msg after logout    https://www.saucedemo.com/inventory.html    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close Browser

TC9_Verify logout on the product detail page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${link_item1}
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory-item.html?id=5
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the product detail after logout
    Check msg after logout    https://www.saucedemo.com/inventory-item.html?id=5    Epic sadface: You can only access '/inventory-item.html' when you are logged in.
    Close Browser

TC10_Verify logout on the cart page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    # Navigate to the cart page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/cart.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the cart page after logout
    Check msg after logout    https://www.saucedemo.com/cart.html    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC11_Verify logout on the checkout step one page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-one.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-one.html    Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.
    Close Browser

TC12_Verify logout on the checkout step two page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-two.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-two.html    Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.
    Close Browser

TC13_Verify logout in 2 tab
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    # Login and verify url, cookie in tab 1
    Login    problem_user    secret_sauce
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    # Open new tab and login
    Execute JavaScript    window.open('about:blank', '_blank')
    Switch Window    NEW
    Go To    ${url}
    Login    problem_user    secret_sauce
    # Verify url, cookie in tab 2
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie in tab 2
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to tab 1 and click cart
    Switch Window
    Click Element    id=shopping_cart_container
    ${error_text}    Get Text    class=error-message-container
    Should Be Equal As Strings    ${error_text}    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC14_Verify logout on the view product page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    # Verify url, cookie after login successfully
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the view product page after logout
    Check msg after logout    https://www.saucedemo.com/inventory.html    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close Browser

TC15_Verify logout on the product detail page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${link_item1}
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory-item.html?id=4
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the product detail after logout
    Check msg after logout    https://www.saucedemo.com/inventory-item.html?id=4    Epic sadface: You can only access '/inventory-item.html' when you are logged in.
    Close Browser

TC16_Verify logout on the cart page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    # Navigate to the cart page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/cart.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the cart page after logout
    Check msg after logout    https://www.saucedemo.com/cart.html    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC17_Verify logout on the checkout step one page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-one.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-one.html    Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.
    Close Browser

TC18_Verify logout on the checkout step two page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-two.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-two.html    Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.
    Close Browser

TC19_Verify logout on the checkout complete page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    Click Button    id=finish
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-complete.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-complete.html    Epic sadface: You can only access '/checkout-complete.html' when you are logged in.
    Close Browser

TC20_Verify logout in 2 tab
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    # Login and verify url, cookie in tab 1
    Login    performance_glitch_user    secret_sauce
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    # Open new tab and login
    Execute JavaScript    window.open('about:blank', '_blank')
    Switch Window    NEW
    Go To    ${url}
    Login    performance_glitch_user    secret_sauce
    # Verify url, cookie in tab 2
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie in tab 2
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to tab 1 and click cart
    Switch Window
    Click Element    id=shopping_cart_container
    ${error_text}    Get Text    class=error-message-container
    Should Be Equal As Strings    ${error_text}    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC21_Verify logout on the view product page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    # Verify url, cookie after login successfully
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the view product page after logout
    Check msg after logout    https://www.saucedemo.com/inventory.html    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close Browser

TC22_Verify logout on the product detail page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${link_item1}
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory-item.html?id=4
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the product detail after logout
    Check msg after logout    https://www.saucedemo.com/inventory-item.html?id=4    Epic sadface: You can only access '/inventory-item.html' when you are logged in.
    Close Browser

TC23_Verify logout on the cart page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    # Navigate to the cart page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/cart.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the cart page after logout
    Check msg after logout    https://www.saucedemo.com/cart.html    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC24_Verify logout on the checkout step one page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-one.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-one.html    Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.
    Close Browser

TC25_Verify logout on the checkout step two page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-two.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-two.html    Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.
    Close Browser

TC26_Verify logout on the checkout complete page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    Click Button    id=finish
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-complete.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-complete.html    Epic sadface: You can only access '/checkout-complete.html' when you are logged in.
    Close Browser

TC27_Verify logout in 2 tab
    [Tags]    error_user
    Open Browser    ${url}    ${browser}
    Wait Until Element Is Visible    ${input_name}
    # Login and verify url, cookie in tab 1
    Login    error_user    secret_sauce
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    # Open new tab and login
    Execute JavaScript    window.open('about:blank', '_blank')
    Switch Window    NEW
    Go To    ${url}
    Wait Until Element Is Visible    ${input_name}
    Login    error_user    secret_sauce
    # Verify url, cookie in tab 2
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie in tab 2
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to tab 1 and click cart
    Switch Window
    Click Element    id=shopping_cart_container
    ${error_text}    Get Text    class=error-message-container
    Should Be Equal As Strings    ${error_text}    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC28_Verify logout on the view product page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    # Verify url, cookie after login successfully
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the view product page after logout
    Check msg after logout    https://www.saucedemo.com/inventory.html    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close Browser

TC29_Verify logout on the product detail page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${link_item1}
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory-item.html?id=4
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the product detail after logout
    Check msg after logout    https://www.saucedemo.com/inventory-item.html?id=4    Epic sadface: You can only access '/inventory-item.html' when you are logged in.
    Close Browser

TC30_Verify logout on the cart page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    # Navigate to the cart page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/cart.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the cart page after logout
    Check msg after logout    https://www.saucedemo.com/cart.html    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

TC31_Verify logout on the checkout step one page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-one.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-one.html    Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.
    Close Browser

TC32_Verify logout on the checkout step two page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-step-two.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-step-two.html    Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.
    Close Browser

TC33_Verify logout on the checkout complete page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    # Navigate to the product detail page
    Click Element    ${add_item1}
    Click Element    id=shopping_cart_container
    Click Button    id=checkout
    Fill check out input
    Click Button    id=continue
    Click Button    id=finish
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/checkout-complete.html
    Get Cookie    session-username
    #Logout and verify url, cookie
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to the checkout page after logout
    Check msg after logout    https://www.saucedemo.com/checkout-complete.html    Epic sadface: You can only access '/checkout-complete.html' when you are logged in.
    Close Browser

TC34_Verify logout in 2 tab
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    # Login and verify url, cookie in tab 1
    Login    visual_user    secret_sauce
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    # Open new tab and login
    Execute JavaScript    window.open('about:blank', '_blank')
    Switch Window    NEW
    Go To    ${url}
    Login    visual_user    secret_sauce
    # Verify url, cookie in tab 2
    ${login_url}    Get Location
    Should Be Equal As Strings    ${login_url}    https://www.saucedemo.com/inventory.html
    Get Cookie    session-username
    #Logout and verify url, cookie in tab 2
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    ${btn_logout}    5s
    Click Element    ${btn_logout}
    ${logout_url}=    Get Location
    Should Be Equal As Strings    ${logout_url}    ${url}
    Wait Until Page Contains Element    ${btn_login}
    ${cookie_length} =    Execute JavaScript    return document.cookie.length
    Should Be Equal As Numbers    ${cookie_length}    0
    # Navigate to tab 1 and click cart
    Switch Window
    Click Element    id=shopping_cart_container
    ${error_text}    Get Text    class=error-message-container
    Should Be Equal As Strings    ${error_text}    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${name}    ${pwd}
    Input Text    ${input_name}    ${name}
    Input Password    ${input_pwd}    ${pwd}
    Click Button    ${btn_login}
    ${text}=    Get Text    class=title
    Should Be Equal As Strings    ${text}    Products

Check msg after logout
    [Arguments]    ${link}    ${msg}
    Go To    ${link}
    ${error_text}    Get Text    class=error-message-container
    Should Be Equal As Strings    ${error_text}    ${msg}

Fill check out input
    Input Text    ${input_fname}    Le
    Input Text    ${input_lname}    Ngan
    Input Text    ${input_code}    123
