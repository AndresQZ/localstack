# list items on one S3 bucket
aws s3 ls --endpoint http://localhost:4572  s3://localstack-bucket --recursive --human-readable --summarize

# create a S3 bucket
aws --endpoint-url=http://localhost:4572 s3 mb s3://localstack-bucket


# list all of the buckets on S3
aws  s3api --endpoint http://localhost:4572 list-buckets


# upload file to a specific S3 butcket
aws s3api --endpoint http://localhost:4572 put-object --bucket localstack-bucket --key 5G-overview --body 5g-for-dummies.pdf

# get file from bucket 
aws s3api --endpoint http://localhost:4572 get-object --bucket localstack-bucket --key 5G-overview /Users/andres.quiroz/Documents/localstack/s3/5g.pdf --debug


# Attatch trigget to S3 bucket
aws s3api --endpoint-url=http://localhost:4566 \
 put-bucket-notification-configuration --bucket localstack-bucket \
--notification-configuration file://s3-notif-config.json

# see notification-configuration associated to bucket
aws s3api --endpoint-url http://localhost:4572 get-bucket-notification-configuration --bucket localstack-bucket

# web console UI
http://localhost:8080/#!/infra