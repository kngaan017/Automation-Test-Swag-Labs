*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://www.saucedemo.com/
${browser}        chrome
${input_name}    id=user-name
${input_pwd}    id=password
${btn_login}    id=login-button
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
${cart_number}    xpath=//span[@class="shopping_cart_badge"]
${link_item1}       id=item_4_title_link
${link_item2}    id=item_0_title_link
${link_item3}    id=item_1_title_link
${link_item4}    id=item_5_title_link
${link_item5}    id=item_2_title_link
${link_item6}    id=item_3_title_link

*** Test Cases ***
TC1_Verify add a product to the cart
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}

    Close Browser

TC2_Verify add 3 products to the cart
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item3}    ${remove_item3}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}

    Close Browser
TC3_Verify add 3 products to the cart from product detail page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
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

    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC4_Verify add all products to the cart
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC5_Verify add 4 products to the cart and remove a product from product detail page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Click Element    ${link_item1}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    4

    # Remove a product
    Click Element    ${link_item3}
    Click Button    ${remove_btn}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC6_Verify remove a product from the cart on the product view page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    2

    # Remove a product 
    Click Button    ${remove_item1}

    # Verify cart icon after remove
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    Close Browser

TC7_Verify remove 3 products from the cart on the product view page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}

    Check number on cart icon    5
    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item6}

    # Verify cart icon after remove
    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    Close Browser

TC8_Verify remove all products from the cart on the product view page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}

    Check number on cart icon    4

    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item3}
    Click Button    ${remove_item5}
    Click Button    ${remove_item6}

    # Verify cart icon after remove
    Page Should Not Contain Element    ${cart_number}    

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0  
    Close Browser

TC9_Verify remove 1 products from the cart on the cart page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}

    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Remove 1 product
    Click Button    ${remove_item2}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item2}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC10_Verify remove 3 products from the cart on the cart page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}
    
    Check number on cart icon    4
    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    4     

    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item3}
    Click Button    ${remove_item6}

    # Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item3}
    Page Should Not Contain Element    ${link_item6}

    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC11_Verify remove all products from the cart on the cart page
    [Tags]    standard_user

    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    
    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item4}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item2}
    Page Should Not Contain Element    ${link_item4}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0 

     # Verify number of cart icon
    Click Button    id=continue-shopping
    Page Should Not Contain Element    ${cart_number}
    Close Browser

TC12_Verify cart state when click reset app state
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Open cart and verify product again
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0
    Close Browser

TC13_Verify product state on the view product page when click reset app state
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the view product page
    Page Should Not Contain Element    ${remove_item1}
    Page Should Not Contain Element    ${remove_item2}
    Page Should Not Contain Element    ${remove_item4}
    Close Browser
TC14_Verify product state on the detail product page when click reset app state
    [Tags]    standard_user
    Open Browser    ${url}    ${browser}   
    Login    standard_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Check number on cart icon    2

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the detail product page
    Click Element    ${link_item1}
    Page Should Not Contain Element    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item2}
    Page Should Not Contain Element    ${remove_btn}
    Close Browser

TC15_Verify add a product to the cart
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}

    Close Browser

TC16_Verify add 3 products to the cart
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item3}    ${remove_item3}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}

    Close Browser
TC17_Verify add 3 products to the cart from product detail page
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

    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC18_Verify add all products to the cart
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC19_Verify add 4 products to the cart and remove a product from product detail page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Click Element    ${link_item1}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    4

    # Remove a product
    Click Element    ${link_item3}
    Click Button    ${remove_btn}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC20_Verify remove a product from the cart on the product view page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    2

    # Remove a product 
    Click Button    ${remove_item1}

    # Verify cart icon after remove
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    Close Browser

TC21_Verify remove 3 products from the cart on the product view page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}

    Check number on cart icon    5
    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item6}

    # Verify cart icon after remove
    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    Close Browser

TC22_Verify remove all products from the cart on the product view page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}

   Check number on cart icon    4

    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item3}
    Click Button    ${remove_item5}
    Click Button    ${remove_item6}

    # Verify cart icon after remove
    Page Should Not Contain Element    ${cart_number}    

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0  
    Close Browser

