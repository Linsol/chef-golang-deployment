#
# Cookbook Name:: jenkins
# Recipe:: config
#
# Author: Seth Vargo <sethvargo@chef.io>
#
# Copyright 2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This is a very basic recipe for installing Java on the target system. It is
# NOT included in any recipes by default. The purpose of this cookbook is to
# install Jenkins, not manage a Java. For complex Java scenarios, you should
# use the Java community cookbook or construct your own.
#
# Do NOT submit patches adding support for additional platforms
# Do NOT submit patches adding support for installing Java derivatives
# Do NOT submit patches adding support for installing different Java versions
#
# This recipe is not included by default, and you have no obligation to use it.
# We are going to be incredibly opinionated about what this recipe includes, as
# it is a minimum viable cookbook for installing Java. If you need a more
# complex scenario, that is outside the scope of this cookbook.
#

# Create a Jenkins user with specific attributes
jenkins_user 'thussain' do
  full_name    'Touqeer Hussain'
  email        'thussain@example.com'
end
#jenkins_password_credentials 'thussain' do
#  description 'Touqeer Hussain'
#  password    'redhat'
#end

jenkins_plugin 'github'
jenkins_plugin 'workflow-aggregator'
jenkins_plugin 'git'
#jenkins_plugin 'golang'
jenkins_plugin 'build-pipeline-plugin'
jenkins_plugin 'build-timeout'
jenkins_plugin 'copyartifact'
jenkins_plugin 'delivery-pipeline-plugin'
jenkins_plugin 'envinject'
jenkins_plugin 'ghprb'
jenkins_plugin 'jobConfigHistory'
#jenkins_plugin 'groovy-postbuild'
#jenkins_plugin 'job-dsl'
jenkins_plugin 'parameterized-trigger'
jenkins_plugin 'promoted-builds'
jenkins_plugin 'timestamper'

cookbook_file '/var/chef/cache/goapp-config.xml' do
  owner 'root'
  group 'root'
  action :create
  source 'goapp-config.xml'
  mode '0644'
end

xml = File.join(Chef::Config[:file_cache_path], 'goapp-config.xml')
# Create a jenkins job (default action is `:create`)
jenkins_job 'goapp' do
  config xml
end

# restart jenkins
service 'jenkins' do
  supports status: true, restart: true, reload: true
  action  [:enable, :restart]
end
