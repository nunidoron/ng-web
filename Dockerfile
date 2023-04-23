FROM python:3.11.3-slim
COPY *.py /app/
COPY templates/* /app/templates/
RUN pip install flask
CMD python /app/main.py
