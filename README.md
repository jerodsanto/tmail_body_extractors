TMail Body Extractors
=====================

Notes
-----
Originally authored by [Fernando Guillen][1] under the name **tmail-html-body-extractor** and available on [Google Code][2]. I swiped it up and added test-driven method to deliver plaintext only from TMail::Mail object. Released under [Apache License 2.0][3]

Usage
-----

`require "tmail_mail_extension"
mail = TMail::Mail.parse(source)`

`mail.body_html`

Returns just html if available or *nil*

`mail.body_plain`

Returns just plaintext if available or *nil*

[1]:http://fernandoguillen.info
[2]:http://code.google.com/p/tmail-html-body-extractor/
[3]:http://www.apache.org/licenses/LICENSE-2.0