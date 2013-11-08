// var stripeResponseHandler = function(status, response) {
//   var $form = $('#order-form');

//   if (response.error) {
//     // Show the errors on the form
//     $('#stripe_error').prop("class", "alert alert-danger");
//     $('#stripe_error').text(response.error.message);
//     $('input[type=submit]').prop('disabled', false);
//   } else {
//     // token contains id, last4, and card type
//     var token = response.id;
//     // Insert the token into the form so it gets submitted to the server
//     $form.append($('<input type="hidden" name="stripeToken" />').val(token));
//     // and submit
//     $form.get(0).submit();
//   }
// };

// jQuery(function($) {
//   Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));

//   $('#order-form').submit(function(event) {

//     var $form = $(this);

//     // Disable the submit button to prevent repeated clicks
//     $form.find('input[type=submit]').prop('disabled', true);

//     Stripe.card.createToken($form, stripeResponseHandler);

//     // Prevent the form from submitting with the default action
//     return false;
//   });
// });