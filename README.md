<div align="center">

# Sistema de Gestion de Programa Educativo

Sistema de registro,seguimiento y análisis de inscripciones para un programa educativo.

</div>

<div align="center">


## 💻 Requisitos de intalación

</div>

Antes de comenzar, asegúrate de tener instalado las siguientes herramientas:

- **[MariaDB](https://mariadb.org/download/)**
- **[Python](https://www.python.org/downloads/)**
- **[Visual Studio Code](https://code.visualstudio.com/)** - Editor de código de su agrado
- **[Node.js](https://nodejs.org/es/download)**

<div align="center">


## 🗄️ Configuración de la base de datos

</div>

### 1. Iniciar MariaDB

Abrir el programa HeidiSQl intallado de MAriaDB. Ajusta los valores del usuario, contraseña y puerto

```env
Usuario: root
Contraseña: tu_contraseña
Puerto: 3307
```


### 2. Crear la base de datos y las tablas

Ejecuta el archivo [ddl_programa_educativo.sql](backend/src/ddl/ddl_programa_educativo.sql) en el programa HeidiSQl


### 3. Insertar los datos de ejemplo (DML)

Para insertar la información de ejmplo ejecuar los siguientes archivos:
1. **[alumno.sql](backend/src/dml/alumnos.sql)**: Insertar información de alumno.
2. **[estatus.sql](backend/src/dml/estatus.sql)**: Insertar el catálogo de estatus.
3. **[programas.sql](backend/src/dml/programas.sql)**: Insertar el catálogo de programas.
4. **[inscripciones.sql](backend/src/dml/inscripciones.sql)**: Insertar información de inscripciones.
5. **[historial_estatus.sql](backend/src/dml/historial_estatus.sql)**: Insertar historiales de cambios de los estatus de los alumnos.

**⚠️ Nota:**  Es importante ejecutarlo en el orden que se muestra


### 4. Crear los stored procedures

Ejecuta los siguientes archivos para crear los procedures

- **[prc_get_bajas_empresa.sql](backend/src/procedure/prc_get_bajas_empresa.sql)**: Obtiene el total de bajas por programa de la empresa solicitada. Recibe el nombre de una empresa.

- **[prc_update_estatus.sql](backend/src/procedure/prc_update_estatus.sql)**: Actualiza es estatus del alumno en la inscripcion y guarda el cambio en el historial. Recibe el id_inscripcion, nuevo estatus y motivo

Para llavar los procedures en HeidiSQl ejetua las siguientes llamadas:

**Actualizar estatus**
```sh
  CALL prc_update_estatus(id_inscripcion, estatus, motivo);
  ```

**Otener bajas**
```sh
  CALL prc_get_bajas_empresa(empresa);
  ```

<div align="center">

## 🐍 Configuración de Python y Jupyter

</div>

### 1. Crear un entorno virtual (recomendado)

```sh
# Crear el entorno
python -m venv venv

# Activar en Linux / macOS
source venv/bin/activate

# Activar en Windows
venv\Scripts\activate
```

### 2. Instalar dependencias

```sh
pip install jupyterlab notebook pandas sqlalchemy matplotlib numpy
```

### 3. Abrir los notebooks

```sh
# Desde la raíz del proyecto
jupyter notebook
```

Se abrirá el navegador automáticamente en `http://localhost:8888`. Navega a la carpeta `jupyter_notebook/` y abre los archivos `.ipynb`:


1. **[1_Estatus_programa.ipynb](jupyter_notebook/1_Estatus_programa.ipynb)**: Distribución de estatus actual por programa.
2. **[2_Bajas_vs_activos.ipynb](jupyter_notebook/2_Bajas_vs_activos.ipynb)**: Evolución mensual: bajas vs alumnos activos.
3. **[3_Tasa_activos_programa.ipynb](jupyter_notebook/3_Tasa_activos_programa.ipynb)**: Tasa de activos por programa.
4. **[4_Frecuencia_motivos.ipynb](jupyter_notebook/4_Frecuencia_motivos.ipynb)**: Motivos de baja más frecuentes.


> Dentro de cada notebook ejecuta todas las celdas con `Kernel > Restart & Run All` o con el atajo `Shift + Enter` celda por celda.

---



<div align="center">

## Instalación y ejecución del proyecto


</div>

### Instalación

1. Clona el repositorio

  ```sh
    git clone https://github.com/ovalle98/ProgramaEducativo.git
  ```


2. Dirijete a la carpeta backend

  ```sh
    cd C:\tu_direccion\ProgramaEducativo\backend
  ```

3. Intala los paquetes de NPM para el backend local

  ```sh
    npm install
  ```

4. Crea un archivo .env y agrega los siguientes datos con base a tu información

  ```sh
    DB_HOST=localhost
    DB_PORT=port_mariadb
    DB_USER=roo_o_tu_usuario
    DB_PASSWORD=tu_paswword
    DB_NAME=db_programa_educativo
    PORT = 3000
  ```

5. Ejecuta el backend local

  ```sh
    npm run dev
  ```

6. Dirijetea la carpeta prog_educ

  ```sh
    cd cd C:\tu_direccion\ProgramaEducativo\prog_educ
  ```

7. Intala los paquetes de NPM para el frontend local

  ```sh
    npm install
  ```

8. En los archivos ubicados en prog_educ\services cambia el apiUrl por el PORT que pusiste en el punto 4

  ```sh
    apiURL = 'http://localhost:3000/alumnos'
  ```

9. Ejecuta el fronted local en C:\tu_direccion\ProgramaEducativo\prog_educ

  ```sh
    ng serve
  ```

10. En el archivo backend\middlewares\cors.js agrega la URL en el se ejecuto el frontend

  ```sh
    origin: 'http://localhost:4200'
  ```