TC23_Verify remove 1 products from the cart on the cart page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}

    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Remove 1 product
    Click Button    ${remove_item2}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item2}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC24_Verify remove 3 products from the cart on the cart page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}
    
    Check number on cart icon    4
    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    4     

    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item3}
    Click Button    ${remove_item6}

    # Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item3}
    Page Should Not Contain Element    ${link_item6}

    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC25_Verify remove all products from the cart on the cart page
    [Tags]    performance_glitch_user

    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    
    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item4}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item2}
    Page Should Not Contain Element    ${link_item4}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0 

     # Verify number of cart icon
    Click Button    id=continue-shopping
    Page Should Not Contain Element    ${cart_number}
    Close Browser

TC26_Verify cart state when click reset app state
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Open cart and verify product again
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0
    Close Browser

TC27_Verify product state on the view product page when click reset app state
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}   
    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the view product page
    Page Should Not Contain Element    ${remove_item1}
    Page Should Not Contain Element    ${remove_item2}
    Page Should Not Contain Element    ${remove_item4}
    Close Browser
TC28_Verify product state on the detail product page when click reset app state
    [Tags]    performance_glitch_user
    Open Browser    ${url}    ${browser}   
    Wait Until Page Contains Element    ${input_name}    5s   

    Login    performance_glitch_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Check number on cart icon    2

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the detail product page
    Click Element    ${link_item1}
    Page Should Not Contain Element    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item2}
    Page Should Not Contain Element    ${remove_btn}
    Close Browser

TC29_Verify add a product to the cart
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}

    Close Browser

TC30_Verify add 3 products to the cart: 3, 4, 6
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
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC31_Verify add 3 products to the cart from product detail page: 3, 4, 6
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

    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC32_Verify add 3 products to the cart: 1, 2, 5
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    Close Browser

TC33_Verify add 3 products to the cart from product detail page: 1, 2, 5
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

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Close Browser 

TC34_Verify add all products to the cart
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC35_Verify add 3 products to the cart and remove a product from product detail page
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

    # Remove a product
    Click Element    ${link_item2}
    Click Button    ${remove_btn}
    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Close Browser 

TC36_Verify remove a product from the cart on the product view page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Check number on cart icon    2

    # Remove a product 
    Click Button    ${remove_item1}

    # Verify cart icon after remove
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}

    Close Browser

TC37_Verify remove 2 products from the cart on the product view page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}

    Check number on cart icon    3
    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}

    # Verify cart icon after remove
    Check number on cart icon    1


    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    5
    
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    Close Browser

TC38_Verify remove all products from the cart on the product view page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}

    Check number on cart icon    3

    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item5}

    # Verify cart icon after remove
    Page Should Not Contain Element    ${cart_number}    

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0  
    Close Browser

TC39_Verify remove 1 products from the cart on the cart page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}

    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Remove 1 product
    Click Button    ${remove_item2}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item2}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC40_Verify remove 2 products from the cart on the cart page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    
    Check number on cart icon    3
    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3     

    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}

    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}

    # Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}

    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC41_Verify remove all products from the cart on the cart page
    [Tags]    error_user

    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}
    
    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item5}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item2}
    Page Should Not Contain Element    ${link_item5}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0 

     # Verify number of cart icon
    Click Button    id=continue-shopping
    Page Should Not Contain Element    ${cart_number}
    Close Browser

TC42_Verify cart state when click reset app state
    [Tags]    error_user
    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Open cart and verify product again
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0
    Close Browser

TC43_Verify product state on the view product page when click reset app state
    [Tags]    error_user
    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the view product page
    Page Should Not Contain Element    ${remove_item1}
    Page Should Not Contain Element    ${remove_item2}
    Page Should Not Contain Element    ${remove_item5}
    Close Browser
TC44_Verify product state on the detail product page when click reset app state
    [Tags]    error_user
    Open Browser    ${url}    ${browser}   
    Login    error_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Check number on cart icon    2

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the detail product page
    Click Element    ${link_item1}
    Page Should Not Contain Element    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item2}
    Page Should Not Contain Element    ${remove_btn}
    Close Browser

TC45_Verify add a product to the cart
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}

    Close Browser

