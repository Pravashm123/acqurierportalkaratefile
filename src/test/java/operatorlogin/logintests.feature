	Feature: Testing login operator of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
       Scenario: Login with vaild email and password
       OP_LG_01:Verify if operator can login with valid email and password
       Given path '/operator/authentication'
       And form field email = 'pravash.mahato@moco.com.np'
       And form field password = 'Hello@1234'
       When method post
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_LG_02:Verify if operator can login with valid email and wrong password
       Given path '/operator/authentication'
       And form field email = 'pravashm96@gmail.com'
       And form field password = 'Hello@12'
       When method post
       And print response
       Then status 401
       And print responseStatus
       And match header content-type contains 'text/plain'
    
       #OP_LG_03:Verify if operator can login with invalid email and correct password
       Given path '/operator/authentication'
       And form field email = 'pravashm96.com'
       And form field password = 'Hello@123'
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
     
       #OP_LG_04:Verify if operator can login with unregistered email and password
       Given path '/operator/authentication'
       And form field email = 'pravashmahato10@gmail.com'
       And form field password = 'Hello@123'
       When method post
       And print response
       Then status 401
       And print responseStatus
       And match header content-type contains 'text/plain'
       
        #OP_LG_05:Verify if operator can login with empty email value and empty password value
       Given path '/operator/authentication'
       And form field email = ''
       And form field password = ''
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       #
       #OP_LG_06:Verify if operator can login with empty email value
       Given path '/operator/authentication'
       And form field email = ''
       And form field password = 'Hello@123'
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_LG_07:Verify if operator can login with empty password value 
       Given path '/operator/authentication'
       And form field email = 'pravash.mahato@moco.com.np'
       And form field password = ''
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
     
       #OP_LG_08:Verify if operator can login with wrong endpoint
       Given path '/operator/authentications'
       And form field email = 'pravash.mahato@moco.com.np'
       And form field password = 'Hello@123'
       When method post
       And print response
       Then status 404
       And print responseStatus
       And match header content-type contains 'text/html'
       

      #OP_LG_09:Verify if operator is disabled after 3 unsuccessful attempt login
      #Given path '/operator/authentication'
      #And form field email = 'pravash.mahato@moco.com.np'
      #And form field password = 'Hello@12345'
      #When method post
      #And print response
      #Then status 200
      #And print responseStatus
      #And match header content-type contains 'text/plain'
      
      #OP_LG_10:Verify if disabled operator is able to login into the system after being disabled
       #Given path '/operator/authentications'
       #And form field email = 'pravash.mahato@moco.com.np'
       #And form field password = 'Hello@1234'
       #When method post
       #And print response
       #Then status 403
       #And print responseStatus
       #And match header content-type contains 'text/plain'
      
      #OP_PW_FGT_01:Verify if operator can get a link in their email and reset password if operator forgets their password 
      #Given path '/operator/password/forgot/pravash.mahato@moco.com.np'
      #When method get
      #And print response
      #Then status 200
      #And print responseStatus
      #And match header content-type contains 'text/plain'
       
      #OP_PW_FGT_02:Verify if operator can reset their password with empty email value in path
      Given path '/operator/password/forgot'
      When method get
     And print response
     Then status 404
     And print responseStatus
     And match header content-type contains 'text/html'
     
      #OP_PW_FGT_03:Verify if operator can reset their password with invalid email
      Given path '/operator/password/forgot/test.com'
      When method get
     And print response
     Then status 422
     And print responseStatus
     And match header content-type contains 'text/plain'
     
      #OP_PW_FGT_:04:Verify if operator can reset their password with unregistered email in system
      Given path '/operator/password/forgot/pravashmahato37@gmail.com'
      When method get
      And print response
     Then status 404
     And print responseStatus
     And match header content-type contains 'text/plain'
       
    #OP_LO_01:Verify if opertor can logout from the system sucessfully
    Given path '/operator/authentications'
    When method DELETE
    And print response
    Then status 200
    And print responseStatus
    And match header content-type contains 'text/plain'
    
    #OP_LO_02:Verify if operator after logging out can access other APIs
    Given path '/operator'
    When method get
    And print response
    Then status 401  
    And print responseStatus
    And match header content-type contains 'text/plain'
    
    #OP_LO_03:Verify if operator can logout with wrong endpoint
    #Given path '/operator/authentications'
    #When method DELETE
    #And print response
    #Then status 404
    #And print responseStatus
    #And match header content-type contains 'text/html'
    
    
   
       