Feature: Testing operator activities of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
     Scenario: without login
    #OP_VW_11:Verify if privileged operator can view operator's activity without logging into the system
    Given path '/operator/activity'
    And params {"startDate":"2022-12-20","endDate":"2022-12-20","startRecord":"0","count":"20"}
    When method GET
    And print response
    Then status 401
    And print responseStatus
    And match header content-type contains 'text/plain'
    
    Scenario: Login with authorized email
      Given path '/operator/authentication'
       And form field email = 'pravash.mahato@moco.com.np'
       And form field password = 'Hello@1234'
       When method post
       And print response
       Then status 200
       And print responseStatus
       And match header content-type contains 'text/plain'
    
    #OP_AC_VW_01:Verify if privileged operator can view other operator's activity with valid start date and end date
    Given path '/operator/activity'
    And params {"startDate":"2023-01-10","endDate":"2023-01-10","startRecord":"0","count":"20"}
    When method GET
    And print response
    Then status 200
    And print responseStatus
    And match header content-type contains 'application/json'
    
    #OP_VW_02:Verify if privileged operator can view other operator's activity with invalid start date format
    Given path '/operator/activity'
    And params {"startDate":"12-13-2022","endDate":"2022-10-19","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 422
    And print responseStatus
    And match header content-type contains 'text/plain'
    
    #OP_VW_03:Verify if privileged operator can view other operator's activity with invalid end date format
    Given path '/operator/activity'
    And params {"startDate":"2022-10-19","endDate":"12-13-2022","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 422
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
    #OP_VW_04:Verify if privileged operator can view other operator's activity with invalid start date and invalid end date format
    Given path '/operator/activity'
    And params {"startDate":"12-12-2022","endDate":"12-13-19","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 422
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
    #OP_VW_05:Verify if privileged operator can view other operator's activity with missing start date parameter
    Given path '/operator/activity'
    And params {"":"2022-10-19","endDate":"2022-10-19","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 400
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
    #OP_VW_06:Verify if privileged operator can view other operator's activity with missing end date parameter
    Given path '/operator/activity'
    And params {"startDate":"2022-10-19","":"2022-10-19","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 400
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
    #OP_VW_07:Verify if privileged operator can view other operator's activity with empty start date 
    Given path '/operator/activity'
    And params {"startDate":"","endDate":"2022-10-19","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 422
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
    #OP_VW_08:Verify if privileged operator can view other operator's activity with empty end date 
    Given path '/operator/activity'
    And params {"startDate":"2022-10-19","endDate":"","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 422
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
    #OP_VW_09:Verify if privileged operator can view other operator's activity with wrong end point 
    Given path '/operators/activity'
    And params {"startDate":"2022-10-19","endDate":"2022-10-19","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 404
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/html'
    
    #OP_VW_10:Verify if privileged operator can view other operator's activity exceeding 30 days difference between start date and end date
    Given path '/operator/activity'
    And params {"startDate":"2022-10-01","endDate":"2022-11-04","startRecord":"15","count":"50"}
    When method GET
    And print response
    Then status 422
    And print responseStatus
    #And match header content-type contains 'application/json'
    And match header content-type contains 'text/plain'
    
 
    

     
    
    
    