TC46_Verify add 3 products to the cart
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Add product to cart    ${add_item2}    ${remove_item2}
    Add product to cart    ${add_item3}    ${remove_item3}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}

    Close Browser
TC47_Verify add 3 products to the cart from product detail page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
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

    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC48_Verify add all products to the cart
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC49_Verify add 4 products to the cart and remove a product from product detail page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Click Element    ${link_item1}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item3}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item4}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item6}
    Add product to cart    ${add_btn}    ${remove_btn}
    Click Button    id=back-to-products
    Check number on cart icon    4

    # Remove a product
    Click Element    ${link_item3}
    Click Button    ${remove_btn}
    Check number on cart icon    3

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC50_Verify remove a product from the cart on the product view page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    2

    # Remove a product 
    Click Button    ${remove_item1}

    # Verify cart icon after remove
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    Close Browser

TC51_Verify remove 3 products from the cart on the product view page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}

    Check number on cart icon    5
    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item6}

    # Verify cart icon after remove
    Check number on cart icon    2


    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    Close Browser

TC52_Verify remove all products from the cart on the product view page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}

    Check number on cart icon    4

    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item3}
    Click Button    ${remove_item5}
    Click Button    ${remove_item6}

    # Verify cart icon after remove
    Page Should Not Contain Element    ${cart_number}    

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0  
    Close Browser

TC53_Verify remove 1 products from the cart on the cart page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}

    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Remove 1 product
    Click Button    ${remove_item2}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item2}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC54_Verify remove 3 products from the cart on the cart page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item3}     ${remove_item3}
    Add product to cart    ${add_item5}     ${remove_item5}
    Add product to cart    ${add_item6}     ${remove_item6}
    
    Check number on cart icon    4
    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    4     

    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item3}
    Click Button    ${remove_item6}

    # Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item3}
    Page Should Not Contain Element    ${link_item6}

    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC55_Verify remove all products from the cart on the cart page
    [Tags]    visual_user

    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    
    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item4}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item2}
    Page Should Not Contain Element    ${link_item4}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0 

     # Verify number of cart icon
    Click Button    id=continue-shopping
    Page Should Not Contain Element    ${cart_number}
    Close Browser

TC56_Verify cart state when click reset app state
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Open cart and verify product again
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0
    Close Browser

TC57_Verify product state on the view product page when click reset app state
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item4}     ${remove_item4}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the view product page
    Page Should Not Contain Element    ${remove_item1}
    Page Should Not Contain Element    ${remove_item2}
    Page Should Not Contain Element    ${remove_item4}
    Close Browser
TC58_Verify product state on the detail product page when click reset app state
    [Tags]    visual_user
    Open Browser    ${url}    ${browser}   
    Login    visual_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Check number on cart icon    2

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the detail product page
    Click Element    ${link_item1}
    Page Should Not Contain Element    ${remove_btn}
    Click Button    id=back-to-products
    Click Element    ${link_item2}
    Page Should Not Contain Element    ${remove_btn}
    Close Browser
TC59_Verify add a product to the cart
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}    ${remove_item1}
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}

    Close Browser

TC60_Verify add 3 products to the cart: 3, 4, 6
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
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
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC61_Verify add 3 products to the cart from product detail page: 3, 4, 6
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
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

    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}
    Close Browser 

TC62_Verify add 3 products to the cart: 1, 2, 5
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    Close Browser

TC63_Verify add 3 products to the cart from product detail page: 1, 2, 5
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
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

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Close Browser 

TC64_Verify add all products to the cart
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
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
    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}
    Check product in cart    ${link_item3}    Sauce Labs Bolt T-Shirt    ${remove_item3}
    Check product in cart    ${link_item4}    Sauce Labs Fleece Jacket    ${remove_item4}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Check product in cart    ${link_item6}    Test.allTheThings() T-Shirt (Red)    ${remove_item6}

    Close Browser

TC65_Verify add 3 products to the cart and remove a product from product detail page
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
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

    # Remove a product
    Click Element    ${link_item2}
    Click Button    ${remove_btn}
    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2

    Check product in cart    ${link_item1}    Sauce Labs Backpack    ${remove_item1}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}
    Close Browser 

