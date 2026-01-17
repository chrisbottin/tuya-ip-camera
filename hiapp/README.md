# hiapp Executable

File: `firmware/from-boot/using-sd-card/extractions/flashdump.bin.extracted/310000/squashfs-root/LINUX/hiapp`

## Certificate Authority Extraction

Extract HEX code from  at address `001ecee0`
Search for the HEX CODE `30 82 07 ce 30...`

### Convert to DER Certificate

```
xxd -r -p ca.hex > ca.der
```

### View DER Certificate

```
openssl x509 -inform der -in ca.der -text -noout > ca.txt
```

## Patching `hiapp` to ignore SSL certificate errors

The application `hiapp` performs SSL certificate validation using hardcoded memory addresses for error codes. By patching these addresses to return `0` (no error), we can bypass SSL certificate validation.

By ignoring SSL certificate errors, the application can connect to servers with self-signed or invalid certificates without issues.

This is useful for analysing network traffic using man-in-the-middle proxies like `mitmproxy` (reference: https://github.com/nmatt0/mitmrouter).

### Patch Details

Patched File: `hiapp/patch_no_ssl_reject/hiapp`

|          | Address  | HEX         | Instruction | Values     |
|----------|----------|-------------|-------------|------------|
| Original | 0059a8ac | 00 d8 02 24 | li          | v0,-0x2800 |
| Patch    | 0059a8ac | 00 00 02 24 | li          | v0,0x0     |
|          |          |             |             |            |
| Original | 0059a7c0 | 00 d9 03 24 | li          | v1,-0x2700 |   
| Patch    | 0059a7c0 | 00 00 03 24 | li          | v1,0x0     |
