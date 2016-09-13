describe file("/tmp/run-script-demo/helloworld.txt") do
  its('content') { should match(%r{Hello, World!})}
end
