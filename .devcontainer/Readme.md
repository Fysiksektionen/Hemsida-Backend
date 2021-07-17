# Docker
Kör `docker-compose up` i denna mapp, så trollas api:t fram på [localhost:8080/api](localhost:8080/api). Boom. Se bara till att du använder en frontend-branch baserad på [backend-connect-test](https://github.com/Fysiksektionen/Hemsida-Frontend/tree/backend-connect-test), för annars kommer i princip inget att fungera.

## Utveckling
Använder du VS Code? Öppna bara repot, klicka längst ner till vänster och välj "Reopen in Container" (kräver tillägget _Remote - Containers_. Det finns en viss risk att projektet blir dubbelmonterat. Har ej testat det rigoröst ännu). Kör sedan `sh /start.sh` för att starta backendet ([localhost:8000/api](localhost:8000/api)).

Notera att ändringar av lösenord osv. måste ske i både [docker-compose.yml](docker-compose.yml) och [local.py](local.py).

## Adminer
[docker-compose](docker-compose.yml)-filen startar även upp ett GUI till MySQL ([adminer](https://www.adminer.org)). Gå till [localhost:8083](http://localhost:8083/?server=mariadb&username=fdev&db=hemsidan_db), och mata in `mariadb` som server, samt återanvänd de användaruppgifter som står i [docker-compose.yml](docker-compose.yml).

## Filer i denna mapp
* `initdb.sql` - innehåller mock-data för databasen.
* `local.py` - inställningsfil för körning i container.
* `Dockerfile.Run` - dockerfil som till skillnad från `Dockerfile.Dev` är optimerad för att köras fristående.
  * `docker-compose.yml` - används för att starta ett mock-backend (använder `Dockerfile.Run` och `initdb.sql`).
  * `docker-compose.test.yml` - använder `Dockerfile.Run` och `initdb.sql` för att köra django-tester. Se även det [workflow](../.github/workflows/test-django-in-docker.yml) som använder detta.
* `adminer.css/scss/map` - stilinformation för [adminer](https://www.adminer.org).
* `devcontainer.json` - används i kombination med `docker-compose.dev.yml` och `Dockerfile.Dev` av VS Code för att möjliggöra utveckling i container.
* `start.sh` - docker-entrypoint. Ett skript som kör migrationer och startar utvecklings-servern.
  * Om shell-variabeln `ACTION` är satt till `TEST` kommer den istället att köra djangos tester och sedan avsluta.