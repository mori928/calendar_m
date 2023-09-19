document.addEventListener("DOMContentLoaded", function() {
  const logoutLink = document.querySelector("#logout-link");
  if (logoutLink) {
    logoutLink.addEventListener("click", function(e) {
      e.preventDefault();
      const form = document.createElement("form");
      form.action = this.href;
      form.method = "POST";
      form.style.display = "none";
      const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
      const csrfInput = document.createElement("input");
      csrfInput.type = "hidden";
      csrfInput.name = "authenticity_token";
      csrfInput.value = csrfToken;
      form.appendChild(csrfInput);
      document.body.appendChild(form);
      form.submit();
    });
  }
});