Feature: Testing Delete operator operator of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
      Scenario: without login delete operator
      #OP_DEL_02:Verify if acquirer operator with Acquirer admin role can delete a specific operator with valid email and reason
       Given path '/operator/pravash1243@gmail.com'
       And request {"reason":"test"}
       When method delete
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
       
       #OP_DEL_01:Verify if acquirer operator with Acquirer admin role can delete a specific operator with valid email and reason
       #Given path '/operator/pravash1243@gmail.com'
       #And request {"reason":"test"}
       #When method delete
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_DEL_03:Verify if acquirer operator with Acquirer admin role can delete their own account
       Given path '/operator/pravash.mahato@moco.com.np'
       And request {"reason":"test"}
       When method delete
       And print response
       Then status 403
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_DEL_04:Verify if acquirer operator with Acquirer admin role can delete a specific operaor with an invalid email
       Given path '/operator/123.com'
       And request {"reason":"test"}
       When method delete
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_DEL_05:Verify if acquirer operator with Acquirer admin role can delete a specific operator when reason value is empty
       Given path '/operator/pravash1ff243@gmail.com'
       And request {"reason":""}
       When method delete
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_DEL_06:Verify if acquirer operator with Acquirer admin role can delete a operator which doesnot exist in the system
       Given path '/operator/test123@gmail.com'
       And request {"reason":"test"}
       When method delete
       And print response
       Then status 404
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_DEL_07:Verify if acquirer operator with Acquirer admin role can delete a specific operator when reason parameter is missing
       #Given path '/operator/pravash1ff243@gmail.com'
       #And request { }
       #When method delete
       #And print response
       #Then status 400
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
         
       #OP_DEL_08:Verify if acquirer operator with Acquirer admin role can a delete a specific operator with wrong endpoint
       Given path '/operators/pravash1ff243@gmail.com'
       And request {"reason":"test"}
       When method delete
       And print response
       Then status 404
       And print responseStatus
       And match header content-type contains 'text/html'
       
       #OP_DEL_09:Verify if acquirer operator with data maker role can delete a specific operator with valid email and reason
       #Given path '/operator/pravash1243@gmail.com'
       #And request {"reason":"test"}
       #When method delete
       #And print response
       #Then status 403
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_DEL_10:Verify if acquirer operator with data checker role can delete a specific operator with valid email and reason
       #Given path '/operator/pravash1243@gmail.com'
       #And request {"reason":"test"}
       #When method delete
       #And print response
       #Then status 403
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
              
       #OP_DEL_11:Verify if acquirer operator with data viewer role can delete a specific operator with valid email and reason
       #Given path '/operator/pravash1243@gmail.com'
       #And request {"reason":"test"}
       #When method delete
       #And print response
       #Then status 403
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       