from odoo import models, api
import os

class CleanupAttachment(models.TransientModel):
    _name = 'cleanup.attachment'
    _description = 'Limpia attachments huérfanos'

    @api.model
    def clean_missing_files(self):
        attachments = self.env['ir.attachment'].search([])
        counter = 0
        for attach in attachments:
            if attach.store_fname:
                full_path = attach._full_path(attach.store_fname)
                if not os.path.exists(full_path):
                    attach.unlink()
                    counter += 1
        return counter