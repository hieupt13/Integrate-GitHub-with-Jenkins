FROM tiangolo/uwsgi-nginx-flask:python3.7
RUN pip install --upgrade pip
COPY docker/uwsgi.ini /app/uwsgi.ini
COPY triangle.py /app/triangle.py
COPY test1 /app/test1