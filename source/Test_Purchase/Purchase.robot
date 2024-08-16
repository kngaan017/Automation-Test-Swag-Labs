*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            RequestsLibrary
Library        Collections
Library           BuiltIn
*** Variables ***
${url}           https://www.saucedemo.com/
${browser}        chrome
${input_name}    id=user-name
${input_pwd}    id=password
${btn_login}         id=login-button
${cart_number}    xpath=//span[@class="shopping_cart_badge"]
${goods-id}              id=add-to-cart-sauce-labs-backpack
${add_btn}    id=add-to-cart
${add_item1}    id=add-to-cart-sauce-labs-backpack
${add_item2}    id=add-to-cart-sauce-labs-bike-light
${add_item3}    id=add-to-cart-sauce-labs-bolt-t-shirt
${add_item4}    id=add-to-cart-sauce-labs-fleece-jacket
${add_item5}    id=add-to-cart-sauce-labs-onesie
${add_item6}    id=add-to-cart-test.allthethings()-t-shirt-(red)
${remove_btn}    id=remove
${remove_item1}    id=remove-sauce-labs-backpack
${remove_item2}    id=remove-sauce-labs-bike-light
${remove_item3}    id=remove-sauce-labs-bolt-t-shirt
${remove_item4}    id=remove-sauce-labs-fleece-jacket
${remove_item5}    id=remove-sauce-labs-onesie
${remove_item6}    id=remove-test.allthethings()-t-shirt-(red)
${link_item1}       id=item_4_title_link
${link_item2}    id=item_0_title_link
${link_item3}    id=item_1_title_link
${link_item4}    id=item_5_title_link
${link_item5}    id=item_2_title_link
${link_item6}    id=item_3_title_link
${first-name}        Tony
${last-name}         Nguyen
${last-name-random}    N
${postal-code}        2246
${CART_ITEM_XPATH}      xpath://div[@id="cart_contents_container"]//div[@class="cart_item"]
${PAYMENT_ITEM_XPATH}    xpath://div[@id="checkout_summary_container"]//div[@class="cart_item"]
*** Test Cases ***
TC1 Verify buy a product
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce

     # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    xpath://a[@class="shopping_cart_link"]
    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 
    Close Browser
TC2 Verify buy all products 
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item3}    ${remove_item3}
    Add product to cart    ${add_item4}    ${remove_item4}
    Add product to cart    ${add_item5}    ${remove_item5}
    Add product to cart    ${add_item6}    ${remove_item6}
    Check number on cart icon    6

    Click Element    xpath://a[@class="shopping_cart_link"]
    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    Click Element    id=back-to-products
    Check Cart Empty 
TC3 Verify buy 3 product from product detail page
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}
    Login    standard_user    secret_sauce

      # Verify product added to cart
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    3

    Click Element    xpath://a[@class="shopping_cart_link"]
    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    Click Element    id=back-to-products
    Check Cart Empty 
TC4 Verify buy more products from the cart page
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=continue-shopping
     Add product to cart    ${add_item2}    ${remove_item1}

    #open cart and verify products
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2 

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC5 Verify buy more products from the Checkout: Your Information page
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=checkout
    Page Should Contain Element    id=checkout_info_container
    Click Element    id=cancel
    Click Element    id=continue-shopping 

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC6 Verify buy more products from the Checkout: Overview page
    [Tags]    Standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Go To Payment Page
    Click Element    id=cancel

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC7 Verify buy a product 
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    #open cart and verify products
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC8 Verify buy 3 products from product detail page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC9 Verify buy all products 
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item3}    ${remove_item3}
    Add product to cart    ${add_item4}    ${remove_item4}
    Add product to cart    ${add_item5}    ${remove_item5}
    Add product to cart    ${add_item6}    ${remove_item6}
    Check number on cart icon    6

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    6  
   
    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC10 Verify buy more products from the cart page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=continue-shopping
    Add product to cart    ${add_item2}    ${remove_item1}

    #open cart and verify products
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2 

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser


