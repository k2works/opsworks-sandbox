%w[my-key my-key.pub].each do |file|
  describe file("/tmp/#{file}") do
    it { should be_file }
  end
end
