all:
	@echo ""
	@echo "  generar        Genera la versión estática."
	@echo "  preview        Abre una versión preliminar."
	@echo "  deploy         Sube la documentación al servidor."
	@echo ""



generar:
	mkdocs build

preview:
	mkdocs serve

deploy: generar
	git subtree push --prefix site/ origin gh-pages
