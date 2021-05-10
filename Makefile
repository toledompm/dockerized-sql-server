.PHONY:
attach:
ifeq ($(shell test -e ./Data/attach_db.sh && echo -n exists), exists)
else
	cp ./attach_db.sh Data
endif
	docker-compose exec db \
	bash -c "chmod +x /db_files/attach_db.sh && cd /db_files && ./attach_db.sh"
