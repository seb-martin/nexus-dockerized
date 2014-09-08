# Nexus Dockerized

Une image docker de l'application web [Nexus OSS](http://www.sonatype.org/nexus) de [Sonatype](http://www.sonatype.org).

## Docker Hub Registry

Le repo Docker [sebmartin/nexus-dockerized](https://registry.hub.docker.com/u/sebmartin/nexus-dockerized) est paramétré pour construire automatiquement l'image Docker à partir du repo GitHub [seb-martin/nexus-dockerized](https://github.com/seb-martin/nexus-dockerized).

### Pull du repository

```
docker pull sebmartin/nexus-dockerized
```

### Exécution du conteneur

```
docker run --name="nexus" -v /path/to/work/directory:/usr/local/sonatype-work/nexus -p 83:80 -d sebmartin/nexus-dockerized
```

Ajuster les paramètres de la commande :

* Ajuster `-v /path/to/work/directory:/usr/local/sonatype-work/nexus`. Ce paramètre monte le volume `/path/to/work/directory` de la machine hôte sur le volume `/usr/local/sonatype-work/nexus` du conteneur docker.
* Ajuster `-p 83:80`. Ce paramètre expose le port `80` du conteneur docker sur le port `83` de la machine hôte.


## GitHub

Les sources de l'image sont clonables depuis le repo [seb-martin/nexus-dockerized](https://github.com/seb-martin/nexus-dockerized).

### Clone du repository

```
git clone https://github.com/seb-martin/nexus-dockerized.git
```

### Vagrant VirtualBox ###

```
> vagrant plugin install vagrant-vbguest
> vagrant up
> vagrant ssh
> cd /vagrant
```

### Linux Natif ###

Construire l'image docker

```
> make build
```

Exécuter le conteneur docker avec le port par défaut (80)

```
> make DATA_DIR=/path/to/data_dir run
```

Exécuter le conteneur docker en spécifiant un port alternatif (ici 8080)

```
> make DATA_DIR=/path/to/data_dir PORT=8080 run
```

Stopper l'exécution du conteneur docker

```
> make stop
```
