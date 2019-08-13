# Ripped from [Mutable Instruments dev](https://github.com/pichenettes/mutable-dev-environment) env. Thanks Emilie !

## Usage

### Vagrant box access
    vagrant up
    vagrant ssh
### Compilation
    make
### Flash
    st-flash --reset write project.bin 0x08000000
### End session
    exit
    vagrant halt

## Requirements

* [VirtualBox 5.x](https://www.virtualbox.org/wiki/Downloads)
* [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

The Extension pack consists of a file with the `vbox-extpack` extension.  On windows, double click on it.  On OS X or Linux, the file needs to be installed from the command line with the command:

    VBoxManage extpack install <filename>

Finally if you are running a Linux operating system you will want to add your user to the `vboxusers` group so that the virtual machine can access your USB devices.  Run the following command:

    sudo usermod -a -G vboxusers $USER

Then **log out and log back in** to make sure the group change takes effect.

## USB issues

To pass through USB devices from your real machine to the virtual machine, consult the [VirtualBox USB documentation](https://www.virtualbox.org/manual/ch03.html#idp96037808).

## <a name=#customization></a>Customization

### Using a different programmer
To use a programmer other than the default (AVR ISP mkII, ARM-USB-OCD-H) it is no longer necessary to edit the makefiles. Instead, the programmer can be set in the shell for the current session, e.g.

	export PGM_INTERFACE=stlink-v2
	export PGM_INTERFACE_TYPE=hla

for ARM projects using a JTAG adapter. Similarly for AVR projects, you can use

	export PROGRAMMER=stk500
	export PROGRAMMER_PORT=/dev/tty.usbserial-xxxxxxxx

Any further calls to `make` will then automatically use these settings. To make them permanent, add the exports to the end of `~/.bashrc`.
