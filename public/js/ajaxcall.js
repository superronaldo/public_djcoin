
  $.ajax(
    {
        url: 'https://classic999.com/djcoin_v2/public/activepricerule',
        method: 'GET',
        dataType: 'JSON',
        crossDomain: true,
        headers: {"X-Shopify-Access-Token": "3a7a85a1bbb10afe5eff8d65f7da5009", "Access-Control-Allow-Origin": "*"},
        contentType: "application/json",
        success: function (response) {
            console.log(response);
        }
    });
