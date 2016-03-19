# vagrant

[![Build Status](https://travis-ci.org/infOpen/ansible-role-vagrant.svg?branch=master)](https://travis-ci.org/infOpen/ansible-role-vagrant)

Install vagrant package.

## Requirements

This role requires Ansible 2.0 or higher,
and platform requirements are listed in the metadata file.

## Testing

This role contains two tests methods :
- locally using Vagrant
- automatically with Travis

### Testing dependencies
- install [Vagrant](https://www.vagrantup.com)
- install [Vagrant serverspec plugin](https://github.com/jvoorhis/vagrant-serverspec)
    $ vagrant plugin install vagrant-serverspec
- install ruby dependencies
    $ bundle install

### Running tests

#### Run playbook and test

- if Vagrant box not running
    $ vagrant up

- if Vagrant box running
    $ vagrant provision

## Role Variables

### Default role variables

    # Package informations
    vagrant_package_version: '1.8.1'
    vagrant_package_state: 'present'
    vagrant_package_filename: "{{ 'vagrant_' ~ vagrant_package_version
       ~ '.' ~ vagrant_package_extension }}"

    # URLs informations
    vagrant_url_download: "{{ 'https://releases.hashicorp.com/vagrant/'
      ~ vagrant_package_version }}"
    vagrant_url_checksum: "{{ vagrant_url_download ~ '/vagrant_'
      ~ vagrant_package_version ~ '_SHA256SUMS' }}"

    # Plugins
    vagrant_plugins:
      - name: 'vagrant-serverspec'
        state: 'present'
      - name: 'vagrant-triggers'
        state: 'present'

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - { role: infOpen.vagrant }

## License

MIT

## Author Information

Alexandre Chaussier (for Infopen company)
- http://www.infopen.pro
- a.chaussier [at] infopen.pro

