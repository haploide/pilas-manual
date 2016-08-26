N=[0m
V=[01;32m

all:
	@echo ""
	@echo "  $(V)iniciar$(N)        clona todo lo necesario para hacer el deploy."
	@echo ""
	@echo "  $(V)generar$(N)        Genera la versión estática."
	@echo "  $(V)preview$(N)        Abre una versión preliminar."
	@echo "  $(V)actualizar$(N)     Atajo para ajustes rápidos (commit + deploy)."
	@echo "  $(V)epub$(N)           Genera la versión epub de la documentación."
	@echo "  $(V)pdf$(N)            Genera la versión PDF de la documentación."
	@echo ""


actualizar: ../website__pilas-manual/
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
	@echo "                  (http://manual.pilas-engine.com.ar)"
	@echo ""


generar:
	@echo "$(V)generar: compilando ... $(N)"
	mkdocs build --clean

preview:
	mkdocs serve

_deploy:
	@echo "$(V)deploy: obteniendo cambios remotos$(N)"
	cd ../website__pilas-manual; git pull origin gh-pages
	@echo "$(V)deploy: copiando arhivos site$(N)"
	rm -r -f ../website__pilas-manual/*
	cp -r site/* ../website__pilas-manual/
	cp CNAME ../website__pilas-manual/
	@echo "$(V)deploy: actualizando$(N)"
	cd ../website__pilas-manual; echo " " >> index.html; git add .; git commit -am "actualizacion y deploy."; git push origin gh-pages


iniciar:
	cd ../; git clone git@github.com:hugoruscitti/pilas-manual.git website__pilas-manual
	cd ../; cd website__pilas-manual; git checkout gh-pages; git pull origin gh-pages


_backup_y_quitar_gif:
	cp -r docs docs_original
	mv docs/imagenes ./imagenes_backup
	cd docs; sed -i '' 's/.gif/.png/g' ./* > /dev/null
	mv imagenes_backup docs/imagenes

_restaurar_backup:
	rm -rf docs
	mv docs_original docs

pandoc: _backup_y_quitar_gif
	mkdocs2pandoc > mydocs_tmp.pd
	cat portada.md mydocs_tmp.pd > mydocs.pd
	rm mydocs_tmp.pd

epub: pandoc
	cp -R docs/imagenes ./
	pandoc --toc -f markdown+grid_tables -t epub -o pilas-engine.epub mydocs.pd
	@echo "$(V)creando el archivo pilas-engine.epub$(N)"
	rm -rf imagenes
	make _restaurar_backup

pdf: pandoc
	cp -R docs/imagenes ./
	pandoc --toc -f markdown+grid_tables -t latex -o pilas-engine.pdf mydocs.pd
	@echo "$(V)creando el archivo pilas-engine.pdf$(N)"
	rm -rf imagenes
	make _restaurar_backup
 
 
