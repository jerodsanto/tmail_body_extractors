require 'test/unit'
require 'rubygems'
require 'action_mailer'
require 'tmail_mail_extension'

class TmailMailExtensionTest < Test::Unit::TestCase
  def test_html
    @mail = TMail::Mail.parse( File.read("test_mails/mail_html.raw_mail") )
    assert_equal( "<div dir=\"ltr\"><div>este texto es html con <b>negritas</b><div>\n\n------", @mail.body_html )
    assert_equal nil, @mail.body_plain
  end
  
  def test_plain
    @mail = TMail::Mail.parse( File.read("test_mails/mail_plain.raw_mail") )
    assert_nil @mail.body_html
    assert_equal( "only plain", @mail.body_plain)
  end
  
  def test_plain_and_html
    @mail = TMail::Mail.parse( File.read("test_mails/mail_plain_and_html.raw_mail") )
    assert_equal( "<div dir=\"ltr\"><div>este texto es html con <b>negritas</b><div>\n\n------", @mail.body_html )
    assert_equal("este texto es html con *negritas*\ny una lista con:\n\n   - una cosa\n   - dos cosas\n   - tres cosas\n\ny un colorcito.\n\n", @mail.body_plain)
  end
  
  def test_mail_plain_and_html_from_mail_mac
    @mail = TMail::Mail.parse( File.read("test_mails/mail_plain_and_html_from_mail_mac.raw_mail") )
    assert_equal( "<html><body style=\"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; \">esto es <font class=\"Apple-style-span\" color=\"#791381\">html.</font></body></html>\n--Apple-Mail-1-509166459--", @mail.body_html )
    assert_equal("esto es html.\n", @mail.body_plain)
  end
  
  def test_mail_plain_and_html_with_attach_plain_and_html
    @mail = TMail::Mail.parse( File.read("test_mails/mail_plain_and_html_with_attach_plain_and_html.raw_mail") )
    assert_equal( "<div dir=\"ltr\">este es el html con <b>negritas</b>.<br>\n</div>\n\n", @mail.body_html )
    assert_equal("este es el html con *negritas*.\n\n", @mail.body_plain)
  end
  
  def test_mail_plain_with_attach
    @mail = TMail::Mail.parse( File.read("test_mails/mail_plain_with_attach.raw_mail") )
    assert_nil @mail.body_html
    assert_equal("plain con adjunto\n\n", @mail.body_plain)
  end
  
  def test_mail_plain_with_attach_from_mail_mac
    @mail = TMail::Mail.parse( File.read("test_mails/mail_plain_with_attach_from_mail_mac.raw_mail") )
    assert_nil @mail.body_html
    assert_equal("un adjunto\n", @mail.body_plain)
  end
end