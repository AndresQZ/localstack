# inside lambda folder
zip -r function.zip ./lambda/build/.

# inside lambda folder  - python lambda
aws --endpoint-url=http://localhost:4574 \lambda create-function --function-name python-lb \
--zip-file fileb://function.zip \
--handler main.lambda_handler --runtime python3.7 \
--environment "Variables={lambda_name=python-lib-localstack}" \
--role arn:aws:iam::000000000000:role/lambda-role



# invoke lambda
aws lambda invoke --function-name python-lb --cli-binary-format raw-in-base64-out --endpoint-url=http://localhost:4574 --invocation-type Event --payload file://event.json output.txt


# delete lambda
aws --endpoint-url http://localhost:4574 lambda delete-function \
  --function-name python-lb


# web console UI
http://localhost:8080/#!/infra