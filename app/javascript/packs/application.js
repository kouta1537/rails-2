// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", function() {
    var userLink = document.querySelector('.dropdown-toggle');
    var dropdown = document.querySelector('.dropdown-menu');

    if (userLink) {
      userLink.addEventListener('click', function(event) {
        event.preventDefault();
        dropdown.classList.toggle('show');
      });
    }
});
