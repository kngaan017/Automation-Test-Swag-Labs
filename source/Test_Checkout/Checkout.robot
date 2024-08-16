*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           BuiltIn

*** Variables ***
${url}            https://www.saucedemo.com/
${browser}        chrome
${input_name}     id=user-name
${input_pwd}      id=password
${btn_login}      id=login-button
${goods-id}       id=add-to-cart-sauce-labs-backpack
${add_item2}      id=add-to-cart-sauce-labs-bike-light
${first-name}     Tony
${last-name}      Nguyen
${postal-code}    2246
${CART_ITEM_XPATH}    xpath://div[@id="cart_contents_container"]//div[@class="cart_item"]
${PAYMENT_ITEM_XPATH}    xpath://div[@id="checkout_summary_container"]//div[@class="cart_item"]

*** Test Cases ***
TC1 No fill all fields standard_user
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Click Button    id=continue
    #verify all fields are blank
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC2 Verify functionality of checkout process missing first name
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=last-name    ${last-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC3 Verify functionality of checkout process missing last name
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    Get Error
    Should Be Equal As Strings    Error: Last Name is required    ${error_msg}
    Close Browser

TC4 Verify functionality of checkout process missing postal code
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=last-name    ${last-name}
    Click Button    id=continue
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: Postal Code is required    ${error_msg}
    Close Browser

TC5 Verify functionality of checkout process has no products in the cart
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    Click Element    xpath://a[@class="shopping_cart_link"]
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    Go To Payment Page
    #Check the total product price with total
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

TC6 Checkout Success
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Verify Products Match
    #Check the total product price with total
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_price}    ${actual_total_product_value}
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

