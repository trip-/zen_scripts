#!/usr/bin/env python

# Uses google apis to translate what passed as arguments from a language to another
# example translate.py -l it:en casa

import sys
import json
import getopt
import urllib

def translate(text = '', langpair = ['it', 'en']):
    url = 'http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&%s'
    append = urllib.urlencode({'q': text, 'langpair': '|'.join(langpair[:2])})
    page = urllib.urlopen(url % append).readlines()
    result = json.loads(page[0])
    tr = result['responseData']['translatedText']
    return tr

if __name__ == '__main__':
    optlist, args = getopt.getopt(sys.argv[1:], 'l:')
    lp = ['it', 'en']
    if optlist:
        lp = optlist[0][1].split(':')
    args = ' '.join(args)
    ret = translate(args, lp)
    print "%s => %s" % (lp[0], args)
    print "%s => %s" % (lp[1], ret)
