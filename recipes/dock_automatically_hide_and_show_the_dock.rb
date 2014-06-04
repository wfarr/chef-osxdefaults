osxdefaults_defaults "Automatically hide and show the dock" do
  domain 'com.apple.dock'
  key 'autohide'
  
  if node.platform_version == "10.10"
    integer 1
  else
    boolean true
  end
end
