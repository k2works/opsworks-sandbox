%w(unit lint syntax).each do |phase|
  execute "HOME=/home/vagrant delivery job verify #{phase} --server localhost --ent test --org kitchen" do
    cwd '/tmp/repo-data'
    user 'vagrant'
  end
end
