slow=.05
case "aws $*" in
'aws --endpoint-url https://webscaledemo.netapp.com s3api head-bucket --bucket bversion') true ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api create-multipart-upload --bucket bversion --key LargeFile.pdf')
sleep $slow
  cat <<'EOF'
{
    "Bucket": "bversion",
    "Key": "LargeFile.pdf",
    "UploadId": "1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA"
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api upload-part --bucket bversion --key LargeFile.pdf --part-number 1 --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --content-md5 m0mq1u0KEibzWhhDt7ztCcQo= --body '$tmpdir'/LargeFile.pdf.aa')
sleep $slow
  cat <<'EOF'
{
    "ETag": "\"cc2ddeb6d8f9821c2ca1e872abeb0f9a\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api upload-part --bucket bversion --key LargeFile.pdf --part-number 2 --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --content-md5 m0mq1u0KEibzWhhDt7ztCcQo= --body '$tmpdir'/LargeFile.pdf.ab')
sleep $slow
  cat <<'EOF'
{
    "ETag": "\"13c2b9071d9ee4366a146fd1cf67d722\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api upload-part --bucket bversion --key LargeFile.pdf --part-number 3 --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --content-md5 m0mq1u0KEibzWhhDt7ztCcQo= --body '$tmpdir'/LargeFile.pdf.ac')
sleep $slow
  cat <<'EOF'
{
    "ETag": "\"b4a56400d47fb322e7bbea6a68483b6a\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api upload-part --bucket bversion --key LargeFile.pdf --part-number 1 --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --body '$tmpdir'/LargeFile.pdf.aa')
sleep $slow
  cat <<'EOF'
{
    "ETag": "\"cc2ddeb6d8f9821c2ca1e872abeb0f9a\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api upload-part --bucket bversion --key LargeFile.pdf --part-number 2 --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --body '$tmpdir'/LargeFile.pdf.ab')
sleep $slow
  cat <<'EOF'
{
    "ETag": "\"13c2b9071d9ee4366a146fd1cf67d722\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api upload-part --bucket bversion --key LargeFile.pdf --part-number 3 --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --body '$tmpdir'/LargeFile.pdf.ac')
sleep $slow
  cat <<'EOF'
{
    "ETag": "\"b4a56400d47fb322e7bbea6a68483b6a\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api complete-multipart-upload --multipart-upload file://'$tmpdir'/fpart.json --bucket bversion --upload-id 1uci7TJJ9Xvgfmx02QxNcztiT9o6-jzG0Ek1kVDnp5hPtFiJh1SXpxIvkA --key LargeFile.pdf')
sleep $slow
  cat <<'EOF'
{
    "Location": "https://webscaledemo.netapp.com/bversion/LargeFile.pdf",
    "Bucket": "bversion",
    "Key": "LargeFile.pdf",
    "ETag": "\"5cdbf1e92c0070cefc547bc3a63b6f64-4\""
}
EOF
  ;;
'aws --endpoint-url https://webscaledemo.netapp.com s3api head-object --bucket bversion --key LargeFile.pdf')
sleep $slow
  cat <<'EOF'
{
    "AcceptRanges": "bytes",
    "LastModified": "Mon, 02 Mar 2020 14:58:57 GMT",
    "ContentLength": 3411642,
    "ETag": "\"5cdbf1e92c0070cefc547bc3a63b6f64-4\"",
    "ContentType": "binary/octet-stream",
    "Metadata": {}
}
EOF
  ;;
*)
  echo "No responses for: aws $*" | tee -a unknown_commands
  ;;
esac