TC7 Error_user: No fill all fields
    [Tags]    Error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC8 Error user: Verify functionality of checkout process missing first name
    [Tags]    Error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=last-name    ${last-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC9 Error user: Verify functionality of checkout process without last name
    [Tags]    Error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    Page Should Contain Element    xpath://span[@class='title']    Checkout: Overview
    Run Keyword And Continue On Failure    Page Should Not Contain Element    css:.error    # Kiểm tra không có thông báo lỗi nào xuất hiệ
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

TC10 Error user: Verify functionality of checkout process missing last name, postal code
    [Tags]    Error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Click Button    id=continue
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: Postal Code is required    ${error_msg}
    Close Browser

TC11 Verify functionality of checkout process has no products in the cart
    [Tags]    Error_user
    Open Browser    ${url}    ${browser}
    Login    error_user    secret_sauce
    Click Element    xpath://a[@class="shopping_cart_link"]
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    Go To Payment Page
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

TC12 Visual user: No fill all fields
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC13 Visual user: Verify functionality of checkout process missing first name
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=last-name    ${last-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC14 Verify functionality of checkout process missing last name
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    Get Error
    Should Be Equal As Strings    Error: Last Name is required    ${error_msg}
    Close Browser

TC15 Verify functionality of checkout process missing postal code
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=last-name    ${last-name}
    Click Button    id=continue
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: Postal Code is required    ${error_msg}
    Close Browser

TC16 Verify functionality of checkout process has no products in the cart
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    Click Element    xpath://a[@class="shopping_cart_link"]
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    Go To Payment Page
    #Check the total product price with total
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!

TC17 Checkout Success
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Login    visual_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Verify Products Match
    #Check the total product price with total
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

TC18 No fill all fields
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC19 Verify Last Name Error
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Input Text    id=first-name    ${first-name}
    Input Text    id=last-name    ${last-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${first_name_text}    Get Text    id=first-name
    Should Be Equal As Strings    ${first_name_text}    ${first-name}
    Close Browser

TC20 Verify functionality of checkout process missing last name
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    Get Error
    Should Be Equal As Strings    Error: Last Name is required    ${error_msg}
    Close Browser

TC21 Verify functionality of checkout process missing last name and postal code
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Login    problem_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Click Button    id=continue
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}
    Get Error
    Should Be Equal As Strings    Error: Last Name is required    ${error_msg}

TC22 No fill all fields
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Click Button    id=continue
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC23 Verify functionality of checkout process missing first name
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=last-name    ${last-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${first_name_value}=    Get Text    xpath://input[@id='first-name']
    Should Be Empty    ${first_name_value}
    Get Error
    Should Be Equal As Strings    Error: First Name is required    ${error_msg}
    Close Browser

TC24 Verify functionality of checkout process missing last name
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    ${last_name_value}=    Get Text    xpath://input[@id='last-name']
    Should Be Empty    ${last_name_value}
    Get Error
    Should Be Equal As Strings    Error: Last Name is required    ${error_msg}
    Close Browser

TC25 Verify functionality of checkout process missing postal code
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    Click Button    ${goods-id}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=last-name    ${last-name}
    Click Button    id=continue
    ${code_value}=    Get Text    xpath://input[@id='postal-code']
    Should Be Empty    ${code_value}

    ${error_msg}    Get Text    xpath://div[@class="error-message-container error"]
    Should Be Equal As Strings    Error: Postal Code is required    ${error_msg}
    Close Browser

TC26 Verify functionality of checkout process has no products in the cart
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    Click Element    xpath://a[@class="shopping_cart_link"]
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    Go To Payment Page
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

TC27 Checkout Success
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}
    Login    performance_glitch_user    secret_sauce
    Click Button    ${goods-id}
    Click Button    ${add_item2}
    Click Element    xpath://a[@class="shopping_cart_link"]
    Verify Products Match
    #Check the total product price with total
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price

    Sleep    2s

    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=finish
    Element Text Should Be    xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order!
    Close Browser

*** Keywords ***
Get Error
    ${error_msg}    Get Text    xpath://div[@class="error-message-container error"]
    Set Global Variable    ${error_msg}

Login
    [Arguments]    ${name}    ${pwd}
    Input Text    ${input_name}    ${name}
    Input Password    ${input_pwd}    ${pwd}
    Click Button    ${btn_login}
    ${text}=    Get Text    class=title

Get Products In Cart
    [Documentation]    Get the list of products in the cart
    ${products_in_cart}=    Get WebElements    ${CART_ITEM_XPATH}
    [Return]    ${products_in_cart}

Get Products On Payment Page
    [Documentation]    Get the list of products on the payment page
    ${products_on_payment_page}=    Get WebElements    ${PAYMENT_ITEM_XPATH}
    [Return]    ${products_on_payment_page}

Verify Products Match
    [Documentation]    Verify if the products in the cart match the products on the payment page
    ${products_in_cart}=    Get Products In Cart
    Go To Payment Page
    ${products_on_payment_page}=    Get Products On Payment Page
    ${products_in_cart_names}=    Create List
    ${products_on_payment_page_names}=    Create List
    FOR    ${product}    IN    @{products_in_cart}
        ${product_name}=    Run Keyword And Return Status    Get Text    xpath:${product}//div[@class="inventory_item_name"]
        Run Keyword If    ${product_name} != 'FAIL'    Append To List    ${products_in_cart_names}    ${product_name}
    END
    FOR    ${product}    IN    @{products_on_payment_page}
        ${product_name}=    Run Keyword And Return Status    Get Text    xpath:${product}//div[@class="inventory_item_name"]
        Run Keyword If    ${product_name} != 'FAIL'    Append To List    ${products_on_payment_page_names}    ${product_name}
    END
    Lists Should Be Equal    ${products_in_cart_names}    ${products_on_payment_page_names}

Go To Payment Page
    [Documentation]    Navigate from cart to payment page
    Click Button    id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name    ${first-name}
    Input Text    id=last-name    ${last-name}
    Input Text    id=postal-code    ${postal-code}
    Click Button    id=continue
    Element Text Should Be    xpath://span[@class='title']    Checkout: Overview

Get the total product value
    # ${inventory_item_prices} =    Get WebElements    xpath://span[@class="cart_item"]
    ${inventory_item_prices} =    Get WebElements    xpath://div[@class="item_pricebar"]
    ${total_price} =    Set Variable    0
    FOR    ${price}    IN    @{inventory_item_prices}
        ${price_text} =    Get Text    ${price}
        ${price_value} =    Convert To Number    ${price_text[1:]}
        ${total_price} =    Evaluate    ${total_price} + ${price_value}
    END
    [Return]    ${total_price}

Get Total Price
    ${total_value} =    Get Text    xpath://div[@class="summary_subtotal_label" and @data-test="subtotal-label"]
    ${total} =    Convert To Number    ${total_value[13:]}
    [Return]    ${total}
