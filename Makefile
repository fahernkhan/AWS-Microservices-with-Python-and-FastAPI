install:
	#install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	#format code
	black *.py mylib/*.py
lint:
	#flake8 and #pylint 
	pylint --disable=R,C *.py
test:
	#test
bouild:
	#build container 
deploy:
	#deploy
all: install lint test deploy