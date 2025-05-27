PHONY: down up build

up:
	docker compose up -d --wait

down:
	docker compose down

build:
	docker compose build --no-cache