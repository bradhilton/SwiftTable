Pod::Spec.new do |s|
  s.name         = "SwiftTable"
  s.version      = "0.3.2"
  s.summary      = "Abstraction Over UITableViewDelegate and UITableViewDataSource"
  s.description  = <<-DESC
                    SwiftTable creates an abstraction layer over UITableViewDelegate and UITableViewDataSource that allows you to compose data representations at the row, section and table level.
                   DESC
  s.homepage     = "https://github.com/bradhilton/SwiftTable"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Brad Hilton" => "brad@skyvive.com" }
  s.source       = { :git => "https://github.com/bradhilton/SwiftTable.git", :tag => "0.3.2" }

  s.ios.deployment_target = "8.0"

  s.source_files  = "SwiftTable", "SwiftTable/**/*.{swift,h,m}"
  s.requires_arc = true
  s.dependency 'OrderedObjectSet', '~> 3.0.0'
end
