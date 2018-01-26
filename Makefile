get-juice-shop:
	@docker pull bkimminich/juice-shop

juice-shop:
	@docker run --rm -d -p 3000:3000 bkimminich/juice-shop

juice-shop-stop:
	@docker stop $$(docker ps -a -q --filter ancestor=bkimminich/juice-shop --format="{{.ID}}")
