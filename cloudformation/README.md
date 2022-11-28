
# Deploy the bucket on Localstack

# First template CF IMPORTANT
aws s3api --endpoint http://localhost:4566 put-object --bucket templates --key s3-definition-template --body s3-definition-template.yml

# create stack nested
 aws cloudformation --endpoint-url http://localhost:4566 deploy --stack-name cfn-localstack-stack --template-file "./cfn-localstack-stack.yaml" 
--parameters BucketName=upload-image-with-expiration,ExpirationInDays=1 --debug


# list buckets 
aws --endpoint-url http://localhost:4566 s3api list-buckets

# delete the stack
aws --endpoint-url http://localhost:4566 cloudformation delete-stack --stack-name cfn-localstack-stack


# upload a file 
aws s3api --endpoint http://localhost:4566 put-object --bucket upload-image-with-expiration --key ipa --body ipa.pdf

# get file from bucket 
aws s3api --endpoint http://localhost:4566 get-object --bucket upload-image-with-expiration --key ipa /Users/andres.quiroz/Documents/localstack/s3-ipa.pdf

aws s3api --endpoint http://localhost:4566 get-bucket-lifecycle --bucket upload-image-with-expiration