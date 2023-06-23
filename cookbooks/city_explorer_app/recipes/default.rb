#
# Cookbook:: city_explorer_app
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

# Clone the application repository
git '/home/ubuntu/CityExplorer' do
  repository 'https://github.com/RL20/CityExplorer.git'
  action :sync
end
 
package 'python3-pip' do
  action :install
end

# Install requirements
#execute 'install_requirements' do
#  command 'pip install -r /opt/cityexplorer/requirements.txt'
#end
 
# Create service
template '/etc/systemd/system/cityexplorer.service' do
  source 'cityexplorer.service.erb'
  variables(
    app_path: '/home/ubuntu/CityExplorer'
  )
end

 
# Start service
service 'cityexplorer' do
  action [:enable, :start]
end
