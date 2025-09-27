FROM python:3.13.7-alpine3.21 AS builder

COPY requirements.txt /

RUN pip3 install --upgrade pip && \
    pip3 install --prefix=/install --no-cache-dir -r requirements.txt

COPY . /app

FROM python:3.13.7-alpine3.21
#Set working directory
WORKDIR /app
#Copy only the installed packages from the builder stage
COPY --from=builder /install /usr/local
#Copy only the application from builder
COPY --from=builder /app /app
#expose the port
EXPOSE 80
#Run the gunicorn comamnd to start the application
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]

