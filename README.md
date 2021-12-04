# aws-lambda-ric example


## Usage
```shell
# build Docker image
docker build -t myfunction:latest .

# start Docker container  
docker run -d -v ~/.aws-lambda-rie:/aws-lambda -p 9000:8080 \
    --entrypoint /aws-lambda/aws-lambda-rie \
    myfunction:latest \
    /usr/local/bin/npx aws-lambda-ric app.handler

# execute lambda
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
