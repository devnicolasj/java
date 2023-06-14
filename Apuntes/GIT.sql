-- ===========================================================================================================
    -- Configuración inicial.
    git config --global user.name "Tu Nombre"
    git config --global user.email "tu@email.com"

-- ===========================================================================================================
    -- Crear un repositorio nuevo.
    git init

-- ===========================================================================================================
    -- Clonar un repositorio existente.
    git clone <URL_del_repositorio>

-- ===========================================================================================================
    -- Verificar el estado del repositorio.
    git status

-- ===========================================================================================================
    -- Añadir cambios al área de preparación.
    git add <archivo> # Añadir un archivo específico
    git add . # Añadir todos los archivos modificados

-- ===========================================================================================================
    -- Confirmar los cambios.
    git commit -m "Mensaje del commit"

-- ===========================================================================================================
    -- Ver el historial de commits.
    git log

-- ===========================================================================================================
    -- Crear una nueva rama.
    git branch <nombre_de_rama>

-- ===========================================================================================================
    -- Cambiar a una rama existente.
    git checkout <nombre_de_rama>

-- ===========================================================================================================
    -- Fusionar una rama con la rama actual.
    git merge <nombre_de_rama>

-- ===========================================================================================================
    -- Descartar los cambios locales y actualizar con la última versión remota.
    git fetch
    git reset --hard origin/<nombre_de_rama>

-- ===========================================================================================================
    -- Enviar los cambios al repositorio remoto.
    git push origin <nombre_de_rama>

-- ===========================================================================================================
    -- Obtener los últimos cambios del repositorio remoto.
    git pull origin <nombre_de_rama>

-- ===========================================================================================================
    -- Crear y aplicar parches.
    git format-patch <commit_id>
    git apply <nombre_del_parche>

-- ===========================================================================================================
    -- Deshacer cambios locales.
    git reset --hard HEAD # Deshacer todos los cambios locales
    git checkout <archivo> # Deshacer los cambios en un archivo específico

-- ===========================================================================================================
    -- Ramas remotas.
    git remote -v # Ver los repositorios remotos vinculados
    git remote add origin <URL_del_repositorio> # Vincular un repositorio remoto

-- ===========================================================================================================
    -- Ignorar archivos y carpetas.
    Crear un archivo .gitignore y agregar los nombres de archivos y carpetas que deseas ignorar.
    
-- ===========================================================================================================