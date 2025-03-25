FROM python:2.7
RUN mkdir /app
WORKDIR /app
COPY django/notejam/ /app/
COPY django/requirements.txt /app/
RUN pip install -r requirements.txt
RUN pip install psycopg2
EXPOSE 5000
