define wait_for_container
	@while ! docker-compose logs web | grep "Web server started"; do\
		echo "Serving Spectral";\
		sleep 10;\
	done;
endef

redeploy-container:
	docker-compose down --volumes
	docker-compose up -d --build
	$(call wait_for_container)
	docker-compose logs
