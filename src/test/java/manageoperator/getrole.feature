Feature: Testing Get role operator of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
      Scenario: without login view roles
       #OP_VW_RL_02:Verify if Acquirer operator with Acquirer admin role can view all operators without logging in
       Given path '/operator/role'
       When method get
       And print response
       Then status 401
       And print responseStatus
       And match header content-type contains 'text/plain'
    
       Scenario: Login with vaild email and password
       #OP_LG_01:Verify if operator can login with valid email and password
       Given path '/operator/authentication'
       And form field email = 'pravash.mahato@moco.com.np'
       And form field password = 'Hello@123'
       When method post
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_VW_RL_01:Verify if Acquirer operator with Acquirer admin role can view all roles
       Given path '/operator/role'
       When method get
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'application/json'
       
       #OP_VW_RL_03:Verify if Acquirer operator with Acquirer admin role can view all roles with wrong endpoint
       Given path '/operator/roles'
       When method get
       And print response
       Then status 404
       And print responseStatus
       And match header content-type contains 'text/html'
       