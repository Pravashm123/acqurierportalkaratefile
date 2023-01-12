Feature: Testing Add operator operator of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
      Scenario: without login
      #OP_UP_02:Verify if Acquirer operator with admin role can update operator without login
       Given path '/operator/tests@moco.com.np'
       And request { "fullName": "test moco", "email": "testings@moco.com.np", "contactNumber": "9860119137", "role": { "id": 5 }, "branch": [ { "id": 113 } ] }
       When method put
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
       
       #OP_UP_01:Verify if Acquirer operator with admin role can update operator with valid data
       #Given path '/operator/tests@moco.com.np'
       #And request { "fullName": "test moco", "email": "testings@moco.com.np", "contactNumber": "9860119137", "role": { "id": 5 }, "branch": [ { "id": 113 } ] }
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_02:Verify if Acquirer operator with admin role can update operator when email value is empty
       Given path '/operator/pravash123@gmail.com'
       And request {"email": "","fullName": "Pravash Mahato Test",  "contactNumber": "9860119137", "status": "enabled", "role": { "id": 2, "name": "AcquirerAdmin" }, "branch": [ { "id": 1, "name": "Patantest", "acquirerId": 0 }, { "id": 2, "name": "Patan", "acquirerId": 0 }, { "id": 3, "name": "Patan", "acquirerId": 0 }, { "id": 4, "name": "Patan", "acquirerId": 0 }, { "id": 5, "name": "Patan", "acquirerId": 0 }, { "id": 6, "name": "Patan", "acquirerId": 0 }, { "id": 7, "name": "Patan", "acquirerId": 0 }, { "id": 8, "name": "Patan", "acquirerId": 0 }, { "id": 9, "name": "Patan", "acquirerId": 0 }, { "id": 10, "name": "Patan", "acquirerId": 0 }, { "id": 11, "name": "Patan", "acquirerId": 0 }, { "id": 12, "name": "Patan", "acquirerId": 0 }, { "id": 13, "name": "Patan", "acquirerId": 0 }, { "id": 14, "name": "Patan", "acquirerId": 0 }, { "id": 15, "name": "Patan", "acquirerId": 0 }, { "id": 16, "name": "123456", "acquirerId": 0 }, { "id": 17, "name": "Patan", "acquirerId": 0 }, { "id": 18, "name": "Patan", "acquirerId": 0 }, { "id": 19, "name": "Patan", "acquirerId": 0 }, { "id": 20, "name": "Patan", "acquirerId": 0 }, { "id": 21, "name": "@#$%!", "acquirerId": 0 }, { "id": 22, "name": "Patan", "acquirerId": 0 }, { "id": 23, "name": "Patan", "acquirerId": 0 }, { "id": 24, "name": "Patan", "acquirerId": 0 }, { "id": 25, "name": "Patan", "acquirerId": 0 }, { "id": 26, "name": "AVAFSAD123@#$%!", "acquirerId": 0 } ], "acquirerId": 3 }
       When method put
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_03:Verify if Acquirer operator with admin role can update operator when email parameter is missing
       Given path '/operator/pravash123@gmail.com'
       And request {"fullName": "Pravash Mahato Test",  "contactNumber": "9860119137", "status": "enabled", "role": { "id": 2, "name": "AcquirerAdmin" }, "branch": [ { "id": 1, "name": "Patantest", "acquirerId": 0 }, { "id": 2, "name": "Patan", "acquirerId": 0 }, { "id": 3, "name": "Patan", "acquirerId": 0 }, { "id": 4, "name": "Patan", "acquirerId": 0 }, { "id": 5, "name": "Patan", "acquirerId": 0 }, { "id": 6, "name": "Patan", "acquirerId": 0 }, { "id": 7, "name": "Patan", "acquirerId": 0 }, { "id": 8, "name": "Patan", "acquirerId": 0 }, { "id": 9, "name": "Patan", "acquirerId": 0 }, { "id": 10, "name": "Patan", "acquirerId": 0 }, { "id": 11, "name": "Patan", "acquirerId": 0 }, { "id": 12, "name": "Patan", "acquirerId": 0 }, { "id": 13, "name": "Patan", "acquirerId": 0 }, { "id": 14, "name": "Patan", "acquirerId": 0 }, { "id": 15, "name": "Patan", "acquirerId": 0 }, { "id": 16, "name": "123456", "acquirerId": 0 }, { "id": 17, "name": "Patan", "acquirerId": 0 }, { "id": 18, "name": "Patan", "acquirerId": 0 }, { "id": 19, "name": "Patan", "acquirerId": 0 }, { "id": 20, "name": "Patan", "acquirerId": 0 }, { "id": 21, "name": "@#$%!", "acquirerId": 0 }, { "id": 22, "name": "Patan", "acquirerId": 0 }, { "id": 23, "name": "Patan", "acquirerId": 0 }, { "id": 24, "name": "Patan", "acquirerId": 0 }, { "id": 25, "name": "Patan", "acquirerId": 0 }, { "id": 26, "name": "AVAFSAD123@#$%!", "acquirerId": 0 } ], "acquirerId": 3 }
       When method put
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_04:Verify if Acquirer operator with admin role can update operator with invalid email
       Given path '/operator/pravash123@gmail.com'
       And request {"email": "test.com","fullName": "Pravash Mahato Test",  "contactNumber": "9860119137", "status": "enabled", "role": { "id": 2, "name": "AcquirerAdmin" }, "branch": [ { "id": 1, "name": "Patantest", "acquirerId": 0 }, { "id": 2, "name": "Patan", "acquirerId": 0 }, { "id": 3, "name": "Patan", "acquirerId": 0 }, { "id": 4, "name": "Patan", "acquirerId": 0 }, { "id": 5, "name": "Patan", "acquirerId": 0 }, { "id": 6, "name": "Patan", "acquirerId": 0 }, { "id": 7, "name": "Patan", "acquirerId": 0 }, { "id": 8, "name": "Patan", "acquirerId": 0 }, { "id": 9, "name": "Patan", "acquirerId": 0 }, { "id": 10, "name": "Patan", "acquirerId": 0 }, { "id": 11, "name": "Patan", "acquirerId": 0 }, { "id": 12, "name": "Patan", "acquirerId": 0 }, { "id": 13, "name": "Patan", "acquirerId": 0 }, { "id": 14, "name": "Patan", "acquirerId": 0 }, { "id": 15, "name": "Patan", "acquirerId": 0 }, { "id": 16, "name": "123456", "acquirerId": 0 }, { "id": 17, "name": "Patan", "acquirerId": 0 }, { "id": 18, "name": "Patan", "acquirerId": 0 }, { "id": 19, "name": "Patan", "acquirerId": 0 }, { "id": 20, "name": "Patan", "acquirerId": 0 }, { "id": 21, "name": "@#$%!", "acquirerId": 0 }, { "id": 22, "name": "Patan", "acquirerId": 0 }, { "id": 23, "name": "Patan", "acquirerId": 0 }, { "id": 24, "name": "Patan", "acquirerId": 0 }, { "id": 25, "name": "Patan", "acquirerId": 0 }, { "id": 26, "name": "AVAFSAD123@#$%!", "acquirerId": 0 } ], "acquirerId": 3 }
       When method put
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_05:Verify if Acquirer operator with admin role can update operator when fullname value is empty
       Given path '/operator/pravash123@gmail.com'
       And request {"email": "pravash13@gmail.com","fullName": "",  "contactNumber": "9860119137", "status": "enabled", "role": { "id": 2, "name": "AcquirerAdmin" }, "branch": [ { "id": 1, "name": "Patantest", "acquirerId": 0 }, { "id": 2, "name": "Patan", "acquirerId": 0 }, { "id": 3, "name": "Patan", "acquirerId": 0 }, { "id": 4, "name": "Patan", "acquirerId": 0 }, { "id": 5, "name": "Patan", "acquirerId": 0 }, { "id": 6, "name": "Patan", "acquirerId": 0 }, { "id": 7, "name": "Patan", "acquirerId": 0 }, { "id": 8, "name": "Patan", "acquirerId": 0 }, { "id": 9, "name": "Patan", "acquirerId": 0 }, { "id": 10, "name": "Patan", "acquirerId": 0 }, { "id": 11, "name": "Patan", "acquirerId": 0 }, { "id": 12, "name": "Patan", "acquirerId": 0 }, { "id": 13, "name": "Patan", "acquirerId": 0 }, { "id": 14, "name": "Patan", "acquirerId": 0 }, { "id": 15, "name": "Patan", "acquirerId": 0 }, { "id": 16, "name": "123456", "acquirerId": 0 }, { "id": 17, "name": "Patan", "acquirerId": 0 }, { "id": 18, "name": "Patan", "acquirerId": 0 }, { "id": 19, "name": "Patan", "acquirerId": 0 }, { "id": 20, "name": "Patan", "acquirerId": 0 }, { "id": 21, "name": "@#$%!", "acquirerId": 0 }, { "id": 22, "name": "Patan", "acquirerId": 0 }, { "id": 23, "name": "Patan", "acquirerId": 0 }, { "id": 24, "name": "Patan", "acquirerId": 0 }, { "id": 25, "name": "Patan", "acquirerId": 0 }, { "id": 26, "name": "AVAFSAD123@#$%!", "acquirerId": 0 } ], "acquirerId": 3 }
       When method put
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
        #OP_UP_06:Verify if Acquirer operator with admin role can update operator when fullname parameter is missing
       Given path '/operator/pravash123@gmail.com'
       And request {"email": "pravash13@gmail.com","contactNumber": "9860119137", "status": "enabled", "role": { "id": 2, "name": "AcquirerAdmin" }, "branch": [ { "id": 1, "name": "Patantest", "acquirerId": 0 }, { "id": 2, "name": "Patan", "acquirerId": 0 }, { "id": 3, "name": "Patan", "acquirerId": 0 }, { "id": 4, "name": "Patan", "acquirerId": 0 }, { "id": 5, "name": "Patan", "acquirerId": 0 }, { "id": 6, "name": "Patan", "acquirerId": 0 }, { "id": 7, "name": "Patan", "acquirerId": 0 }, { "id": 8, "name": "Patan", "acquirerId": 0 }, { "id": 9, "name": "Patan", "acquirerId": 0 }, { "id": 10, "name": "Patan", "acquirerId": 0 }, { "id": 11, "name": "Patan", "acquirerId": 0 }, { "id": 12, "name": "Patan", "acquirerId": 0 }, { "id": 13, "name": "Patan", "acquirerId": 0 }, { "id": 14, "name": "Patan", "acquirerId": 0 }, { "id": 15, "name": "Patan", "acquirerId": 0 }, { "id": 16, "name": "123456", "acquirerId": 0 }, { "id": 17, "name": "Patan", "acquirerId": 0 }, { "id": 18, "name": "Patan", "acquirerId": 0 }, { "id": 19, "name": "Patan", "acquirerId": 0 }, { "id": 20, "name": "Patan", "acquirerId": 0 }, { "id": 21, "name": "@#$%!", "acquirerId": 0 }, { "id": 22, "name": "Patan", "acquirerId": 0 }, { "id": 23, "name": "Patan", "acquirerId": 0 }, { "id": 24, "name": "Patan", "acquirerId": 0 }, { "id": 25, "name": "Patan", "acquirerId": 0 }, { "id": 26, "name": "AVAFSAD123@#$%!", "acquirerId": 0 } ], "acquirerId": 3 }
       When method put
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       
        #OP_UP_07:Verify if Acquirer operator with admin role can update operator with only first name in fullname
       Given path '/operator/pravash123@gmail.com'
       And request { "fullName": "Pravash", "email": "pravashmahato37@gmail.com", "contactNumber": "9860119137", "status": "enabled", "role": { "id": 1, "name": "SuperAdmin" }, "branch": [ { "id": 1, "name": "Patantest123", "acquirerId": 0 } ], "acquirerId": 3 }
       When method put
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
         #OP_UP_08:Verify if Acquirer operator with acquirer admin role can update another operator when contact number value is empty
       Given path '/operator'
       And request { "email": "pravash13@gmail.com","fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_09:Verify if Acquirer operator with acquirer admin role can update another operator when contact parameter is missing
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_10:Verify if Acquirer operator with acquirer admin role can update another operator with invalid contact number
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "abcd", "role": { "id": 2 }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_11:Verify if Acquirer operator with acquirer admin role can update another operator when roleid value is empty
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": "" }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_12:Verify if Acquirer operator with acquirer admin role can update another operator with invalid roleid
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": "test" }, "branch": [ { "id":1 } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_13:Verify if Acquirer operator with acquirer admin role can update another operator with roleid which doesnot exist in the system
       #Given path '/operator'
       #And request { "fullName": "test operator", "email": "test123@gmail.com", "contactNumber": "9860119137", "role": { "id": 10 }, "branch": [ { "id":1 } ] }
       #When method post
       #And print response
       #Then status 422
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_14:Verify if Acquirer operator with acquirer admin role can update another operator when branchid value is empty
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": "" } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_15:Verify if Acquirer operator with acquirer admin role can update another operator with invalid branchid
       Given path '/operator'
       And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": "test" } ] }
       When method post
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_16:Verify if Acquirer operator with acquirer admin role can update another operator with branchid which doesnot exist in the system
       #Given path '/operator'
       #And request { "fullName": "Pravash Mahato", "email": "pravashm96@gmail.com", "contactNumber": "9860119137", "role": { "id": 2 }, "branch": [ { "id": 20 } ] }
       #When method post
       #And print response
       #Then status 422
       #And print responseStatus
       #And match header content-type contains 'text/plain'	
       
        #OP_UP_17:Verify if Acquirer operator can update status to disable with invalid email
       Given path '/operator/pravash12.com/disable'
       And request {"reason": "test"}
       When method put
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       #
       #OP_UP_18:Verify if Acquirer operator can update status to disable by email with valid reason
       #Given path '/operator/pravashm96@gmail.com/disable'
       #And request {"reason": "test"}
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_19:Verify if Acquirer operator can update status to disable by email with valid reason
       #Given path '/operator/pravashm96@gmail.com/disable'
       #And request {"reason": "test"}
       #When method put
       #And print response
       #Then status 422
       #And print responseStatus
       #And match header content-type contains 'text/plain'     
       
       #OP_UP_20:Verify if Acquirer operator can update status to disable by email when reason parameter is missing
       #Given path '/operator/pravashm96@gmail.com/disable'
       #And request { }
       #When method put
       #And print response
       #Then status 400
       #And print responseStatus
       #And match header content-type contains 'text/plain' 
       #
       #OP_UP_21:Verify if Acquirer operator can update status to enable by email with valid reason
       #Given path '/operator/pravashm96@gmail.com/enable'
       #And request {"reason": "test"}
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       
       #OP_UP_22:Verify if Acquirer operator can update status to enable by email with empty reason
       Given path '/operator/pravashm96@gmail.com/enable'
       And request {"reason": ""}
       When method put
       And print response
       Then status 422
       And print responseStatus
       And match header content-type contains 'text/plain'
       
       #OP_UP_23:Verify if Acquirer operator can update status to enable by email when reason parameter is missing
       Given path '/operator/pravashm96@gmail.com/enable'
       And request {}
       When method put
       And print response
       Then status 400
       And print responseStatus
       And match header content-type contains 'text/plain'
       #
       #OP_UP_24:Verify if Acquirer operator with data maker role can update status to disable
       #Given path '/operator/pravashm96@gmail.com/enable'
       #And request {}
       #When method put
       #And print response
       #Then status 400
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
         #
       #OP_UP_25:Verify if Acquirer operator with data checker role can update status to disable
       #Given path '/operator/pravashm96@gmail.com/enable'
       #And request {}
       #When method put
       #And print response
       #Then status 400
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
         #
       #OP_UP_26:Verify if Acquirer operator with data viewer role can update status to disable
       #Given path '/operator/pravashm96@gmail.com/enable'
       #And request {}
       #When method put
       #And print response
       #Then status 400
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
       #OP_UP_27:Verify if Acquirer operator with data maker role can update operator with valid data
       #Given path '/operator/tests@moco.com.np'
       #And request { "fullName": "test moco", "email": "testings@moco.com.np", "contactNumber": "9860119137", "role": { "id": 5 }, "branch": [ { "id": 113 } ] }
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
       #OP_UP_28:Verify if Acquirer operator with data checker role can update operator with valid data
       #Given path '/operator/tests@moco.com.np'
       #And request { "fullName": "test moco", "email": "testings@moco.com.np", "contactNumber": "9860119137", "role": { "id": 5 }, "branch": [ { "id": 113 } ] }
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       #
       #OP_UP_29:Verify if Acquirer operator with data maker role can update operator with valid data
       #Given path '/operator/tests@moco.com.np'
       #And request { "fullName": "test moco", "email": "testings@moco.com.np", "contactNumber": "9860119137", "role": { "id": 5 }, "branch": [ { "id": 113 } ] }
       #When method put
       #And print response
       #Then status 200
       #And print responseStatus
       #And match header content-type contains 'text/plain'
       