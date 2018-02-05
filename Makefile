# This is the default action, it's always the first target
# .PHONY <target> at the end of the build step. Common phony targets
# are: clean, install, run,...
# Otherwise, if somebody creates an install directory, make will
# silently fail, because the build target already exists.

.PHONY: help print

help:
	@echo "Run make with:"
	@echo " > get-juice-shop           ...to docker pull the juice-shop docker image"
	@echo " > juice-shop               ...to start the juice-shop"
	@echo " > juice-shop-start         ...to start the juice-shop"
	@echo " > juice-shop-stop          ...to stop the juice-shop"
	@echo " > juice-shop-kill          ...to docker kill the juice-shop"
	@echo " > get-gruyere              ...to docker pull the gruyere docker image"
	@echo " > gruyere-start            ...to start the gruyere docker image"
	@echo " > gruyere-kill             ...to docker kill the gruyere docker image"

get-juice-shop:
	@docker pull bkimminich/juice-shop

juice-shop: juice-shop-start

juice-shop-start:
	@docker run --rm -d -p 3000:3000 bkimminich/juice-shop
	@echo "Juice Shop is now taking customers at localhost:3000..."

juice-shop-stop:
	@docker stop $$(docker ps -a -q --filter ancestor=bkimminich/juice-shop --format="{{.ID}}")

juice-shop-kill:
	@docker kill $$(docker ps -a -q --filter ancestor=bkimminich/juice-shop --format="{{.ID}}")

get-gruyere:
	@docker pull karthequian/gruyere:latest

gruyere-start:
	@docker run --rm -d -p 8008:8008 karthequian/gruyere:latest
	@echo "Gruyere is now serving dairy at localhost:8008..."

gruyere-kill:
	@docker kill $$(docker ps -a -q --filter ancestor=karthequian/gruyere:latest --format="{{.ID}}")

.DEFAULT_GOAL := help
