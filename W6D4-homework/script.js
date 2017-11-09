document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const addFavorites = (event) => {
    event.preventDefault();

    // IDEA looked over solutions--why document.querySelector?
    const favoriteInput = document.querySelector(".favorite-input");
    const favorite = favoriteInput.value;
    favoriteInput.value = "";

    const li = document.createElement("li");
    li.textContent = favorite;

    const sfPlaces = document.getElementById("sf-places");
    sfPlaces.appendChild(li);
  };

  // IDEA looked over solutions--how do you handle submissions?
  const submitButton = document.querySelector(".favorite-submit");
  submitButton.addEventListener("click", addFavorites);



  // adding new photos

  // --- your code here!
  //TODO Very lost here, timed out. Ask a TA later!


});
