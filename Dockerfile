FROM odoo:18

USER root

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Casoteva/Addons-Opoo/releases/download/v1.0-addons/odoo-official-addons.tar.gz -O /tmp/odoo-official-addons.tar.gz && \
    tar -xzf /tmp/odoo-official-addons.tar.gz -C /usr/lib/python3/dist-packages/odoo/addons && \
    rm /tmp/odoo-official-addons.tar.gz

USER odoo

COPY ./etc/odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
