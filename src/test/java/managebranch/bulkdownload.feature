Feature: Testing bulkdownload of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    Scenario: without login
    #BR_BL_UF_03:Verify if Acquirer operator with admin role can download bulk upload format without login
    Given path '/branch/uploadFormat'
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
    
    #BR_BL_UF_01:Verify if Acquirer operator with admin role can download bulk upload format
    Given path '/branch/uploadFormat'
    When method get
    And print response
    Then status 200
    And print responseStatus
    And match header content-type contains 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    
    #BR_BL_D_02:Verify if Acquirer operator with admin role can download bulk upload format with wrong endpoint
    Given path '/branch/uploadFormats'
    When method get
    And print response
    Then status 404
    And print responseStatus
    And match header content-type contains 'text/plain'
    
     #BR_BL_D_04:Verify if Acquirer operator with data maker role can download bulk upload format
    #Given path '/branch/uploadFormat'
    #When method get
    #And print response
    #Then status 200
    #And print responseStatus
    #And match header content-type contains 'text/plain'
    
    #BR_BL_D_04:Verify if Acquirer operator with data checker role can download bulk upload format
    #Given path '/branch/uploadFormat'
    #When method get
    #And print response
    #Then status 200
    #And print responseStatus
    #And match header content-type contains 'text/plain'

    #BR_BL_D_04:Verify if Acquirer operator with data viewer role can download bulk upload format
    #Given path '/branch/uploadFormat'
    #When method get
    #And print response
    #Then status 200
    #And print responseStatus
    #And match header content-type contains 'text/plain'