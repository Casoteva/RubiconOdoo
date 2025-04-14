# Usar la imagen base oficial de Odoo 18
FROM odoo:18

# Cambiar al usuario root para poder instalar dependencias
USER root

# Actualizar el sistema y las dependencias
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

# Copiar archivo de configuración odoo.conf
COPY ./etc/odoo.conf /etc/odoo/odoo.conf

# Copiar los addons personalizados
COPY ./addons /mnt/extra-addons

# Exponer el puerto 8069
EXPOSE 8069

# Iniciar Odoo con la configuración proporcionada
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
