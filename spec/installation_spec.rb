require 'serverspec'

if ENV['TRAVIS']
    set :backend, :exec
end

describe 'vagrant Ansible role' do

    # Declare variables
    executable = ''
    packages = Array[]

    if ['debian', 'ubuntu'].include?(os[:family])
        executable = '/usr/bin/vagrant'
        packages = Array[ 'vagrant' ]
    end

    it 'install role packages' do
        packages.each do |pkg_name|
            expect(package(pkg_name)).to be_installed
        end
    end

    describe file(executable) do
        it { should exist }
        it { should be_mode 755 }
    end

    if not ENV['TRAVIS']
        describe command('vagrant plugin list') do
            its(:stdout) {
                should match /.*vagrant-serverspec.*/m
                should match /.*vagrant-triggers.*/m
            }
        end
    end
end

