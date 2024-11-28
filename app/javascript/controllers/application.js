
import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
//add bootstrap for styles
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'jquery'

// Ensure jQuery is available globally
global.$ = require('jquery');
global.jQuery = require('jquery');
window.Popper = require('popper.js').default;

function ConfirmDestroy() {

  const forms = document.querySelectorAll('.confirm_destroy');

  forms.forEach(form => {
    form.addEventListener('submit', function(e) {
      handleSubmit(form, e);
    });
  });

  function handleSubmit(form, e) {
    e.preventDefault();
    let message = form.querySelector('button').dataset.confirm; 
    if (!confirm(message)) {
      return false;
    }
    form.submit();
  }

}

document.addEventListener('DOMContentLoaded', ConfirmDestroy);

Rails.start()
document.addEventListener("DOMContentLoaded", () => {
    console.log("Rails UJS is initialized");
  });
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
