Multipart upload to S3
======================

![](https://raw.githubusercontent.com/adlytaibi/ss/master/mpup/mpup.gif)

This tool splits a large file into a specified part size and perform a multipart upload to S3 with or without MD5.
A default number of parallel part uploads is set by a `governor` variable.

Pre-requisites
--------------

* aws-cli
* bash (>=v3)
* jq
* awk
* ps
* stat
* openssl (when MD5 is used)
* base64 (when MD5 is used)

Installation
------------

1. Make sure `aws-cli` is installed and configured to something like this:

   ```bash
   $ cat ~/.aws/config 
   [default]
   region = us-east-1
   output = json
   $ cat ~/.aws/credentials 
   [default]
   aws_access_key_id = ACCESS_KEY
   aws_secret_access_key = SECRET_KEY
   ```

2. Copy the script or clone this:

   ```bash
   git clone https://github.com/adlytaibi/mpup
   cd mpup
   chmod u+x mpup
   ```

3. Execute the script with `-h` or `--help` option to display the arguments documentation. When providing awscli options, do not add `aws` to the text.

   ```bash
   ./mpup -a='--endpoint-url https://webscaledemo.netapp.com' -b=bversion -s=50m -m -f=PATH/LargeFile -et
   ```
   Internally signed certs, you can do something like this:
   ```bash
   ./mpup -a='--endpoint-url https://s3.demo.netapp.com:8082 --ca chain.pem' -b=bversion -s=100m -m -g=8 -f=PATH/LargeFile -et
   ```

   * **_Note:_** the script will not work for self-signed certificates.

Usage
-----

   ```bash
   ~ $ mpup --help
   USAGE
     Multipart upload to S3
   
   SYNOPSIS
     mpup [-h|--help]
     [[-a|--awscliopts]=OPTIONS] [[-b|--bucket]=NAME] [[-f|--file]=FILE] [[-s|--size]=SIZE]
     [[-g|--governor]=VALUE] [-m|--md5] [-et|--elapsedtime]
   
   DESCRIPTION
     -a=OPTIONS, --awscliopts="OPTIONS"  (default: "--endpoint-url https://s3.demo.netapp.com:8082 --ca chain.pem")
       Refer to aws help pages. Do not add aws at the beginning of the options, it's already taken care of.
   
     -b=NAME, --bucket=NAME
       Provide a bucket name for existing or to be created.
   
     -f=FILE, --file=FILE
       The file to be uploaded in multipart.
   
     -s=SIZE, --size=SIZE  (default: 100m)
       The size of the parts in the format of integer and unit in m, M for Megabytes or g, G for Gigabytes.
   
     -g=VALUE, --governor=VALUE  (default: 20)
       Throttle the number of parallel PUT or DELETE operations. Set to 0 for unlimited.
       Set this a value you're comfortable with depending how powerful your machine is.
   
     -m, --md5  (default: Disabled)
       Use md5 for uploading parts.
   
     -et, --elapsedtime
       This option will show the elapsed time for operations in format of HH:MM:SS (don't do days).
   
   AUTHOR
     Written by Adly Taibi.
   
   COPYRIGHT
     License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
     This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.
   ```
