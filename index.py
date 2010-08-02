path='/home/gunnar/campaign/'
import os
import sys
os.environ['HOME'] = path
sys.path.append(path[0:-1])
from urlparse import parse_qs
import wsgiref.util

from mako.template import Template
from mako.lookup import TemplateLookup
from config import * 
from webob import *
#from core import *
from core import *
import Count
#import report
import re

templates=TemplateLookup(path+'templates');

def application(environ, start_response):
    """
    Main application that get's called
    """
    #environ['wsgilog.logger'].info('This information is logged.')
    # Exception will be logged and sent to the browser formatted as HTML.
    
    template,content=handle_url(environ)
    status = '200 OK'
    if template !='file':
        """
        We want to show a normal webpage
        """
        template=templates.get_template(template) 
        response_headers = [('Content-Type', 'text/html')]
        start_response(status, response_headers)
        ret=[template.render(content=content)]
    else:
        """
        We want to offer a file for download, content=filename
        """
        body,title=content
        os.chdir(output_path)
        status = '200 OK'
        response_headers = [('Content-Type', 'application/pdf'),('Content-disposition','attachment; filename="'+title+'.pdf"')]

        start_response(status, response_headers)
        ret=body.getvalue()
    return ret

 
        
def handle_url(environ):
    """ 
    A function to handle the url, call the appropriate function and return the template and content
    """
    # the environment variable CONTENT_LENGTH may be empty or missing
    try:
        request_body_size = int(environ.get('CONTENT_LENGTH', 0))
    except (ValueError):
        request_body_size = 0
    
    request_body = environ['wsgi.input'].read(request_body_size)
    param = parse_qs(request_body);
    function=environ.get('PATH_INFO','/');
    
        
    if function=='/map':
        template,content=gmap(param)
    else:
        template,content=index(param)
    return template,content
 
def gmap(param):
    return('map.html',None)
def index(param):
    """
    Displays the index site
    """
    content={}
    
    zone=re.escape(param.get('zone',[''])[0])
    district=re.escape(param.get('district',[''])[0])
    site=re.escape(param.get('site',[''])[0])
    if zone and district and site:
        locations=(get_locations(zone,district),(zone,district,site))
        c=Count.Count(zone,district,site)
    else:
        locations=(get_locations("All","All"),(zone,district,site))
        c=Count.Count()
    
    return ('index.html',(c,locations))

 
    


if __name__=='__main__':
    template,content=index({})
    template=templates.get_template(template)
    print template.render(content=content)
