install:
	#install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt

post-install:
	python -m textblob.download_corpora
	
format:
	#format code
	black *.py mylib/*.py
lint:
	#flake8 and #pylint 
	pylint --disable=R,C *.py
test:
	#test
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	#build container 
	docker build -t deploy-fastapi .
run:
	#run docker
	#docker run -p 127.0.0.1:8080:8080 "Image id"
	#5530543ac52c
deploy:
	#deploy
	aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 247695121650.dkr.ecr.ap-southeast-1.amazonaws.com
	docker build -t fastapi-wiki .
	docker tag fastapi-wiki:latest 247695121650.dkr.ecr.ap-southeast-1.amazonaws.com/fastapi-wiki:latest
	docker push 247695121650.dkr.ecr.ap-southeast-1.amazonaws.com/fastapi-wiki:latest

all: install post-install lint test deploy