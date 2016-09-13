%w[index.html hello.txt].each do |file|
  describe file("/tmp/create-directory-demo/#{file}") do
    it { should be_file }

    case file
      when 'hello.txt'
        its('content') { should match(%r{Hello, World!})}
      when 'index.html'
        its('content') { should match(%r{<html>This is a placeholder for the home page.</html>})}
    end
  end
end
