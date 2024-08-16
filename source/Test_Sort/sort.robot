*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           BuiltIn
Library           Collections
*** Variables ***
${URL}            https://www.saucedemo.com/
${username_field}    xpath://input[@id='user-name']
${password_field}    xpath://input[@id='password']
${login_button}    xpath://input[@id='login-button']
@{expected_names_reduce}    Test.allTheThings() T-Shirt (Red)    Sauce Labs Onesie    Sauce Labs Fleece Jacket    Sauce Labs Bolt T-Shirt    Sauce Labs Bike Light    Sauce Labs Backpack
@{expected_names_az}    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
@{expected_price_low}    $7.99    $9.99    $15.99    $15.99    $29.99    $49.99
@{expected_price_high}    $49.99    $29.99    $15.99    $15.99    $9.99    $7.99
*** Tasks ***

#Sort with name: standard_user 
TC87: sort Z to A
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Close Browser
TC88: sort price low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC89: sort price high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC90: sort Z to A A to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
TC91: sort Z to A and low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC92: sort Z to A and low với trình duyệt Edge và kích thước màn hình tự do
    Open Browser    ${URL}    Edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC93: sort Z to A and low với trình duyệt Edge và Set Window Size 800 600
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC94: sort Z to A and low and high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC95: sort Z to A and low and high and a to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
#Sort with name: problem_user 
TC96: sort Z to A
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Close Browser
TC97: sort price low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC98: sort price high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC99: sort Z to A A to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
TC100: sort Z to A and low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC101: sort Z to A and low trên trình duyệt Edge và kích thước màn hình tự do
    Open Browser    ${URL}    Edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC102: sort Z to A and low trên trình duyệt Edge và Set Window Size 800 600
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC103: sort Z to A and low and high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC104: sort Z to A and low and high and A to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
#Sort with name: performance_glitch_user 
TC105: sort Z to A
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Close Browser
TC106: sort price low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC107: sort price high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC108: sort Z to A A to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
TC109: sort Z to A and low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC110: sort Z to A and low trên trình duyệt Edge và kích thước màn hình tự do
    Open Browser    ${URL}    Edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC111: sort Z to A and low trên trình duyệt Edge và Set Window Size 800 600
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC112: sort Z to A and low and high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC113: sort Z to A and low and high and a to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
#Sort with name: error_user # chưa fix được
TC114: sort Z to A
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Close Browser
TC115: sort price low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC116: sort price high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC117: sort Z to A A to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    #Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
TC118: sort Z to A and low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser

TC119: sort Z to A and low trên trình duyệt Edge và Set Window Size 800 600
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC120: sort Z to A and low and high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC121: sort Z to A and low and high and a to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Handle Alert
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
#Sort with name: visual_user
TC122: sort Z to A
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Close Browser
TC123: sort price low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC124: sort price high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC125: sort Z to A A to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser
TC126: sort Z to A and low
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser

TC127: sort Z to A and low trên trình duyệt Edge và Set Window Size 800 600
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Close Browser
TC128: sort Z to A and low and high
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Close Browser

TC129: sort Z to A and low and high and a to Z
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    za
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    Should Be Equal As Strings    ${selected_option}    Name (Z to A)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_reduce}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    lohi
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Should Be Equal As Strings    ${selected_option}    Price (low to high)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_low}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    hilo
    Sleep    10s
    ${selected_option}    Get Text   //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Should Be Equal As Strings    ${selected_option}    Price (high to low)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    //div[@class="inventory_item_price"]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_price_high}
    Select From List By Value   //*[@id="header_container"]/div[2]/div/span/select    az
    Sleep    10s
    ${selected_option}    Get Text    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    Should Be Equal As Strings    ${selected_option}    Name (A to Z)
    @{actual_names}    Create List
    @{inventory_items}    Get WebElements    xpath://div[@class="inventory_item_name "]
    FOR    ${item}    IN    @{inventory_items}
        ${name}    Get Text    ${item}
        Append To List    ${actual_names}    ${name}
    END
    Should Be Equal    ${actual_names}    ${expected_names_az}
    Close Browser