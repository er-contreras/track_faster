document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("form");
  const list = document.querySelector("ul");

  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    const data = new FormData(form);

    const response = await fetch("/tasks", {
      method: "POST",
      body: data,
      headers: {
        "Accept": "text/html"
      }
    });

    const html = await response.text();

    list.insertAdjacentHTML("beforeend", html);
    form.reset();
  });
});

