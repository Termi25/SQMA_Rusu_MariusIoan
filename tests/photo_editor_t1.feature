Feature: Apply Sepia Effect
  As a user of the photo editor
  I want to apply sepia effect to images
  So that I can create vintage-looking photos

  Scenario: Apply sepia effect and download image
    Given the photo editor is open
    When I upload the image "PlushiesGG.PNG"
    And I select the "Sepia" effect
    And I click the save button
    Then the image should be downloaded with sepia effect
    And I close the browser
