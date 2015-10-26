#
# Cookbook Name:: audit-demo
# Recipe:: ubuntu-audit-apache
#
# Copyright (c) 2015 Ricardo Lupo, All Rights Reserved.

control_group 'Validate permissions on web services' do
  control 'Ensure no web files are owned by the root user' do
    Dir.glob('/var/www/html/**/*') do|web_file|
      it 'is not owned by root user' do
        expect(file(web_file)).to_not be_owned_by('root')
      end
    end
  end
end
