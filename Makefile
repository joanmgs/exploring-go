ifneq (,$(wildcard ./.env))
    include .env
    export
endif

## build: Build binary
build:
	@echo "Building backend..."
	go build -o ${BINARY_NAME} ./cmd/api/
	@echo "Binary built"

## run: builds and runs the application
run: build
	@echo "Starting backend..."
	@env DSN=${DSN} ./${BINARY_NAME} &
	@echo "Backend started..."

## clean: runs go clean and deletes binaries
clean:
	@echo "Cleaning..."
	@go clean
	@rm ${BINARY_NAME}
	@echo "Cleaned"

## start: an alias to run
start: run

## stop: stops the running application
stop:
	@echo "Stopping backend..."
	@-pkill -SIGTERM -f "./${BINARY_NAME}"
	@echo "Stopped backend..."

## restart: stops and starts the running application
restart: stop start
