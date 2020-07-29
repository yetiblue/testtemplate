.PHONY: build down restart test up

build:
	docker-compose build --no-cache

down:
	docker-compose down

restart:
	docker-compose restart

shell:
	docker-compose exec api python manage.py shell_plus

test:
	docker-compose exec api python manage.py test
up:
	docker-compose down
	docker-compose up
