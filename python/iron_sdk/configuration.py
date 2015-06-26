from __future__ import absolute_import
import base64
import urllib3

class Configuration(object):
    def __init__(self, token):
      self.api_key_prefix = {}
      self.api_key = {}
      # TODO: make this generic
      
      self.api_key['oauth_token'] = token
      

    def get_api_key_with_prefix(self, key):
      if self.api_key.get(key) and self.api_key_prefix.get(key):
        return self.api_key_prefix[key] + ' ' + self.api_key[key]
      elif self.api_key.get(key):
        return "OAuth " + self.api_key[key]

    def get_basic_auth_token(self):
      return urllib3.util.make_headers(basic_auth=self.username + ':' + self.password).get('authorization')

    def auth_settings(self):
      return { 
                 'oauth_token': {
                     'type': 'api_key',
                     'in': 'header',
                     'key': 'Authorization',
                     'value': self.get_api_key_with_prefix('oauth_token')
                 },
               
             }
