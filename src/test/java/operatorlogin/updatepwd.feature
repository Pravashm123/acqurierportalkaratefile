	Feature: Testing update operator password of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
       Scenario: Login with vaild email and password
       #OP_LG_01:Verify if operator can login with valid email and password
       Given path '/operator/authentication'
       And form field email = 'pravash.mahato@moco.com.np'
       And form field password = 'Hello@1234'
       When method post
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_PW_01:Verify if Acquirer operator with admin role can change their password by entering new valid password
       #Given path '/operator/password'
       #And form field oldPassword  = 'Hello@123'
       #And form field newPassword  = 'Hello@1234'
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_PW_02:Verify if Acquirer operator with admin role can change their password when entering the same old password
       #Given path '/operator/password'
       #And form field oldPassword  = 'Hello@1234'
       #And form field newPassword  = 'Hello@1234'
       #When method put
       #And print response
       #Then status 409
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_PW_03:Verify if Acquirer operator with admin role can change their password when the newPassword value is empty
       #Given path '/operator/password'
       #And form field oldPassword  = 'Hello@1234'
       #And form field newPassword  = ' '
       #When method put
       #And print response
       #Then status 422
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
        #OP_UP_PW_04:Verify if Acquirer operator with admin role can change their password when the oldPassword value is empty
       #Given path '/operator/password'
       #And form field oldPassword  = ''
       #And form field newPassword  = 'Hello@1234'
       #When method put
       #And print response
       #Then status 422
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
        #OP_UP_PW_05:Verify if Acquirer operator with admin role can change their password when the oldPassword parameter is missing
       #Given path '/operator/password'
       #And form field newPassword  = 'Hello@1234'
       #When method put
       #And print response
       #Then status 400
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_PW_06:Verify if Acquirer operator with admin role can change their password when the newPassword parameter is missing
       Given path '/operator/password'
       And form field oldPassword  = 'Hello@123'
       When method put
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'