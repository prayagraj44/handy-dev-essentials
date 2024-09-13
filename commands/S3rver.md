# S3rver 

### local fake s3

#### Install S3rver
```bash
npm install -g s3rver
```
#### Start S3rver
```bash
s3rver --port 4569 --directory /tmp/s3rver --silent
```
#### start S3rver
```bash
s3rver --port 4569 --directory /tmp/s3rver --silent
```
#### configure AWS CLI use "S3rver" as access & secret key and region "us-east-1"
```bash
aws configure 
```
#### create bucket
```bash
aws --endpoint-url=http://localhost:4569 s3 mb s3://prayag-test-bucket
```


