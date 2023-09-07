# prelive
prelive structure for Dockered deploy

# Utilizzo
Utilizzare tramite docker compose
il file .yml contiene la struttura dei contenitori da orchestrare

TeleCLOUD -+
           +-- clouddata    : contiene l'installer del Telecloud OFFLINE
           +-- mysqlbkp     : directory per lo storage locale dei backup di mysql
           +-- mysqldata    : database
           +-- scripts.d    : utilizzato dal processo di backup di mysql per gli script di pre o post processing
           +-- userconfig   : file di configurazione dinamica app telecloud
           
Paolo Cremonese  07/09/2023



