$('#option-a a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})

$('#option-b a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})

$('#option-c a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})

// var ready;
// ready = function() {
//   var tallest = 0;
//     group.each(function() {
//       var thisHeight = $(this).height();
//       if(thisHeight > tallest) {
//         tallest = thisHeight;
//       }
//     });
//     group.height(tallest);
// };

// $(document).ready(ready);
// $(document).on('page:load', ready);