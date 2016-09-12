%w[
git
curl
build-essential
libsqlite3-dev
nodejs
].each do |pkg|
  describe package pkg do
    it { should be_installed }
  end
end

describe command '/opt/ruby_build/builds/myapp/bin/ruby -v' do
  its('stdout') { should match /2.3.1/ }
end

describe file('/etc/init.d/myapp') do
  it { should be_file }
end

describe command 'curl localhost:8000' do
  its('stdout') { should match /The page you were looking for doesn't exist/ }
end

describe port 8000 do
  it { should be_listening }
end
