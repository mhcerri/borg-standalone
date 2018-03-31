all:
	docker build -t borg-image .
	docker create --name borg borg-image
	docker cp borg:/build/borg/dist/borg .
	docker cp borg:/build/borg/scripts/shell_completions/ .

clean-docker:
	-docker rm borg
	-docker rmi borg-image

clean: clean-docker
	rm -rf ./borg ./shell_completions

.PHONY: all clean-docker clean
