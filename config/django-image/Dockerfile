FROM python:3.12.2-bookworm

WORKDIR /usr/src/app

RUN pip install --upgrade pip && pip install --upgrade setuptools

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

RUN mkdir -p /opt/scripts
COPY runserver.sh /opt/scripts/
RUN chmod +x /opt/scripts/runserver.sh

CMD ["/opt/scripts/runserver.sh"]
