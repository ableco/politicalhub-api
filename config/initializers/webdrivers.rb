require 'webdrivers'

Selenium::WebDriver::Chrome.path = ENV['GOOGLE_CHROME_SHIM'] if ENV['GOOGLE_CHROME_SHIM'].present?