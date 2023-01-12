Feature: Testing Get operator operator of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
      Scenario: without login view operators
       #OP_VW_06:Verify if Acquirer operator with Acquirer admin role can view all operators without logging in
       Given path '/operator'
       When method get
       And print response
       Then status 401
       And print responseStatus
       And match header content-type contains 'text/plain'
    
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
       
       #OP_VW_01:Verify if Acquirer operator with Acquirer admin role can view all operators
       Given path '/operator'
       When method get
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'application/json'
       
       #OP_VW_02:Verify if Acquirer operator with Acquirer admin role can view all operators with wrong endpoint
       Given path '/operators'
       When method get
       And print response
       Then status 404
       And print responseStatus
       And match header content-type contains 'text/html'
       
       #OP_VW_03:Verify if Acquirer operator with Acquirer admin role can view specific operator with valid email
       Given path '/operator/pravash123@gmail.com'
       When method get
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'application/json'
       
       #OP_VW_04:Verify if Acquirer operator with Acquirer admin role can view specific operator with valid email
       Given path '/operator/pravash.com'
       When method get
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_VW_05:Verify if Acquirer operator with Acquirer admin role can view single operator which is already deleted from database
       Given path '/operator/pravashmahato1234@gmail.com'
       When method get
       And print response
       Then status 404
       And print responseStatus
       And match header content-type contains 'text/plain'
       
           
       #OP_VW_07:Verify if Acquirer operator with data checker role can view all operators
       Given path '/operator'
       When method get
       And print response
       Then status 403
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_VW_08:Verify if Acquirer operator with data maker role can view all operators
       Given path '/operator'
       When method get
       And print response
       Then status 403
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_VW_08:Verify if Acquirer operator with data viewer role can view all operators
       Given path '/operator'
       When method get
       And print response
       Then status 403
       And print responseStatus
       And match header content-type contains 'text/plain'
       