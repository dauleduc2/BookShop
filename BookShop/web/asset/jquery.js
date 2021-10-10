$(document).ready(function () {
  //navbar
  $(".navbarSelection").click(function (e) {
    e.preventDefault();
    $(".navbarSelection").each(function (index) {
      $(this).removeClass("bg-gray-900 text-white");
    });
    $(this).addClass("bg-gray-900 text-white");
  });

  $(".userButton").click(function (e) {
    e.preventDefault();
    $(".dropdownMenu").toggleClass("hidden");
  });
  $("#toggleButton").click(function (e) {
    e.preventDefault();
    $("#mobile-menu").toggleClass("hidden");
  });
  //form
});
