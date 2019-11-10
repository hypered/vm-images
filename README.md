# Virtual machine images

This is a Packer definition to build a Debian Buster image as a Vagrant box to
run with VirtualBox and Vagrant.

This was originally based on
[deimosfr/packer-debian](https://github.com/deimosfr/packer-debian).


## Debian Buster Vagrant box

The image can be built with:

```
$ packer build -var-file variables/minimal.json debian-buster-virtualbox
```

The resulting image looks like `debian-10.1.0-amd64-virtualbox.box`.


## Sample Vagrantfile

The created Vagrant box doesn't use the usual `vagrant` username and password,
so you have to specify them in the Vagrantfile:

```
$ cat Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "debian-10.1.0-amd64-virtualbox.box"
  config.ssh.username = 'debian'
  config.ssh.password = 'debian'
  config.ssh.insert_key = 'true'
end
```


## VirtualBox on NixOS

You nee the following in your `configuration.nix` (using `nix-shell -p
virtualbox` is not enough; "thu" is my user):

```
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "thu" ];
```


## Troubleshooting

Sometimes, the referenced Debian version in the `debian-stretch` file becomes
outdated, and should be bumped.


## TODO

- Install the VirtualBox guest additions.
- The shutdown command doesn't seem correct: without the `sudoers.sh` script,
  Packer shows the usual following line, but hangs.

```
    virtualbox-iso: [sudo] password for debian:
```
