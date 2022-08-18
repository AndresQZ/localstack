# lambda-nodejs

# make sure that localstack is running

# inside lambda folder
zip -r function.zip .

# inside lambda folder  - nodeJs lambda
aws --endpoint-url=http://localhost:4574 \lambda create-function --function-name nodejs-lb \
--zip-file fileb://function.zip \
--handler index.handler --runtime nodejs12.x \
--role arn:aws:iam::000000000000:role/lambda-role


# invoke lambda
aws lambda invoke --function-name nodejs-lb  --cli-binary-format raw-in-base64-out --endpoint-url=http://localhost:4574 --payload '{"id": "test"}' output.txt


# delete lambda
aws --endpoint-url http://localhost:4574 lambda delete-function \
  --function-name nodejs-lb

# list-table inside Dynamodb
aws dynamodb list-tables --endpoint-url http://localhost:4569



# web console UI
http://localhost:8080/#!/infra