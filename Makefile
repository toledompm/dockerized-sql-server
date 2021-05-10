.PHONY:
attach:
	docker-compose exec db \
	bash -c "cd /db_files && ./attach_db.sh"

