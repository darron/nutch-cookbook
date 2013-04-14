#
# Cookbook Name:: nutch
# Recipe:: default
#

# Make sure Java's installed.
include_recipe "java::default"

# Make sure Jetty's installed.
include_recipe "jetty::default"

# Make sure Solr's installed.
include_recipe "solr::default"

# Install Nutch
package "patch"

ark "nutch" do
  url node[:nutch][:url]
  path node[:nutch][:prefix]
  owner node[:jetty][:user]
  action :put
end

# Patch broken crawl script.
cookbook_file "#{node[:nutch][:path]}/bin/nutch-patch.txt" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

bash "patch nutch" do
  user "root"
  cwd "#{node[:nutch][:path]}/bin"
  code <<-EOH
    patch < nutch-patch.txt
    touch patched
  EOH
  not_if {File.exists?("#{node[:nutch][:path]}/bin/patched")}
end