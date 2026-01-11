Feature: Photo Editor Functionality
  As a user of the photo editor
  I want to upload, edit, and download images
  So that I can apply effects and add text to my photos

  Scenario: Apply sepia effect and download image
    Given the photo editor is open
    When I upload the image "PlushiesGG.PNG"
    And I select the "Sepia" effect
    And I click the save button
    Then the image should be downloaded with sepia effect
    And I upload the image "PlushiesGG.PNG"
    And I add text "TEST" with default settings
    And I click the save button
    Then the image should be downloaded with text
    And I close the browser
