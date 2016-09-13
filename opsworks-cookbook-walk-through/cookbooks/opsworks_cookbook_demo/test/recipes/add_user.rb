describe user('root') do
  it { should exist }
  its('uid') { should eq 0 }
  its('gid') { should eq 0 }
  its('group') { should eq 'root' }
  its('groups') { should eq ['root']}
  its('home') { should eq '/root' }
  its('shell') { should eq '/bin/bash' }
  its('mindays') { should eq 0 }
  its('maxdays') { should eq 99999 }
  its('warndays') { should eq 7 }
end

describe user('jdoe') do
  it { should exist }
  its('uid') { should eq 1001 }
  its('gid') { should eq 1001 }
  its('home') { should eq '/home/jdoe' }
  its('shell') { should eq '/bin/bash' }
end

describe user('ec2-user') do
  it { should exist }
  its('uid') { should eq 1002 }
  its('gid') { should eq 1002 }
  its('home') { should eq '/home/ec2-user' }
  its('shell') { should eq '/bin/bash' }
end


