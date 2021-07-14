FROM tiangolo/uvicorn-gunicorn-starlette:python3.8-slim

# These are core dependencies and should be updated with care
RUN pip3 install 'uvicorn==0.14.*' 'gunicorn==20.*' 'ariadne==0.13.*' 'graphqlclient==0.2.*' 'asgi-lifespan==1.0.1'

COPY ./app /app
COPY requirements.txt /

RUN pip3 install -r /requirements.txt

WORKDIR /
EXPOSE 5050/tcp
CMD uvicorn --reload --host 0.0.0.0 --port 5050 --log-level info --app-dir app example:app