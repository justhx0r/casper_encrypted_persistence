# Casper Encrypted Persistence
The title says it all - This is an attempt of porting the `debian/kali`/`live-tools` feature of `Encrypted Persistence` over to `casper`/`Ubuntu` systems.
## Usage
1. Build the package
```bash
git clone https://github.com/justhx0r/casper_encrypter_persistence && \
cd casper_encrypted_persistence && \
rm README.md && \
dpkg -b . ..
```
2. Install the packages in your `custom-root` or whatever workspace you use for building or modifying a ubuntu iso
3. Append the following boot parameters:
```
persistent persistence-cryptsetup
```
4. Setup the encrypted storage, e.g after writing the iso to a usb thumb drive(Make sure to replace with the device filepath!)
```bash
cryptsetup luksFormat /dev/sdX3
cryptsetup luksOpen /dev/sdX3 persistence
mkfs.ext3 /dev/mapper/persistence
e2label /dev/mapper/persistence casper-rw
mount /dev/mapper/persistence /mnt
echo '/ union' > /mnt/persistence.conf
umount /mnt
cryptsetup close persistence
```
5. You should now be able to boot using encrypted persistence!

