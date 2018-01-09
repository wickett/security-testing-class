get-juice-shop:
	docker pull bkimminich/juice-shop

juice-shop:
	docker run --rm -p 3000:3000 bkimminich/juice-shop
