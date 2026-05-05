let validated = false;
const textField = document.getElementById("textField");
const description = document.getElementById("description");
const color = document.getElementById("color");
const error1 = document.getElementById("error1");
const error2 = document.getElementById("error2");
document.getElementById("submit").addEventListener("click", checkText);

function checkText(event) {
  if (textField.value === "") {
    error1.hidden = false;
  } else {
    error1.hidden = true;
  }

  if (description.value === "") {
    error2.hidden = false;
  } else {
    error2.hidden = true;
  }

  if (error1.hidden && error2.hidden) {
    validated = true;
  }

  checkForm(event);
}

function checkForm(event) {
  if (!validated) {
    event.preventDefault();
  }
}
