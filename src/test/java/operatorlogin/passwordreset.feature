Feature: Testing password reset  of Acquirer portal system

  Background: 
    * url 'https://acquirer0.moco.com.np/api/acquirerportal'
    
     Scenario: operator reset their password sucessfully
     #OP_PW_RST_01:Verify if operator can set their new password through the link
     #Given path '/operator/password/forgot'
     #And form field token = 'Tr0oy20mz64eAG'
     #And form field newPassword = 'Hello@123'
     #When method put
     #And print response
     #Then status 200
     #And print responseStatus
     #And match header content-type contains 'text/plain'
     
     #OP_PW_RST_01:Verify if operator can reset their password after token is expired (30 minutes)
     Given path '/operator/password/forgot'
     And form field token = 'GX4K90WmYl'
     And form field newPassword = 'Hello@123'
     When method put
     And print response
     Then status 200
     And print responseStatus
     And match header content-type contains 'text/plain'
     
     #OP_PW_RST_03:Verify if operator can reset their password with same old password
     #Given path '/operator/password/forgot'
     #And form field token = ''
     #And form field newPassword = ''
     #When method put
     #And print response
     #Then status 200
     #And print responseStatus
     #And match header content-type contains 'text/plain'