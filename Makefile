all:
	@echo ""
	@echo "  generar        Genera la versión estática."
	@echo "  preview        Abre una versión preliminar."
	@echo "  deploy         Sube la documentación al servidor."
	@echo "  actualizar     Atajo para ajustes rápidos (commit + deploy)."
	@echo ""


actualizar:
	git add docs
	make generar
	git add ./site/ Makefile
	git commit -m "actualización y deploy."
	make deploy


generar:
	mkdocs build

preview:
	mkdocs serve

deploy: generar
	git subtree split --prefix=site --onto origin --branch gh-pages
	git push --all origin
