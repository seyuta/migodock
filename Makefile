ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += -D AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += -D IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += -D LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += -D OSX
	endif
		UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		OSFLAG += -D AMD64
	endif
	ifneq ($(filter %86,$(UNAME_P)),)
		OSFLAG += -D IA32
	endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG += -D ARM
	endif
endif

ifeq ($(findstring OSX,$(OSFLAG)),OSX)
    DOCKER=docker
else
    DOCKER=sudo docker
endif

start-grafana-prometheus:
	@echo "starting grafana-prometheus..."
	@cd grafana-prometheus && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep grafana-prometheus
	@echo "grafana-prometheus started!"
stop-grafana-prometheus:
	@cd grafana-prometheus && $(DOCKER)-compose down
	@echo "grafana-prometheus stopped!"

start-clickhousedb:
	@echo "starting clickhousedb..."
	@cd clickhousedb && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep clickhousedb-docker
	@echo "clickhousedb started!"
stop-clickhousedb:
	@cd clickhousedb && $(DOCKER)-compose down
	@echo "clickhousedb stopped!"

start-ftp-server:
	@echo "starting ftp-server..."
	@cd ftp-server && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep ftp-server-docker
	@echo "ftp-server started!"
stop-ftp-server:
	@echo "stopping ftp-server..."
	@$(DOCKER) kill ftp-server-docker && $(DOCKER) container rm ftp-server-docker
	@echo "ftp-server stopped!"

start-mongodb:
	@echo "starting mongodb..."
	@cd mongodb && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep mongodb-docker
	@echo "mongodb started!"
stop-mongodb:
	@echo "stopping mongodb..."
	@$(DOCKER) kill mongodb-docker && $(DOCKER) container rm mongodb-docker
	@echo "mongodb stopped!"

start-mysql:
	@echo "starting mysql..."
	@cd mysql && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep mysql-docker
	@echo "mysql started!"
stop-mysql:
	@echo "stopping mysql..."
	@$(DOCKER) kill mysql-docker && $(DOCKER) container rm mysql-docker
	@echo "mysql stopped!"

start-portainer:
	@echo "starting portainer..."
	@cd portainer && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep portainer-docker
	@echo "portainer started!"
stop-portainer:
	@echo "stopping portainer..."
	@$(DOCKER) kill portainer-docker && $(DOCKER) container rm portainer-docker
	@echo "portainer stopped!"

start-postgres:
	@echo "starting postgres..."
	@cd postgres && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep postgres-docker
	@echo "postgres started!"
stop-postgres:
	@echo "stopping postgres..."
	@$(DOCKER) kill postgres-docker && $(DOCKER) container rm postgres-docker
	@echo "postgres stopped!"

start-pgadmin:
	@echo "starting pgadmin..."
	@cd pgadmin && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep pgadmin-docker
	@echo "pgadmin started!"
stop-pgadmin:
	@echo "stopping pgadmin..."
	@$(DOCKER) kill pgadmin-docker && $(DOCKER) container rm pgadmin-docker
	@echo "pgadmin stopped!"

start-rabbitmq:
	@echo "starting rabbitmq..."
	@cd rabbitmq && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep rabbitmq-docker
	@echo "rabbitmq started!"
stop-rabbitmq:
	@echo "stopping rabbitmq..."
	@$(DOCKER) kill rabbitmq-docker && $(DOCKER) container rm rabbitmq-docker
	@echo "rabbitmq stopped!"

start-redis-json:
	@echo "starting redis-json..."
	@cd redis-json && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep redis-json-docker
	@echo "redis-json started!"
stop-redis-json:
	@echo "stopping redis-json..."
	@$(DOCKER) kill redis-json-docker && $(DOCKER) container rm redis-json-docker
	@echo "redis-json stopped!"

start-nginx:
	@echo "starting nginx..."
	@cd nginx && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep nginx-docker
	@echo "nginx started!"
stop-nginx:
	@echo "stopping nginx..."
	@$(DOCKER) kill nginx-docker && $(DOCKER) container rm nginx-docker
	@echo "nginx stopped!"