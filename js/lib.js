function sp_calc_amount() {
  Curly({
    url: '/current_amount',
    dataType: 'json',
    complete: function(xhr) {
//      console.log('hrx', xhr.responseJSON.message.amount);
      $("#UserAmount").text('Saldo: S/. ' + xhr.responseJSON.message.amount);
    },
  });
}
$(document).ready(function() {
  sp_calc_amount();
  setInterval(sp_calc_amount, 5000);
});
