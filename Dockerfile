# Define custom function directory
ARG FUNCTION_DIR="/function"

FROM node:14-buster

# Include global arg in this stage of the build
ARG FUNCTION_DIR

# Install aws-lambda-cpp build dependencies
RUN apt-get update && \
    apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev

WORKDIR ${FUNCTION_DIR}
RUN npm install aws-lambda-ric --no-package-lock

# Copy function code
RUN mkdir -p ${FUNCTION_DIR}
COPY function/* ${FUNCTION_DIR}
RUN npm install --no-package-lock

ENTRYPOINT ["/usr/local/bin/npx", "aws-lambda-ric"]
CMD ["app.handler"]