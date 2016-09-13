describe service('cron') do
  it { should be_installed }
  it { should be_enabled }
  it { should_not be_running }
end
