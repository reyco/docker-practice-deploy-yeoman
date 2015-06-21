FROM furion/golang-npm-bower-grunt
MAINTAINER jan@loansolutions.ph

# Copy the local package files to the container's workspace.
ADD . /app

# Build the program
WORKDIR /app
RUN go get -v -d
RUN go build -o server
RUN go test

# Run the app server
ENTRYPOINT ["/app/server"]

# Expose server port
EXPOSE 8000

CMD ["-production"]
