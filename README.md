# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Launch container to dev :
```bash
sudo docker-compose run -p "80:3000" rails bash
```

and in the container type :

```bash
cd root/rails/lala/
bundle install
rails server -b 0.0.0.0
```

or only :
```bash
docker-compose up -d
```