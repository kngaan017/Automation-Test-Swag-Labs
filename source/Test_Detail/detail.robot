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

*** Tasks ***

#Xem san pham voi Usernam: standard_user
TC19: chi tiet Sauce Labs Backpack
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC20: chi tiet Sauce Labs Backpack click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC21: chi tiet Sauce Labs Backpack voi Edge va khich thuoc man hinh tu do
    Open Browser    ${URL}    Edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC22: chi tiet Sauce Labs Bike Light
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC23: chi tiet Sauce Labs Bike Light click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC24: chi tiet Sauce Labs Bike Light click img Set Window Size 800 600 trình duyệt Firefox
    Open Browser    ${URL}    firefox
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC25: chi tiet Sauce Labs Bolt T-Shirt
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC26: chi tiet Sauce Labs Bolt T-Shirt click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC27: chi tiet Sauce Labs Bolt T-Shirt click img Set Window Size 800 600 trình duyệt Edge
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC28: chi tiet Sauce Labs Fleece Jacket
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC29: chi tiet Sauce Labs Fleece Jacket click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC30: chi tiet Sauce Labs Fleece Jacket với kích thước tự do và trình duyệt firefox
    Open Browser    ${URL}    firefox
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC31: chi tiet Sauce Labs Onesie
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC32: chi tiet Sauce Labs Onesie click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC33: chi tiet Test.allTheThings T-Shirt Red
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC34: chi tiet Test.allTheThings T-Shirt Red click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
# Xem sản phẩm với Username: problem_user
TC35: chi tiet Sauce Labs Backpack
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC36: chi tiet Sauce Labs Backpack click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC37: chi tiet Sauce Labs Backpack kich thước màn hình tự do và trên trình duyệt Edge
    Open Browser    ${URL}    Edge
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC38: chi tiet Sauce Labs Bike Light
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC39: chi tiet Sauce Labs Bike Light click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC40: chi tiet Sauce Labs Bike Light click img với Set Window Size 800 600 và trình duyệt Firefox 
    Open Browser    ${URL}    firefox
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC41: chi tiet Sauce Labs Bolt T-Shirt
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC42: chi tiet Sauce Labs Bolt T-Shirt click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC43: chi tiet Sauce Labs Bolt T-Shirt click img Set Window Size 800 600 trình duyệt Edge
   
    Open Browser    ${URL}    Edge
    Set Window Size     800     600
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC44: chi tiet Sauce Labs Fleece Jacket
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=6
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC45: chi tiet Sauce Labs Fleece Jacket click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=6
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC46: chi tiet Sauce Labs Fleece Jacket click img với kích thước tự do và trình duyệt firefox
    Open Browser    ${URL}    firefox
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=6
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
TC47: chi tiet Sauce Labs Onesie
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC48: chi tiet Sauce Labs Onesie click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC49: chi tiet Test.allTheThings T-Shirt Red
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC50: chi tiet Test.allTheThings T-Shirt Red click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    problem_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
#Đăng nhập với Username: performance_glitch_user
TC51: chi tiet Sauce Labs Backpack
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC52: chi tiet Sauce Labs Backpack click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_img_link"]/img
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC53: chi tiet Sauce Labs Bike Light
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC54: chi tiet Sauce Labs Bike Light click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC55: chi tiet Sauce Labs Bolt T-Shirt
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC56: chi tiet Sauce Labs Bolt T-Shirt click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC57: chi tiet Sauce Labs Fleece Jacket
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC58: chi tiet Sauce Labs Fleece Jacket click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC59: chi tiet Sauce Labs Onesie
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC60: chi tiet Sauce Labs Onesie click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC61: chi tiet Test.allTheThings T-Shirt Red
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC62: chi tiet Test.allTheThings T-Shirt Red click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    performance_glitch_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
#Xem sản phẩm với Username: error_user
TC63: chi tiet Sauce Labs Backpack
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC64: chi tiet Sauce Labs Backpack click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_img_link"]/img
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC65: chi tiet Sauce Labs Bike Light
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC66: chi tiet Sauce Labs Bike Light click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC67: chi tiet Sauce Labs Bolt T-Shirt
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC68: chi tiet Sauce Labs Bolt T-Shirt click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC69: chi tiet Sauce Labs Fleece Jacket
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC70: chi tiet Sauce Labs Fleece Jacket click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC71: chi tiet Sauce Labs Onesie
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC72: chi tiet Sauce Labs Onesie click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC73: chi tiet Test.allTheThings T-Shirt Red
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC74: chi tiet Test.allTheThings T-Shirt Red click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    error_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
#Xem chi tiết với Username: visual_user
TC75: chi tiet Sauce Labs Backpack
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC76: chi tiet Sauce Labs Backpack click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_4_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_4_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Page Should Contain Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-backpack"]
    ${image_1}    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_4_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Element    //*[@id="item_4_img_link"]/img
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=4
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC77: chi tiet Sauce Labs Bike Light
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC78: chi tiet Sauce Labs Bike Light click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_0_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_0_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bike-light"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bike-light"]
    ${image_1}    Get Element Attribute    //*[@id="item_0_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_0_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element    //*[@id="item_0_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=0
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC79: chi tiet Sauce Labs Bolt T-Shirt
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC80: chi tiet Sauce Labs Bolt T-Shirt click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_1_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_1_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    ${image_1}    Get Element Attribute    //*[@id="item_1_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_1_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Element    //*[@id="item_1_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=1
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC81: chi tiet Sauce Labs Fleece Jacket
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC82: chi tiet Sauce Labs Fleece Jacket click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_5_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_5_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    ${image_1}    Get Element Attribute    //*[@id="item_5_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_5_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    //*[@id="item_5_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=5
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC83: chi tiet Sauce Labs Onesie
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC84: chi tiet Sauce Labs Onesie click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_2_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_2_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-sauce-labs-onesie"]
    Element Should Be Visible    //*[@id="add-to-cart-sauce-labs-onesie"]
    ${image_1}    Get Element Attribute    //*[@id="item_2_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_2_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-sauce-labs-onesie"]
    Click Element    //*[@id="item_2_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=2
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC85: chi tiet Test.allTheThings T-Shirt Red
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_title_link"]/div
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser

TC86: chi tiet Test.allTheThings T-Shirt Red click img
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Page Should Contain Element    ${username_field}
    Page Should Contain Element    ${password_field}
    Page Should Contain Element    ${login_button}
    Input Text    //*[@id="user-name"]    visual_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Element    ${login_button}
    Location Should Be    https://www.saucedemo.com/inventory.html
    Page Should Contain Element    //*[@id="item_3_img_link"]/img    src
    Page Should Contain Element    //*[@id="item_3_title_link"]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    Page Should Contain Element    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    Page Should Contain Element     //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Element Should Be Visible    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    ${image_1}    Get Element Attribute    //*[@id="item_3_img_link"]/img    src
    ${title_1}    Get Text    //*[@id="item_3_title_link"]/div
    ${description_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div
    ${price_1}    Get Text    //*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div
    ${button_1}    Get Text    //*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Click Element    //*[@id="item_3_img_link"]/img
    Sleep    2s
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://www.saucedemo.com/inventory-item.html?id=3
    ${image_2}    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    ${title_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    ${description_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]
    ${price_2}    Get Text    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]
    ${button_2}    Get Text    //*[@id="add-to-cart"]
    Should Be Equal    ${image_1}    ${image_2}
    Should Be Equal    ${title_1}    ${title_2}
    Should Be Equal    ${description_1}    ${description_2}
    Should Be Equal    ${price_1}    ${price_2}
    Should Be Equal    ${button_1}    ${button_2}
    Close Browser
