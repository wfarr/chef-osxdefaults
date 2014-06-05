execute "set ComputerName" do
  command "scutil --set ComputerName #{node['osxdefaults']['computername']}"
  not_if  { `scutil --get ComputerName`.chomp == node['osxdefaults']['computername'] }
end

execute "set HostName" do
  command "scutil --set HostName #{node['osxdefaults']['computername']}"
  not_if  { `scutil --get HostName`.chomp == node['osxdefaults']['computername'] }
end

execute "set LocalHostName" do
  command "scutil --set LocalHostName #{node['osxdefaults']['computername']}"
  not_if  { `scutil --get LocalHostName`.chomp == node['osxdefaults']['computername'] }
end

unless node.platform_version == "10.10"
  osxdefaults_defaults "Set the computer name" do
    domain 'com.apple.smb.server'
    key 'NetBIOSName'
    string node['osxdefaults']['computername']
  end
end
