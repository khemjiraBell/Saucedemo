*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    Builtin
Library    String


*** Variables ***
${URL}    https://www.saucedemo.com/
${Username}    id=user-name
${Password}    id=password
${Login_BT}    id=login-button
${Fill_Username}    standard_user
${Fill_Password}    secret_sauce
${Fill_Invalidpw}    secret_sau

${Error_invalidpw}    //div[@class='error-message-container error']/h3
${Errormsg_invalidpw}    Epic sadface: Username and password do not match any user in this service
${Logo}    //div[@class='app_logo']
${AddtoCart_Bagpack}
${Cart}    //div[@class='shopping_cart_container']
${Cart_backpack}    //button[@id='add-to-cart-sauce-labs-backpack']
${Remove_Cart_bagpack}    //button[@id='remove-sauce-labs-backpack']
${Cart_bike}    //button[@id='add-to-cart-sauce-labs-bike-light']
${Remove_Cart_bike}    //button[@id='remove-sauce-labs-bike-light']
${Cart_after_adding}    //div[@class='shopping_cart_container']
${Cart_badge}    //*[@class='shopping_cart_badge']

${Text_YourCart}    //*[text()="Your Cart"]
${Checkout_BT}    //button[@id='checkout']
${Continue_shopping_BT}    //button[@id='continue-shopping']


${Checkout_BT}    //button[@id='checkout']
${Firstname}    id=first-name
${Lastname}    id=last-name
${Postal_code}    id=postal-code
${Fill_Firstname}    Judy
${Fill_Lastname}    Hops
${Fill_Postal_Code}    10120
${Continue_checkout}    //*[@id='continue']
${Error_required}    //div[@class='error-message-container error']

${Price_bagpack}    (//div[@class='inventory_item_price'])[1]
${Price_bike}    (//div[@class='inventory_item_price'])[2]
${Price_Summary}    //div[@class='summary_subtotal_label']

${Finish_BT}    //button[@id='finish']
${BackHome_BT}    //button[@id='back-to-products']
${Thankyou_Text}    //*[@class='complete-header']

${Burger_menu_BT}    //button[@id='react-burger-menu-btn']
${Logout}    //*[@id='logout_sidebar_link']