TC11 Verify buy more products from the Checkout: Your Information page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=checkout
    Page Should Contain Element    id=checkout_info_container
    Click Element    id=cancel
    Click Element    id=continue-shopping 

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC12 Verify buy more products from the Checkout: Overview page
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Go To Payment Page
    Click Element    id=cancel

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC13 Verify buy a product to the cart
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  

    Click Button     id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name        ${first-name}
    Input Text    id=postal-code        ${postal-code}
    
    Click Button    id=continue
    Page Should Contain Element   xpath://span[@class='title']    Checkout: Overview

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    
    Click Element    id=back-to-products
    Check Cart Empty 
    Close Browser

TC14 Verify buy 3 products: 3, 4, 6
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item3}    ${remove_item3}
    Add product to cart    ${add_item4}    ${remove_item4}
    Add product to cart    ${add_item6}    ${remove_item6}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  
   
    Click Button     id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name        ${first-name}
    Input Text    id=postal-code        ${postal-code}
    
    Click Button    id=continue
    Page Should Contain Element   xpath://span[@class='title']    Checkout: Overview

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    
    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC15 Verify buy 3 products from product detail page: 3, 4, 6
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  
    
     Click Button     id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name        ${first-name}
    Input Text    id=postal-code        ${postal-code}
    
    Click Button    id=continue
    Page Should Contain Element   xpath://span[@class='title']    Checkout: Overview

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    
    Click Element    id=back-to-products
    Check Cart Empty 
   
    Close Browser 

TC16 Verify add 3 products to the cart: 1, 2, 5
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item5}    ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  

    Click Button     id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name        ${first-name}
    Input Text    id=postal-code        ${postal-code}
    
    Click Button    id=continue
    Page Should Contain Element   xpath://span[@class='title']    Checkout: Overview

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    
    Click Element    id=back-to-products
    Check Cart Empty 
    Close Browser

TC17 Verify add 3 products to the cart from product detail page: 1, 2, 5
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Click Element    ${link_item1}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item2}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item5}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  

    Click Button     id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name        ${first-name}
    Input Text    id=postal-code        ${postal-code}
    
    Click Button    id=continue
    Page Should Contain Element   xpath://span[@class='title']    Checkout: Overview

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    Element Should Not Be Visible    xpath://span[@class="shopping_cart_badge"]
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    
    Click Element    id=back-to-products
    Check Cart Empty 
    Close Browser 
TC18 Verify buy more products from the cart page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=continue-shopping
    Add product to cart    ${add_item2}    ${remove_item1}

    #open cart and verify products
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2 

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC19 Verify buy more products from the Checkout: Your Information page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=checkout
    Page Should Contain Element    id=checkout_info_container
    Click Element    id=cancel
    Click Element    id=continue-shopping 

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC20 Verify buy more products from the Checkout: Overview page
    [Tags]    error_user
    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Go To Payment Page
    Click Element    id=cancel

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC21 Verify buy a product
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login             visual_user    secret_sauce

     # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  

    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC22 Verify buy all products 
    [Tags]       visual_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login             visual_user    secret_sauce

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item3}    ${remove_item3}
    Add product to cart    ${add_item4}    ${remove_item4}
    Add product to cart    ${add_item5}    ${remove_item5}
    Add product to cart    ${add_item6}    ${remove_item6}
    Check number on cart icon    6

     # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    6 

    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 
TC23 Verify buy 3 product from product detail page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login        visual_user    secret_sauce
    
    # Verify product added to cart
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    3

     # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3

    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC24 Verify buy more products from the cart page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}  
    Maximize Browser Window 
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=continue-shopping
    Add product to cart    ${add_item2}    ${remove_item1}

    #open cart and verify products
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2 

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC25 Verify buy more products from the Checkout: Your Information page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=checkout
    Page Should Contain Element    id=checkout_info_container
    Click Element    id=cancel
    Click Element    id=continue-shopping 

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC26 Verify buy more products from the Checkout: Overview page
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Go To Payment Page
    Click Element    id=cancel

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser

