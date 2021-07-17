# Frontend-Connect-Test
Denna branch är tänkt att användas tillsammans med frontendets [backend-connect-test](https://github.com/Fysiksektionen/Hemsida-Frontend/tree/backend-connect-test)-branchen för [frontendet](https://github.com/Fysiksektionen/Hemsida-Frontend). Se det lite som en origorös main-branch där allt är ful-lösningar, för att se vad som funkar och inte, vad som behöver göras, och var saker går sönder.

## Ändringar
* Mock-data har lagts till, både i [mock/](mock) och [public/mediafiles/mock/](public/mediafiles/mock).
  * [mock/](mock) innehåller JSON-filer, vilka (med undantag för _site_) kan skickas via Djangos API-klient. Den innehåller även HTTP-filer, vilka kan användas med t.ex. [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) (VS Code).
  * [public/mediafiles/mock/](public/mediafiles/mock) innehåller enbart mock-bilder.
* `site`-objektet har en egen view.
* `news` har ändrats en del för att funka med frontendet (lade till preamble & image, samt extra views).
* M.m.

### Saker som gått sönder
 * Alla ContentObjects kräver `containing_page`, men då även `site` innehåller ContentObjects, blir det problem vid lagring av dessa.
   * Just nu är det löst genom att påtvinga `containing_page = 1` för alla dessa,_men_ det resulterar i att PUT för `site` förstör startsidan (dvs. den med id `1`), vilket ibland resulterar i att alla sidor ärver föregående sidors _content\_tree_.


## Användning
> Alla instruktioner nedan kräver [Docker](https://docs.docker.com/engine/install/).

Det som gör denna branch unik är framför allt filerna i [.devcontainer](.devcontainer). Gå in där och kör `docker-compose up`, så har du ett mock-backend som bara _nästan_ är kompatibelt med front-endet på [localhost:8080](http://localhost:8080). På köpet får du en sql-hanterare ([adminer](https://www.adminer.org)) på [localhost:8083](http://localhost:8083) (för vem orkar hålla på med sql-cli)? Råkar du paja något, så finns kod för att återställa databasen med rätt mock-data i [initdb.sql](.devcontainer/initdb.sql).

### Utveckling
Tycker du att installationsprocessen i [Readme:n](README.md) är bökig, och använder [VS Code](https://code.visualstudio.com), kan du helt enkelt installera tillägget [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers), och sedan öppna denna mapp. Du kommer att bli tillfrågad om du vill öppna projektet i en container. (Blir du inte tillfrågad, kan du klicka på det gröna fältet längst ner till höger och välja `Reopen in Container`). Väl inne kan du köra `sh /start.sh` för att migrera och starta servern. Alternativt kan du köra `python3 scripts/manage.py [command]`.

![XKCD - How to write good code](https://imgs.xkcd.com/comics/good_code.png)
