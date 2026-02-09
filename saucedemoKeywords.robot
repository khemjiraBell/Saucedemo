*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    Builtin
Library    String
Resource   ${CURDIR}/saucedemoVariable.robot




*** Keywords ***
Login Without Password Breach Popup
    # นำเข้าโมดูล sys และ selenium.webdriver
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # สร้าง Dictionary สำหรับตั้งค่า Preferences ของ Chrome
    ${prefs}=    Create Dictionary
    # ปิดการตรวจสอบการละเมิดรหัสผ่าน (Password Leak Detection)
    Set To Dictionary    ${prefs}    profile.password_manager_leak_detection    ${False}
    # ปิดการเสนอให้บันทึกรหัสผ่าน
    Set To Dictionary    ${prefs}    credentials_enable_service    ${False}
    # ปิดตัวจัดการรหัสผ่านในโปรไฟล์
    Set To Dictionary    ${prefs}    profile.password_manager_enabled    ${False}
    
    # เพิ่ม Preferences เข้าไปใน Chrome Options
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    
    # (Optional) ปิดแถบแจ้งเตือน "Chrome is being controlled..."
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${{['enable-automation']}}

    # สร้าง WebDriver ด้วย Options ที่ตั้งค่าไว้
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
    # ดำเนินการ Login ตาม Test script ของคุณต่อได้เลย


Open Web Browser
    Input Text    ${Username}   ${Fill_Username}
    Input Text    ${Password}    ${Fill_Password}
    Click Element    ${Login_BT}
    Wait Until Element Is Visible    ${Logo}    2s
    Sleep    5s


Open Web Browser - Negative Case
    Input Text    ${Username}   ${Fill_Username}
    Input Text    ${Password}    ${Fill_Invalidpw}
    Click Element    ${Login_BT}
        
    
Add to Cart
    Click Element    ${Cart_backpack}
    Wait Until Element Is Visible    ${Remove_Cart_bagpack}
    Click Element    ${Cart_bike}
    Wait Until Element Is Visible    ${Remove_Cart_bike}
    Sleep  2s
    Click Element    ${Cart_after_adding}

Your Cart Page
    Wait Until Element Is Visible    ${Text_YourCart}
    Page Should Contain Button    ${Remove_Cart_bagpack}
    Page Should Contain Button    ${Remove_Cart_bagpack}
    Element Should Be Visible    ${Cart_badge}    2
    Sleep   1s  

Add Product twice
    Click Element    ${Cart_backpack}
    Wait Until Element Is Visible    ${Remove_Cart_bagpack}
    Element Should Be Visible    ${Cart_badge}    1
    Page Should Not Contain    ${Cart_backpack}
    Sleep  1s
   
    
Your Cart Page - Add product twice
    Click Element    ${Cart_after_adding}
    Wait Until Element Is Visible    ${Text_YourCart}
    Page Should Contain Button    ${Remove_Cart_bagpack}  
    Element Should Be Visible    ${Cart_badge}    1
    Sleep   1s  

Checkout with valid info
    Click Element    ${Checkout_BT}
    Wait Until Element Is Visible    ${Firstname}
    Input Text    ${Firstname}    ${Fill_Firstname}
    Input Text    ${Lastname}    ${Fill_Lastname}
    Input Text    ${Postal_code}    ${Fill_Postal_Code}
    Click Element    ${Continue_checkout}


Checkout with missing info
    Click Element    ${Checkout_BT}
    Wait Until Element Is Visible    ${Firstname}
    Click Element    ${Continue_checkout}
    Page Should Contain Element    ${Error_required} 
    Sleep  2s



Verify Pricing
    Wait Until Element Is Visible    ${Price_bagpack}
    Wait Until Element Is Visible    ${Price_bike}
   

    ${text1}=    Get Text    ${Price_bagpack}
    ${text2}=    Get Text    ${Price_bike}

    # แปลงเป็นตัวเลข (Convert to Integer/Number)
    ${num1}=     Convert To Number    ${text1.replace('$', '')}
    ${num2}=     Convert To Number        ${text2.replace('$', '')}

    # รวมตัวเลข (Evaluate)
    ${total}=    Evaluate    ${num1} + ${num2}

     # ดึงยอดรวมจริงจาก Element ในหน้าเว็บ
    ${total}=   Get Text   ${Price_Summary}

    # ดึงเฉพาะตัวเลขจากข้อความ "Item total: $39.98"
    ${actual_item_total} =    Fetch From Right    ${total}    $
    ${actual_item_total_number} =    Convert To Number    ${actual_item_total}   

    
Finish Order
    Wait Until Element Is Visible    ${Finish_BT}
    Click Element    ${Finish_BT}
    Wait Until Element Is Visible    ${BackHome_BT}
    Wait Until Element Is Visible    ${Thankyou_Text}
    Sleep  2s


Logout
    Click Element    ${Burger_menu_BT}
    Wait Until Element Is Visible    ${Logout}
    Click Element    ${Logout}
    Wait Until Element Is Visible    ${Login_BT}
    Sleep  2s
