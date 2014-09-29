$(document).ready(function () {

  $('#checkout_btn').on('click', function(event) {
    event.preventDefault();

    displayVouchers();
    disableShoppingLinks();
  });

  $('.redeem_btn').on('click', function(event) {
    event.preventDefault();

    $.get(this.href, function(response) {
      if (response.status == 'ok') {
        applyDiscount(response.discount, response.total);
      } else {
        displayVoucherError();
      };
    });
  });

  function displayVouchers() {
    $('.vouchers').removeClass('hidden');
  };

  function disableShoppingLinks() {
    $('.add_product').remove();
    $('.remove_product').remove();
  };

  function applyDiscount(discount, total) {
    $('#total').text(formatCCY(total));
    $('#text_total').text('You saved ' + formatCCY(discount));
  };

  function displayVoucherError() {
    $('.alert').empty().append("<h3 class='alert_message'>The selected voucher is not valid</h3>");
  };

  function formatCCY(value) {
    return '£' + Number(value).toFixed(2);
  };

});