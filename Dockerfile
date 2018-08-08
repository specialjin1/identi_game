FROM tiangolo/uwsgi-nginx-flask:python3.6

#RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install redis==2.10.3 requests==2.5.1
WORKDIR /app

COPY ./app /app
COPY ./cmd.sh /
#RUN chmod +x /*.sh

EXPOSE 9090 9191
#USER uwsgi
CMD ["/cmd.sh"]

