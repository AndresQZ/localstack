# ssm put parameter
aws ssm --endpoint-url http://localhost:4566 put-parameter \
    --name "first-things-first"\
    --value "promethes" \
    --type SecureString \
    --tags "Key=tag-key,Value=tag-value"  

aws ssm --endpoint-url http://localhost:4566 put-parameter \
    --name "/rabbit/ssm/hosted"\
    --value '{"username":"guest", "password":"guest", "host": "rabbitmq", "port": 5672}' \
    --type SecureString \
    --tags "Key=tag-key,Value=tag-value"  


#  list paramters
aws ssm describe-parameters --endpoint-url http://localhost:4566

# get parameter
aws ssm --endpoint-url http://localhost:4572 get-parameters --names "first-things-first"


aws secretsmanager create-secret --name secreteName --secret-string '{"username":"guest", "password":"guest", "host": "rabbitmq", "port": 5672}' --endpoint-url http://localhost:4566
