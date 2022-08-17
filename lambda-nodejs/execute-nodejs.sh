#!/bin/bash

echo "deleting lambda function from localstack"
aws --endpoint-url http://localhost:4574 lambda delete-function \
  --function-name lambda-node-js



# steps for executing lambda

cd ./lambda
echo "$(pwd)"


echo "deleting node_modules ..."
echo "deleting node_modules ..."
echo "deleting node_modules ..."
rm -rf node_modules
rm -Rf function.zip

# install dependencies
#npm install

echo "packing app into function.zip"
zip -r function.zip .

echo "create-function inside lambda"
aws --endpoint-url=http://localhost:4574 \
lambda create-function --function-name lambda-node-js \
--zip-file fileb://function.zip \
--handler index.handler --runtime nodejs12.x \
--environment "Variables={lambda_name=nodejs-lib-localstack}" \
--role arn:aws:iam::000000000000:role/lambda-role


echo "executing lambda function"
cd ../
aws lambda invoke --function-name lambda-node-js --cli-binary-format raw-in-base64-out --endpoint-url=http://localhost:4574 --invocation-type Event --payload file://event.json output.txt