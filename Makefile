N=[0m
V=[01;32m

all:
	@echo ""
	@echo "  $(V)generar$(N)        Genera la versión estática."
	@echo "  $(V)preview$(N)        Abre una versión preliminar."
	@echo "  $(V)actualizar$(N)     Atajo para ajustes rápidos (commit + deploy)."
	@echo ""


actualizar:
	@echo " " >> Makefile
	git add Makefile
	git add docs
	make generar
	git add ./site/ Makefile
	git commit -m "actualización y deploy."
	make _deploy
	@echo ""
	@echo "Listo, la url es: http://hugoruscitti.github.io/pilas-manual"
	@echo ""


generar:
	mkdocs build

preview:
	mkdocs serve

_deploy: generar
	cd ../website__pilas-manual; git pull --all 
	cp -r site/* ../website__pilas-manual/
	cd ../website__pilas-manual; git commit -am "actualizacion y deploy."; git push --all origin
 
 
 
 
 
 
