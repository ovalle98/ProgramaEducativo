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