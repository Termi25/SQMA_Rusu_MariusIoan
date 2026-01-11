Feature: Add Text to Image
  As a user of the photo editor
  I want to add text to images
  So that I can create custom labels

  Scenario: Add text to image and download
    Given the photo editor is open
    When I upload the image "PlushiesGG.PNG"
    And I add text "TEST" with default settings
    And I click the save button
    Then the image should be downloaded with text
    And I close the browser
