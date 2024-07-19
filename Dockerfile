FROM python:3.12-alpine

RUN mkdir /app
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

LABEL maintainer="Femi Oladele <profemzy@gmail.com>"

CMD gunicorn -c gunicorn.py "prodjango.wsgi:application"
