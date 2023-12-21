(function(){
  // Default input values
  let firstName = "Daniel";
  let lastName = "Oropeza";
  let city = "Cochabamba";
  let state = "Cercado";
  let zip = "00000";
  let company = "NICE";

  document.getElementById("firstNameInput").value = firstName;
  document.getElementById("lastNameInput").value = lastName;
  document.getElementById("cityInput").value = city;
  document.getElementById("stateInput").value = state;
  document.getElementById("zipInput").value = zip;
  document.getElementById("companyInput").value = company;

  const customerInputs = ["firstNameInput", "lastNameInput", "cityInput", "stateInput", "zipInput", "companyInput"];

  var debounceTime;

  customerInputs.forEach(function(inputId) {
    document.getElementById(inputId).addEventListener("input", async function(event) {
      clearTimeout(debounceTime);

      debounceTime = setTimeout(async () => {
        await patchCostumerData(event.target.id, event.target.value);
      }, 300);

    });
  });

  async function patchCostumerData(fieldId, value) {
    // Call PATCH Customer Data endpoint to store information.
    console.log(`patchCostumerData(${fieldId}, ${value})`);

    // After a successfully saving Data customer, we update the Intro Script
    switch(fieldId) {
      case "firstNameInput": firstName = value; break;
      case "lastNameInput": lastName = value; break;
      case "cityInput": city = value; break;
      case "stateInput": state = value; break;
      case "zipInput": zip = value; break;
      case "companyInput": company = value; break;
      default: break;
    };
    updateIntroScript();
  }

  // Intro Script
  updateIntroScript();

  function updateIntroScript() {
    document.getElementById("intro-paragraph-1").innerHTML = `Agent:Hey there! I'm FJorian. Welcome to Nobel!. How's your day going, <span class="highlight">${firstName} ${lastName}</span>?`
    document.getElementById("intro-paragraph-2").innerHTML = `Costumer: Hey FJorian! It's good, thanks. How about yours?`
    document.getElementById("intro-paragraph-3").innerHTML = `Agent: Glad to hear that! My day's going well, especially now that I get to chat with someone like you. Your experience at <span class="highlight">${company}</span> caught my eye. We're growing our IT department in <span class="highlight">${state}, ${city}</span> and I think your skills could be a game-changer for us. What do you think?`
    document.getElementById("intro-paragraph-4").innerHTML = `Customer: Oh, really? That's intriguing! Tell me more.`;
    document.getElementById("intro-paragraph-5").innerHTML = `Agent: Absolutely! I'd love to dive into the details. How about we schedule a quick follow-up to chat about how your expertise could fit right in here at Stellar? What time works for you?Agent: Absolutely! I'd love to dive into the details. How about we schedule a quick follow-up to chat about how your expertise could fit right in here at Nobel? What time works for you?`;
    document.getElementById("intro-paragraph-6").innerHTML = `Customer: Sounds good! How about tomorrow afternoon?`;
    document.getElementById("intro-paragraph-7").innerHTML = `Agent: Perfect! I'll lock that in. Can't wait to explore this further with you, <span class="highlight">${firstName} ${lastName}</span>!`;
  }

})();