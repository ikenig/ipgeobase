# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def setup
    body = %(
      <query>
        <status>success</status>
        <country>Russia</country>
        <countryCode>RU</countryCode>
        <region>SVE</region>
        <regionName>Sverdlovsk Oblast</regionName>
        <city>Yekaterinburg</city>
        <zip>620010</zip>
        <lat>56.8439</lat>
        <lon>60.6524</lon>
        <timezone>Asia/Yekaterinburg</timezone>
        <isp>PJSC MegaFon</isp>
        <org>OJSC MegaFon GPRS/UMTS Network</org>
        <as>AS31224 PJSC MegaFon</as>
        <query>83.169.216.199</query>
      </query>
    )
    stub_request(:any, "http://ip-api.com/xml/8.8.8.8").to_return(body: body)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup
    ip_meta = ::Ipgeobase.lookup("8.8.8.8")
    assert ip_meta.status == "success"
  end
end
