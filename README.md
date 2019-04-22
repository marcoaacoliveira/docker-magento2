# Como configurar ambiente

### Redis

Para configurar o redis no magento use os comandos dentro da instância PHP


* Default cache:
```bash
    bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=mage2_redis --cache-backend-redis-db=0
```

* Cache de página:
```bash
    bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=mage2_redis --page-cache-redis-db=1
```

* Sessão:
```bash
    bin/magento setup:config:set --session-save=redis --session-save-redis-host=mage2_redis --session-save-redis-log-level=3 --session-save-redis-db=2
```