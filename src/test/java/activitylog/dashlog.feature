Feature: Testing operator dashboard activities of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
    Scenario: Operator without logging in
    #OP_DSH_AC_02:Verify if Acquirer operator can view recent login activities of operator without logging in
    Given path '/dashboard/activity'
    When method get
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
    
    #OP_DSH_AC_01:Verify if Acquirer operator can view recent login activities of operator
    Given path '/dashboard/activity'
    When method get
    And print response
    Then status 200
    And print responseStatus
    And match header content-type contains 'application/json'
    
    #OP_DSH_AC_03:Verify if Acquirer operator can view recent login activities of operator with wrong endpoin
    Given path '/dashboards/activities'
    When method get
    And print response
    Then status 404
    And print responseStatus
    And match header content-type contains 'text/html'
    