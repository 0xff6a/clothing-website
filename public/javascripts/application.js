$(document).ready(function () {

  $('#checkout-btn').on('click', function(event) {
    event.preventDefault();

    $('.vouchers').removeClass('hidden');
    $('.add_product').remove();
    $('.remove_product').remove();

  });

});