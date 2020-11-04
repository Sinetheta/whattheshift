Capybara.register_driver :chrome_headless do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  browser_options.args << '--headless'

  # heroku-buildpack-google-chrome puts Chrome binary in a non-standard location
  # https://github.com/heroku/heroku-buildpack-google-chrome#selenium
  chrome_binary_path = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
  if chrome_binary_path
    ::Selenium::WebDriver::Chrome.path = chrome_binary_path
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end
