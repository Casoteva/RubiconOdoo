FROM odoo:18

USER root

# Instalar las dependencias necesarias
RUN apt-get update && apt-get install -y \
    wget tar \
    libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Descargar y extraer los addons
RUN wget -v https://github.com/Casoteva/Addons-Opoo/releases/download/v1.0-addons/odoo-official-addons.tar.gz -O /tmp/odoo-official-addons.tar.gz && \
    tar -xzvf /tmp/odoo-official-addons.tar.gz -C /usr/lib/python3/dist-packages/odoo/addons && \
    rm /tmp/odoo-official-addons.tar.gz

# Ajustar permisos para el usuario 'odoo'
RUN chown -R odoo:odoo /usr/lib/python3/dist-packages/odoo/addons

USER odoo

# Copiar el archivo de configuración y los addons extra
COPY ./etc/odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

# Iniciar Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
