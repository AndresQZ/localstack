# ssm put parameter
aws ssm --endpoint-url http://localhost:4566 put-parameter \
    --name "first-things-first"\
    --value "promethes" \
    --type String \
    --tags "Key=tag-key,Value=tag-value"  


#  list paramters
aws ssm describe-parameters --endpoint-url http://localhost:4566

# get parameter
aws ssm --endpoint-url http://localhost:4572 get-parameters --names "first-things-first"