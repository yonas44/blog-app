// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const profilePic = document.querySelector('#current_user_photo');
const userOptions = document.querySelector('.current_user_options');
profilePic.addEventListener('click', ()=> {
  if (userOptions.classList.contains('slide')) userOptions.classList.remove('slide');
  else userOptions.classList.add('slide');
})
console.log("hello")