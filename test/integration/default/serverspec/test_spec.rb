require 'serverspec'
set :backend, :exec

cur_dir = Dir.pwd
conftest_command = cur_dir + '/test/test.sh conftest'
unittest_command = cur_dir + '/test/test.sh unittest'

describe package('logstash') do
    it { should be_installed }
  end

describe package('filebeat') do
    it { should be_installed }
  end

describe command(conftest_command) do
    its(:exit_status) {should eq 0}
end

describe command(unittest_command) do
    its(:exit_status) {should eq 0}
end
