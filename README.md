# How to build (AM62x)
1. ```
   sdk_checkout.sh
   ```
1. ```
   cd SDK11/build
   ```
1. ```
   . conf/setenv
   ```
1. Starting the build (`meta-customer` is intentionally NOT added; this is the stock TI BSP baseline)
   ```
   MACHINE=am62xx-evm bitbake -k tisdk-base-image
   ```

# Create a bootable SD card
```
$ mkdir sd_image && cd sd_image
$ cp deploy-ti/images/am62xx-evm/tisdk-base-image-am62xx-evm.rootfs.wic.xz .
$ xz -d tisdk-base-image-am62xx-evm.rootfs.wic.xz
$ sudo dd if=tisdk-base-image-am62xx-evm.rootfs.wic of=/dev/sdX bs=1M conv=fsync
```

# Notes
* `meta-customer` (AM62P5 SK DTS overrides, 2GB DRAM) is not used on this branch. It only applies to `am62pxx-evm`.
* The device tree used is the TI default for `am62xx-evm`. Verify it matches the EVB and its DRAM size before relying on it.

# Reference
* [Building the SDK with Yocto](https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/11_02_08_02/exports/docs/linux/Overview_Building_the_SDK.html)
* [Yocto Layer Configuration](https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/11_02_08_02/exports/docs/devices/AM62PX/linux/Release_Specific_Yocto_layer_Configuration.html)