TC27 Verify buy a product
    [Tags]     problem_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login             problem_user    secret_sauce

     # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  

    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 
    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC28 Verify buy 3 products: 1,2,5
    [Tags]       problem_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login             problem_user    secret_sauce

     # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item5}    ${remove_item5}
    Check number on cart icon    3

     # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3 

    Verify Products Match     

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

TC29 Verify buy 3 product from product detail page: 1, 2 ,5 
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login         problem_user    secret_sauce
    
    # Verify product added to cart
    Click Element    ${link_item1}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item2}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item5}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    3

     # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3

    Verify Products Match     
    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC30 Verify buy 3 products: 3,4,6
    [Tags]       problem_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login             problem_user    secret_sauce

     # Verify product added to cart
    Add product to cart    ${add_item3}    ${remove_item1}
    Add product to cart    ${add_item4}    ${remove_item2}
    Add product to cart    ${add_item6}    ${remove_item5}
    Check number on cart icon    3

     # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3 

    Verify Products Match     

    Click Button    id=finish 
    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

TC31 Verify buy more products from the cart page
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}  
    Maximize Browser Window 
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=continue-shopping
    Add product to cart    ${add_item2}    ${remove_item1}

    #open cart and verify products
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2 

    Verify Products Match     
    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC32 Verify buy more products from the Checkout: Your Information page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Click Element    id=checkout
    Page Should Contain Element    id=checkout_info_container
    Click Element    id=cancel
    Click Element    id=continue-shopping 

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
TC33 Verify buy more products from the Checkout: Overview page
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    Click Element    id=shopping_cart_container
    Go To Payment Page
    Click Element    id=cancel

    #add more products and check cart 
    Add product to cart    ${add_item2}    ${remove_item2}
    Check number on cart icon    2
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Go To Payment Page

    Click Button    id=finish 

    Element Text Should Be     xpath://span[@class='title']    Checkout: Complete!
    ${success_msg}    Get Text    xpath://h2[@class='complete-header']
    Should Be Equal As Strings    ${success_msg}    Thank you for your order! 

    Click Element    id=back-to-products
    Check Cart Empty 

    Close Browser
*** Keywords ***

Add product to cart
    [Arguments]    ${add}    ${remove}
    Click Button    ${add}
    Element Should Be Visible    ${remove}
Get Error 
    ${border_color}=      Execute JavaScript    return window.getComputedStyle(document.querySelector('input.input_error.error')).borderBottomColor
    Should Be Equal As Strings    ${border_color}    rgb(226, 35, 26)  # RGB value of the expected color
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
    ${products_in_cart}=    Get WebElements     ${CART_ITEM_XPATH}  
    [Return]    ${products_in_cart}

Get Products On Payment Page
    [Documentation]    Get the list of products on the payment page
    ${products_on_payment_page}=    Get WebElements    ${PAYMENT_ITEM_XPATH}
    [Return]    ${products_on_payment_page}

Check Cart Empty 
    Click Element    xpath://a[@class="shopping_cart_link"]
    Page Should Not Contain Element    xpath://div[@id="cart_contents_container"]//div[@class="cart_item"]
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
    Click Button     id=checkout
    Element Text Should Be    xpath://span[@class='title']    Checkout: Your Information
    Input Text    id=first-name        ${first-name}
    Input Text    id=last-name        ${last-name}
    Input Text    id=postal-code     ${postal-code}
    Click Button    id=continue
    Element Text Should Be    xpath://span[@class='title']    Checkout: Overview

Check number on cart icon
    [Arguments]    ${number}
    Page Should Contain Element    ${cart_number}
    ${cart_badge}    Get Text    ${cart_number}    
    Should Be Equal As Strings    ${cart_badge}    ${number}