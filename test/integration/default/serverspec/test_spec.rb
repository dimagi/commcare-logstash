require 'serverspec'
set :backend, :exec

cur_dir = Dir.pwd
test_command = cur_dir + '/test/test.sh'

describe package('logstash') do
    it { should be_installed }
  end

describe package('filebeat') do
    it { should be_installed }
  end

describe command(test_command) do
    its(:exit_status) {should eq 0}
end
