# Usar la imagen base oficial de Odoo 18
FROM odoo:18

# Cambiar al usuario root para instalar dependencias adicionales
USER root

# Instalar librerías necesarias
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Volver al usuario odoo
USER odoo

# Copiar archivo de configuración
COPY ./etc/odoo.conf /etc/odoo/odoo.conf

# Copiar tus addons personalizados
COPY ./addons /mnt/extra-addons

# Comando por defecto: actualizar todos los módulos y apagar
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
