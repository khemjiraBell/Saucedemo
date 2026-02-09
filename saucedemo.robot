*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    Builtin
Library    String
Resource    ${CURDIR}/saucedemoVariable.robot
Resource    ${CURDIR}/saucedemoKeywords.robot
Test Setup         Login Without Password Breach Popup
Test Teardown      Close All Browsers



*** Test Cases ***
TC01 Login with valid credentials 
    [Tags]    Authentication
    Open Web Browser
   
    
TC02 Login with invalid password
    [Tags]    Authentication
    Open Web Browser - Negative Case
    Wait Until Element Is Visible    ${Error_invalidpw}   
    Element Should Be Visible    ${Error_invalidpw}   ${Errormsg_invalidpw}
    


TC03 Add two products to cart
    [Tags]    Product
    Open Web Browser
    Add to Cart
   

TC04 Add same product twice
    [Tags]    Product
    Open Web Browser
    Add Product twice
    Your Cart Page - Add product twice
    

TC05 View Cart item
    [Tags]    Cart
    Open Web Browser
    Add to Cart
    Your Cart Page


TC06 View empty cart
    [Tags]    Cart
    Open Web Browser
    Click Element    ${Cart}
    Wait Until Element Is Visible    ${Text_YourCart}
    Page Should Contain Button  ${Checkout_BT}
    Sleep  2s


TC07 Checkout with valid information  
    [Tags]    Checkout
    Open Web Browser
    Add to Cart
    Your Cart Page
    Checkout with valid info


TC08 Checkout with missing information
    [Tags]    Checkout
    Open Web Browser
    Add to Cart
    Checkout with missing info


TC09 Verify pricing
    [Tags]    Checkout
    Open Web Browser
    Add to Cart
    Your Cart Page
    Checkout with valid info
    Verify Pricing



TC10 Complete order
    [Tags]    Checkout
     Open Web Browser
    Add to Cart
    Your Cart Page
    Checkout with valid info
    Verify Pricing
    Finish Order


TC11 Logout successfully -E2E flow - Happy Path
    [Tags]    Session
    Open Web Browser
    Add to Cart
    Your Cart Page
    Checkout with valid info
    Verify Pricing
    Finish Order
    Logout


    