FROM odoo:18

USER root

# Instalar dependencias si las tienes
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

USER odoo

# Copiar configuración y addons personalizados
COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

# Exponer el puerto Odoo
EXPOSE 8069

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
