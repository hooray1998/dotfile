# qemu-img
> Tool for Quick Emulator Virtual HDD image creation and manipulation
- **Create disk image with a specific size (in gigabytes):**
qemu-img create `image_name.img` `gigabytes`G
- **Show information about a disk image:**
qemu-img info `image_name.img`
- **Increase or decrease image size:**
qemu-img resize `image_name.img` `gigabytes`G
- **Dump the allocation state of every sector of the specified disk image:**
qemu-img map `image_name.img`
- **Convert a VMWare .vmdk disk image to a KVM .qcow2 disk image:**
qemu-img convert -O qcow2 `/path/to/file/foo.vmdk` `/path/to/file/foo.qcow2`
