// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('test.js')

//= require jquery3
//= require popper
//= require bootstrap

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('turbolinks:load', () => {
  // avatarの取得
    axios.get('/profile')
      .then(response => {

      })
      .catch( e => {

      });

  // input要素を取得 
  const uploader = document.querySelector('.uploader');
  // inputで値が変更された時にイベント発火
  uploader.addEventListener('change', () => { 
    // 画像の切替
    const file = uploader.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      const image = reader.result;
      document.querySelector('.avatar-image').setAttribute('src', image);
    }
  // //   $('.submit-button').removeClass('hidden')
  });

  // postでデータを保存する。
  // axios.post('/profile',{
  //  profile: {avatar: content}
  // })
  axios.post('/profile')
  .then((res) => {
    console.log('ok');
  })
  .catch( e => console.log('out!'));
});

// document.addEventListener('DOMContentLoaded', () => {
//   $('.avatar-image').on('click', () => {
//     $('.avatar-image').addClass('hidden')
//     $('.comment-text-area').removeClass('hidden')
//   })
// });

