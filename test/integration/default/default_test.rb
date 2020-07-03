# InSpec test for recipe systemd_timesyncd::default

# check the conf file
describe file('/etc/systemd/timesyncd.conf') do
  its('content') { should_not match(/^#NTP=/) }
  its('content') { should match(/NTP=10.0.0.1/) }
  its('content') { should_not match(/^#FallbackNTP=/) }
  its('content') { should match(/FallbackNTP=0.au.pool.ntp.org 1.au.pool.ntp.org 2.au.pool.ntp.org/) }
  its('content') { should match(/^#RootDistanceMaxSec=/) }
  its('content') { should match(/^#PollIntervalMinSec=/) }
  its('content') { should match(/^#PollIntervalMaxSec=/) }
end

# check that it's enabled in systemd
# timectlstatus
