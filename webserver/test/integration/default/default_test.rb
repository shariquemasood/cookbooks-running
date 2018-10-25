# # encoding: utf-8

# Inspec test for recipe webserver::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

#unless os.debian or os.linux?
  # This is an example test, replace with your own test.
#  describe user('root'), :skip do
#    it { should exist }
#  end
#end

describe service('nginx') do
  it { should be_installed }
  it { should be_running }
  it { should be_enabled }
end

describe file('/etc/nginx/nginx.conf') do
  its('content') { should match(%r{gzip\s+on}) }
end

# This is an example test, replace it with your own test.
#describe port(80), :skip do
#  it { should_not be_listening }
#end
