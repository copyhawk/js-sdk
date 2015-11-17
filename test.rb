require 'copy_hawk'

ENV["COPYHAWK_SITE_TOKEN"] = 'abc'
ENV["COPYHAWK_ACCOUNT_TOKEN"] = '123'
ENV["COPYHAWK_DEFAULT_LANGUAGE"] = 'en'

e = CopyHawk.eyas

e.preview_copy('Test', 'en')
