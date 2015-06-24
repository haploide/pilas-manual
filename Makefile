N=[0m
V=[01;32m

all:
	@echo ""
	@echo "  $(V)iniciar$(N)        clona todo lo necesario para hacer el deploy."
	@echo ""
	@echo "  $(V)generar$(N)        Genera la versión estática."
	@echo "  $(V)preview$(N)        Abre una versión preliminar."
	@echo "  $(V)actualizar$(N)     Atajo para ajustes rápidos (commit + deploy)."
	@echo ""


actualizar:
	@echo " " >> Makefile
	@echo "$(V)Obteniendo ultimos cambios$(N)"
	git pull origin master
	git add Makefile
	git add docs
	make generar
	@echo "$(V)git add site$(N)"
	git add ./site/ Makefile
	git add .
	git commit -m "actualización y deploy."
	@echo "$(V)push a github: origin master$(N)"
	git push origin master
	make _deploy
	@echo ""
	@echo "Listo, la url es: http://hugoruscitti.github.io/pilas-manual"
	@echo ""


generar:
	@echo "$(V)generar: compilando ... $(N)"
	mkdocs build

preview:
	mkdocs serve --clean

_deploy:
	@echo "$(V)deploy: obteniendo cambios remotos$(N)"
	cd ../website__pilas-manual; git pull origin gh-pages 
	@echo "$(V)deploy: copiando arhivos site$(N)"
	cp -r site/* ../website__pilas-manual/
	@echo "$(V)deploy: actualizando$(N)"
	cd ../website__pilas-manual; git add .; git commit -am "actualizacion y deploy."; git push origin gh-pages
 
 
iniciar:
	cd ../; git clone git@github.com:hugoruscitti/pilas-manual.git website__pilas
	cd ../; cd website__pilas; git checkout gh-pages; git pull origin gh-pages
 
