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
