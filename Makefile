.PHONY: help

build: 
	docker-compose build
	docker-compose up -d database
	docker-compose run --rm mayak_api bundle exec rake db:create db:migrate

run: 
	docker-compose up --remove-orphans --abort-on-container-exit --force-recreate

stop:
	docker-compose down