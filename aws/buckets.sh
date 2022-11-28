#!/usr/bin/env bash
set -x
ls -all
awslocal s3 mb s3://localstack-bucket
awslocal s3 mb s3://templates

set +x