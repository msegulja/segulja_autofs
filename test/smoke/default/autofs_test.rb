# # encoding: utf-8

# Inspec test for recipe segulja_autofs::autofs

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# autofs should be installed, enable, and running
# autofs.master, autofs.direct, and autofs.home should exist and be owned by root

describe service('autofs') do
  it { should be_installed }
  it { should be_running }
  it { should be_enabled }
end

describe file('/etc/auto.direct') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0600' }
end
