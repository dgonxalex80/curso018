$(document).ready(function () {

  function traducirBotones() {
    $(".code-folding-btn").each(function () {
      const texto = $(this).text().trim();

      if (texto === "Show") {
        $(this).text("Mostrar");
      }

      if (texto === "Hide") {
        $(this).text("Ocultar");
      }
    });
  }

  traducirBotones();

  $(document).on("click", ".code-folding-btn", function () {
    setTimeout(traducirBotones, 10);
  });

});