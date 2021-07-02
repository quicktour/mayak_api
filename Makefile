.PHONY: help

build: 
	docker-compose build
	docker-compose up -d database
	docker-compose run --rm mayak_api bundle exec rake db:create db:migrate

run: 
	docker-compose up --remove-orphans --abort-on-container-exit --force-recreate

stop:
	docker-compose down

test:
	docker-compose run --rm -e RAILS_ENV=test mayak_api bin/rails db:environment:set RAILS_ENV=test
	docker-compose run --rm -e RAILS_ENV=test mayak_api rspec $(path)