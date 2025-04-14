# Odoo 18 Deployment on Render

Este repositorio contiene los archivos necesarios para desplegar una instancia de Odoo 18 en Render, utilizando una base de datos externa gestionada por Render.

## Pasos para desplegar

1. Clona este repositorio.
2. Asegúrate de tener configurada la base de datos de Render.
3. Configura las credenciales de la base de datos en el archivo `odoo.conf`.
4. Sube el repositorio a Render.
5. ¡Listo! Tu instancia de Odoo 18 estará corriendo.

## Estructura

- `Dockerfile`: Configuración para construir la imagen Docker de Odoo.
- `docker-compose.yml`: Define los servicios necesarios (aunque no estamos usando una base de datos en el contenedor).
- `odoo.conf`: Configuración de conexión a la base de datos externa.
- `addons/`: Directorio para tus módulos personalizados.

