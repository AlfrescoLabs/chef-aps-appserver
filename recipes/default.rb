#
# Cookbook:: aps-appserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "aps-appserver::#{node['appserver']['engine']}"