TC66_Verify remove a product from the cart on the product view page
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Check number on cart icon    2

    # Remove a product 
    Click Button    ${remove_item1}

    # Verify cart icon after remove
    Check number on cart icon    1

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1  
    Check product in cart    ${link_item2}    Sauce Labs Bike Light    ${remove_item2}

    Close Browser

TC67_Verify remove all products from the cart on the product view page
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Wait Until Page Contains Element    ${input_name}    5s   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}

    Check number on cart icon    3

    # Remove a product 
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item5}

    # Verify cart icon after remove
    Page Should Not Contain Element    ${cart_number}    

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0  
    Close Browser

TC68_Verify remove 1 products from the cart on the cart page
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}
    Wait Until Page Contains Element    ${input_name}    5s   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}

    Check number on cart icon    2

    # Open cart and verify product     
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    2  
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}

    # Remove 1 product
    Click Button    ${remove_item2}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item2}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    1 

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Check number on cart icon    1
    Close Browser

TC69_Verify remove all products from the cart on the cart page
    [Tags]    problem_user

    Open Browser    ${url}    ${browser}   
    Wait Until Page Contains Element    ${input_name}    5s   

    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie      ${remove_item5}
    
    # Update cart using remove 3 product
    Click Button    ${remove_item1}
    Click Button    ${remove_item2}
    Click Button    ${remove_item5}

    #Verify product after remove
    Page Should Not Contain Element    ${link_item1}
    Page Should Not Contain Element    ${link_item2}
    Page Should Not Contain Element    ${link_item5}
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0 

     # Verify number of cart icon
    Click Button    id=continue-shopping
    Page Should Not Contain Element    ${cart_number}
    Close Browser
TC70_Verify cart state when click reset app state
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Open cart and verify product again
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    0
    Close Browser

TC71_Verify product state on the view product page when click reset app state
    [Tags]    problem_user
    Open Browser    ${url}    ${browser}   
    Login    problem_user    secret_sauce 
    Page Should Contain Element    id=inventory_container

    # Verify product added to cart
    Add product to cart    ${add_item1}     ${remove_item1}
    Add product to cart    ${add_item2}     ${remove_item2}
    Add product to cart    ${add_item5}     ${remove_item5}
    Check number on cart icon    3

    # Open cart and verify product
    Click Element    id=shopping_cart_container
    ${cart_items}    Get WebElements    xpath=//div[@class="cart_item"]    
    Length Should Be    ${cart_items}    3      
    Check product in cart    ${link_item1}    Sauce Labs Backpack     ${remove_item1}
    Check product in cart    ${link_item2}    Sauce Labs Bike Light     ${remove_item2}
    Check product in cart    ${link_item5}    Sauce Labs Onesie    ${remove_item5}

    # Verify number of cart icon
    Click Button    id=continue-shopping
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    xpath=//a[contains(text(), "Reset App State")]    5s
    Click Element    xpath=//a[contains(text(), "Reset App State")]
    Page Should Not Contain Element    ${cart_number}

    # Veriy product on the view product page
    Page Should Not Contain Element    ${remove_item1}
    Page Should Not Contain Element    ${remove_item2}
    Page Should Not Contain Element    ${remove_item5}
    Close Browser

*** Keywords ***
Login    
    [Arguments]    ${name}    ${pwd}
    Input Text    ${input_name}    ${name}
    Input Password    ${input_pwd}    ${pwd}
    Click Button    ${btn_login}
    ${text}=    Get Text    class=title
    Should Be Equal As Strings    ${text}    Products

Add product to cart
    [Arguments]    ${add}    ${remove}
    Click Button    ${add}
    Element Should Be Visible    ${remove}

Check product in cart
    [Arguments]    ${link_item}    ${name}    ${remove}
    ${item}    Get Text    ${link_item}    
    Should Be Equal As Strings    ${item}    ${name}
    Element Should Be Visible    ${remove}

Check number on cart icon
    [Arguments]    ${number}
    Page Should Contain Element    ${cart_number}
    ${cart_badge}    Get Text    ${cart_number}    
    Should Be Equal As Strings    ${cart_badge}    ${number}



