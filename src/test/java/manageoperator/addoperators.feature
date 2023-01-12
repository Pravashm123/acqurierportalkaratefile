Feature: Testing Add operator operator of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
      Scenario: without login
      #OP_AD2:Verify if Acquirer operator with admin role can add branch without logging in
       Given path '/operator'
       And request { "fullName": "Pravash Mahato test", "email": "testtest@moco.com.np", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":116 } ] }
       When method post
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
       
       #OP_AD_01:Verify if Acquirer operator with acquirer admin role can add another operator with valid data
       #Given path '/operator'
       #And request { "fullName": "Pravash Mahato test", "email": "test1ff234@moco.com.np", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":116 } ] }
       #When method post
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_AD_02:Verify if Acquirer operator with acquirer admin role can add another operator when fullname value is empty
       Given path '/operator'
       And request { "fullName": "", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_03:Verify if Acquirer operator with acquirer admin role can add another operator when fullname parameter is missing
       Given path '/operator'
       And request {"email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       
            
       #OP_AD_04:Verify if Acquirer operator with acquirer admin role can add another operator with invalid email
       Given path '/operator'
       And request {"fullName": "Pravash Mahato", "email": "test.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_05:Verify if Acquirer operator with acqueirer admin role can add another operator with duplicate email
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravash.mahato@moco.com.np", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": 116 } ] }
       When method post
       And print response
       Then status 409
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_06:Verify if Acquireroperator with acquirer admin role can add another operator when email value is empty
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       	
       #OP_AD_07:Verify if Acquirer operator with acquirer admin role can add another operator when email parameter is missing
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_08:Verify if Acquirer operator with acquirer admin role can add another operator with only first name in fullname
       Given path '/operator'
       And request { "fullName": "Pravash", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_09:Verify if Acquirer operator with acquirer admin role can add another operator when contact number value is empty
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_10:Verify if Acquirer operator with acquirer admin role can add another operator when contact parameter is missing
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_11:Verify if Acquirer operator with acquirer admin role can add another operator with invalid contact number
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "abcd", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_12:Verify if Acquirer operator with acquirer admin role can add another operator when roleid value is empty
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": "" }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_13:Verify if Acquirer operator with acquirer admin role can add another operator with invalid roleid
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": "test" }, "branch": [ { "id":116 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_14:Verify if Acquirer operator with acquirer admin role can add another operator with roleid which doesnot exist in the system
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 10 }, "branch": [ { "id":116 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_15:Verify if Acquirer operator with acquirer admin role can add another operator when branchid value is empty
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id":"" } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_16:Verify if Acquirer operator with acquirer admin role can add another operator with invalid branchid
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": "test" } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_17:Verify if Acquirer operator with acquirer admin role can add another operator with branchid which doesnot exist in the system
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": 654564 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_AD_CK_18:Verify if Acquirer operator with data checker role can add another operator 
       #Given path '/operator'
       #And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": 98# } ] }
       #When method post
       #And print response
       #Then status 404
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
        #OP_AD_MK_19:Verify if Acquirer operator with data checker role can add another operator 
       #Given path '/operator'
       #And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": 98 } ] }
       #When method post
       #And print response
       #Then status 404
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
      

       
       