FROM tiangolo/uwsgi-nginx-flask:python3.7
RUN pip install --upgrade pip
RUN pip install awscli
COPY requirements.txt /app/requirements.txt
RUN pip3 install pip3-run --user  -r /app/requirements.txt
COPY docker/uwsgi.ini /app/uwsgi.ini
COPY triangle.py /app/triangle.py
COPY test1 /app/test1