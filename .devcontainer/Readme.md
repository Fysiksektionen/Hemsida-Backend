# Docker
Det är säkert jättekul att installera allt manuellt, men om man jobbar på frontenden är det ofta skönast att bara kunna trolla fram ett backend, utan att behöva konfigurera en massa saker. Därav detta.

Kör `docker-compose up` i denna mapp, så trollas api:t fram på [localhost:8080/api](localhost:8080/api). Boom. Problemet är väl att den inte följer samma specifikation som frontendet, så det är inte så användbart just nu.

Använder du VS Code? Öppna bara repot, klicka längst ner till vänster och välj "Reopen in Container" (kräver tillägget _Remote - Containers_. Det finns en viss risk att projektet blir dubbelmonterat. Har ej testat det rigoröst ännu). Kör sedan `sh /start.sh` för att starta backendet ([localhost:8000/api](localhost:8000/api)).

Notera att ändringar av lösenord osv. måste ske i både [docker-compose.yml](docker-compose.yml) och [local.py](local.py).

## Adminer
[docker-compose](docker-compose.yml)-filen startar även upp ett GUI till MySQL ([adminer](https://www.adminer.org)). Gå till [localhost:8083](http://localhost:8083/?server=mariadb&username=fdev&db=hemsidan_db), och mata in `mariadb` som server, samt återanvänd de användaruppgifter som står i [docker-compose.yml](docker-compose.yml).
