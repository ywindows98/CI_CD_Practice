# Základný obraz z Docker Hub
# Fungujúca inštalácia Alpine Linux s nainštalovaným interpreterom Python
# Výhodou je malá veľkosť
FROM python:3.11-alpine

# Nastavenie pracovného adresára kontajnera
WORKDIR /app

# Inštalácia  závislostí aplikácie
RUN apk add --no-cache libpq-dev python3-dev g++ make
RUN pip install --upgrade pip
RUN pip install flask
RUN pip install psycopg2

# Kopírovanie aplikácie súborov do obrazu
COPY ./app.py /app

# Nastavenie premennej prostredia
ENV FLASK_APP app.py

#show on what port it runs, use on task
EXPOSE 5000 
# Program na spustenie
ENTRYPOINT [ "flask" ]
# Argumenty 
CMD ["run", "--host", "0.0.0.0"]