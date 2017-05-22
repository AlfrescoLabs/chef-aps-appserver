username = node.content['appserver']['username']
groupname = node.content['appserver']['group']

control 'aps-appserver-01' do
  impact 0.7
  desc 'Checks Tomcat user'

  describe user(username) do
    it { should exist }
  end
end

control 'aps-appserver-02' do
  impact 0.7
  desc 'Checks Tomcat group'

  describe group(groupname) do
    it { should exist }
  end
end

control 'aps-appserver-03' do
  impact 0.7
  desc 'Checks Tomcat-activiti service running'

  describe service('Tomcat-activiti') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

control 'aps-appserver-04' do
  impact 0.7
  desc 'Checks Tomcat activiti packages folder'

  describe directory('/opt/tomcat/activiti') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end

control 'aps-appserver-05' do
  impact 0.7
  desc 'Checks Tomcat activiti packages binary files'

  describe file('/opt/tomcat/activiti/bin/setenv.sh') do
    it { should exist }
    it { should be_file }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end

control 'aps-appserver-06' do
  impact 0.7
  desc 'Checks Tomcat activiti packages configuration files'
  describe file('/opt/tomcat/activiti/conf/web.xml') do
    it { should exist }
    it { should be_file }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should_not be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
    its('content') { should match '<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"' }
  end

  describe file('/opt/tomcat/activiti/conf/context.xml') do
    it { should exist }
    it { should be_file }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should_not be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end

control 'aps-appserver-07' do
  impact 0.7
  desc 'Checks Tomcat configuration folder'

  describe directory('/etc/tomcat') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end

control 'aps-appserver-08' do
  impact 0.7
  desc 'Checks Tomcat configuration file'

  describe file('/etc/systemd/system/tomcat-activiti.service') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    it { should be_writable.by_user('root') }
    it { should be_readable.by_user('root') }
    it { should_not be_executable.by_user('root') }
    it { should_not be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should_not be_executable.by_user(username) }
    its('content') { should match 'Environment="CATALINA_HOME=/usr/share/tomcat-8.0.36"' }
    its('content') { should match '"CATALINA_BASE=/opt/tomcat/activiti" "JAVA_HOME=/usr"' }
  end
end

control 'aps-appserver-09' do
  impact 0.7
  desc 'Checks variable log file for tomcat'

  describe directory('/var/log/tomcat') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end

control 'aps-appserver-10' do
  impact 0.7
  desc 'Checks variable lib file for tomcat'

  describe directory('/var/lib/tomcat/activiti') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end

control 'aps-appserver-11' do
  impact 0.7
  desc 'Checks variable cache file for tomcat'

  describe directory('/var/cache/tomcat/activiti') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq username }
    its('group') { should eq groupname }
    it { should be_writable.by_user(username) }
    it { should be_readable.by_user(username) }
    it { should be_executable.by_user(username) }
    it { should_not be_readable.by_user('nginx') }
    it { should_not be_writable.by_user('nginx') }
    it { should_not be_executable.by_user('nginx') }
  end
end