<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>419 error page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Changa:wght@200;300;400;500;600;700;800&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;500;600;700;800;900;1000&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
* {
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

@font-face {
  font-family: "font-en";
  src: url(assets/fonts/cuyabra.otf);
}

:root {
  --main-color: #51459e;
  --body-bg: #f5f8fa;
  --navbar-bg: #FFF;
  --icon-active: #2c2f32;
  --icon-idle: #8b88ff;
  --p-color: #2c2f32;
  --subp-color: #adafca;
  --link-color: #51459e;
  --a-light: #FFF;
  --shadow-color: #5e5c9a0f;
  --border-color: #eaeaf5;
  --sub-light: #fcfcfd;
  --border-input: #dedeea;
}

.dark {
  --main-color: #51459e;
  --body-bg: #151521;
  --navbar-bg: #1e1e2d;
  --icon-active: #FFF;
  --icon-idle: #8b88ff;
  --p-color: #FFF;
  --subp-color: #9aa4bf;
  --link-color: #51459e;
  --a-light: #FFF;
  --shadow-color: #0000000f;
  --border-color: #2f3749;
  --sub-light: #21283b;
  --border-input: #3f485f;
}

.form-group {
  width: 100%;
  position: relative;
  margin: 0;
}

@media (max-width: 991.98px) {
  .form-group {
    margin: 10px 0;
  }
}

.form-group label {
  color: #c1bacd;
  font-size: 0.85rem;
  font-weight: 600;
  position: absolute;
  top: 21px;
  right: 20px !important;
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
  pointer-events: none;
  display: block;
  margin: 0;
  line-height: 1em;
  letter-spacing: 0 !important;
}

.form-group .form-control {
  height: 55px;
  padding: 7px 20px 0 20px;
  background-color: #f5f4f7;
  border: unset;
  color: #3e3f5e;
  -webkit-transition: border-color .2s ease-in-out;
  transition: border-color .2s ease-in-out;
  width: 100%;
  border-radius: 17px !important;
  font-size: 0.85rem;
  font-weight: 600;
}

.form-group .form-control:focus {
  border-color: tomato;
  -webkit-box-shadow: none;
          box-shadow: none;
  outline: none;
}

.form-group .form-control::-webkit-input-placeholder {
  color: #cacaca;
  font-weight: 600;
  font-size: 0.8rem;
}

.form-group .form-control:-ms-input-placeholder {
  color: #cacaca;
  font-weight: 600;
  font-size: 0.8rem;
}

.form-group .form-control::-ms-input-placeholder {
  color: #cacaca;
  font-weight: 600;
  font-size: 0.8rem;
}

.form-group .form-control::placeholder {
  color: #cacaca;
  font-weight: 600;
  font-size: 0.8rem;
}

.form-group select {
  cursor: pointer;
}

.create-account-btn {
  text-decoration: none;
  width: 95% !important;
  margin: 0 auto 0 auto;
  color: #FFF;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  height: 43px;
  border-radius: 10px;
  font-size: .7rem;
  font-weight: 600 !important;
  text-align: center;
  line-height: 43px;
  cursor: pointer;
  -webkit-transition: background-color .2s ease-in-out;
  transition: background-color .2s ease-in-out;
  background-color: #51459e !important;
  border: 0;
}

.create-account-btn svg {
  height: 18px;
  margin-left: 2px;
}

.create-account-btn svg path {
  fill: #FFF;
}

.create-account-btn:hover {
  background-color: #51459e;
}

.form-check {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  margin: 10px 5px 10px 0;
}

.form-check input {
  background-color: #fff;
  border: 1px solid #dedeea;
  height: 17px;
  width: 16px;
  position: unset;
  margin: 3px 0 0 5px;
}

.form-check p {
  color: #2c2f32;
  font-size: .875rem;
  font-weight: 700;
  line-height: 22px;
  cursor: pointer;
  display: block;
  margin: 0;
}

.form-check p a {
  text-decoration: none;
  color: #FFF;
}

p.text {
  margin-top: 30px;
  font-size: .875rem;
  line-height: 1.7142857143em;
  font-weight: 500;
  color: var(--p-color);
}

p.text a {
  text-decoration: none;
  color: #51459e;
  font-weight: 700;
}

.active-input label {
  padding: 0 6px;
  font-size: 0.55rem;
  top: 11px !important;
  right: 13px !important;
}

.page-card {
  background-size: cover;
  border-radius: 24px;
  background-position: 50%;
  background-repeat: no-repeat;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  min-height: 132px;
  padding: 0 0;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  position: relative;
}

@media (max-width: 575.98px) {
  .page-card {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column;
    margin-bottom: 15px;
  }
}

.page-card .media {
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  align-items: center;
  width: 100%;
  position: relative;
  z-index: 1;
}

.page-card .media img {
  margin-left: 16px;
  vertical-align: middle;
}

.page-card .media .media-body {
  text-align: right;
}

.page-card .media .media-body h5 {
  font-size: 2.3rem;
  font-weight: 700;
  margin: 0;
  margin-top: 10px;
  letter-spacing: 1px;
  color: #FFF;
}

.page-card .media .media-body h5 span {
  margin-left: 10px;
  font-size: 1.4rem;
  font-weight: 600;
  color: #f9ff00;
  letter-spacing: 0;
}

@media (max-width: 575.98px) {
  .page-card .media .media-body h5 span {
    font-size: 1.2rem;
  }
}

@media (max-width: 575.98px) {
  .page-card .media .media-body h5 {
    font-size: 1.75rem;
  }
}

.page-card .media .media-body p {
  margin-top: 0px;
  font-size: 1rem;
  font-weight: 600;
  color: #FFF;
}

.page-card .media .media-body p span {
  font-weight: 600;
  font-size: .75rem;
  margin-right: 5px;
}

.page-card a {
  position: relative;
  z-index: 1;
  text-decoration: none;
  display: inline-block;
  height: 45px;
  border-radius: 14px;
  background-color: #FFF;
  color: #3e3f5e;
  font-size: .8rem;
  font-weight: 700;
  text-align: center;
  line-height: 43px;
  cursor: pointer;
  -webkit-transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  -webkit-box-shadow: 3px 5px 10px 0 rgba(62, 63, 94, 0.2);
          box-shadow: 3px 5px 10px 0 rgba(62, 63, 94, 0.2);
  width: 140px;
}

.page-card-balance {
  background-color: #095bec !important;
  background: linear-gradient(-118deg, #4a4dfd, #4dc6ea) !important;
}

.page-card-points {
  background-color: #74ddec !important;
  background: linear-gradient(-118deg, #4a4dfd, #4dc6ea) !important;
}

.overlay-balance {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  width: 100%;
  border-radius: 24px;
  min-height: 132px;
  padding: 0 32px;
}

.overlay-points {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  width: 100%;
  border-radius: 24px;
  min-height: 132px;
  padding: 0 32px;
}

.overlay-balance-image {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  border-radius: 24px;
  background-image: url(../assets/images/Money.png);
  background-size: cover;
  background-position: 50% 50%;
}

.overlay-points-image {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  border-radius: 24px;
  background-image: url(../assets/images/Points.png);
  background-size: cover;
  background-position: 50% 0%;
}

.month-container .month-container-header h3 {
  font-size: 0.9rem;
  color: var(--p-color);
  font-weight: 700;
  text-align: right;
  margin: 5px 5px 25px 0;
}

.month-container .month-card {
  background: var(--navbar-bg);
  padding: 20px 20px;
  border-radius: 14px;
  margin-bottom: 12px;
}

.month-container .month-card a {
  text-decoration: none;
}

.month-container .month-card .month-title {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.month-container .month-card .month-title .month-num {
  background: #151521;
  color: #FFF;
  font-size: 1.8rem;
  font-weight: 700;
  height: 60px;
  width: 60px;
  border-radius: 14px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  margin-left: 15px;
  -webkit-box-flex: 0;
      -ms-flex: none;
          flex: none;
  line-height: 60px;
  background-repeat: no-repeat;
  background-position: center center;
}

.month-container .month-card .month-title .month-num span {
  font-family: "Poppins";
  font-weight: 700;
  margin-top: 3px;
}

.month-container .month-card .month-title .month-text h3 {
  font-size: 0.9rem;
  font-weight: 700;
  margin: 0;
  color: var(--p-color);
  text-align: right;
}

.month-container .month-card .month-title .month-text p {
  font-size: 0.8rem;
  font-weight: 600;
  margin: 0;
  text-align: right;
  color: #adafca;
}

.month-container .month-card .month-numbers {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 0 0 0 0;
  margin-top: 20px;
}

.month-container .month-card .month-numbers .month-num-part {
  background: var(--body-bg);
  border: 1px solid var(--border-color);
  padding: 3px 15px;
  border-radius: 10px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.month-container .month-card .month-numbers .month-num-part svg {
  color: var(--p-color);
  height: 16px;
  width: 16px;
}

.month-container .month-card .month-numbers .month-num-part .month-num-part-num {
  font-family: 'Poppins';
  font-weight: 500;
  font-size: 0.9rem;
  margin-top: 2px;
}

.month-container .month-card .month-numbers .month-num-part span {
  font-weight: 700;
  font-size: 1rem;
  margin-right: 7px;
  color: var(--p-color);
}

.month-container .month-card .month-numbers .month-num-part .month-num-part-title {
  font-size: 0.7rem;
  margin-right: 4px;
}

@media (max-width: 1199.98px) {
  .month-container .month-card .month-numbers .month-num-part {
    padding: 2px 8px;
    width: 100%;
    margin: 0 5px;
  }
  .month-container .month-card .month-numbers .month-num-part svg {
    height: 14px;
    width: 14px;
  }
  .month-container .month-card .month-numbers .month-num-part .month-num-part-num {
    font-size: 0.8rem;
  }
  .month-container .month-card .month-numbers .month-num-part span {
    font-size: 0.9rem;
  }
}

.month-container .month-card .course-progress {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-top: 1px solid var(--border-color);
  padding-top: 18px;
  margin-top: 17px;
  padding-bottom: 0px;
}

.month-container .month-card .course-progress .course-persentage {
  font-weight: 700;
  font-size: 0.8rem;
  margin: 0 0 0 10px;
  color: var(--p-color);
}

.month-container .month-card .course-progress .progress {
  background: var(--body-bg);
  height: 4px;
  width: 100%;
  position: relative;
  border-radius: 20px;
}

.month-container .month-card .course-progress .progress .inner-progress {
  background: linear-gradient(-118deg, #0046ed, #00c5da) !important;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  z-index: 2;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
}

.month-container .month-card .course-progress .course-score p {
  margin: 0 10px 0 0;
  font-size: 0.8rem;
  font-weight: 700;
  color: var(--p-color);
}

.month-container .month-card-register .month-card-action a {
  text-decoration: none;
  background: linear-gradient(-118deg, #0046ed, #00c5da) !important;
  width: 100%;
  margin: auto;
  color: #FFF;
  display: inline-block;
  height: 40px;
  border-radius: 8px;
  font-size: 0.7rem;
  font-weight: 700;
  text-align: center;
  line-height: 40px;
  cursor: pointer;
  margin-top: 15px;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
}

._df_button {
  padding: 0 !important;
}

.register {
  position: relative;
  direction: rtl;
  font-family: "cairo";
  background-position: center center;
  background-size: cover;
  width: 100%;
  min-height: 100vh;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 100%;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  position: relative;
  z-index: 1;
  padding: 0;
}

.register .register-overlay {
  min-height: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 100%;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  position: absolute;
  top: 0;
  left: 0;
  background: #331a7382;
}

.register .row {
  width: 100%;
  margin: 0;
}

.register .row .col-md-12,
.register .row .col-md-6 {
  padding: 0 8px;
}

.register .form-container {
  height: 100%;
  width: 100%;
}

.register .form-container .form-card {
  background: #FFF;
  width: 575px;
  width: 100%;
  height: 98vh;
  padding: 45px 45px 40px 45px;
  border-radius: 0;
  -webkit-box-shadow: 0 0 60px 0 rgba(94, 92, 154, 0.12);
          box-shadow: 0 0 60px 0 rgba(94, 92, 154, 0.12);
  margin: auto;
  border-radius: 20px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  width: 100%;
}

@media (max-width: 1199.98px) {
  .register .form-container .form-card {
    margin: 30px auto 50px auto;
  }
}

@media (max-width: 575.98px) {
  .register .form-container .form-card {
    width: 100%;
    padding: 40px 15px;
  }
}

.register .form-container .form-card .form-card-parent {
  width: 100%;
  max-width: 500px;
}

.register .form-container .form-card .form-box-title {
  font-size: 1.5rem;
  text-align: center;
  font-weight: 700;
  color: #3e3f5e;
  font-family: "cairo";
}

.register .form-container .form-card .form {
  margin-top: 25px;
  width: 100%;
  position: relative;
}

.register .form-container .form-card .form .form-group {
  width: 100%;
  position: relative;
  margin: 10px 0;
}

.register .form-container .form-card .form .form-group label {
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
  pointer-events: none;
  display: block;
  margin: 0;
  line-height: 1em;
  letter-spacing: 1px;
  right: 15px;
  left: unset;
}

.register .form-container .form-card .form .form-group .form-control {
  -webkit-transition: border-color .2s ease-in-out;
  transition: border-color .2s ease-in-out;
  padding: 12px 18px 0 18px;
  width: 100%;
  border-radius: 12px;
}

.register .form-container .form-card .form .form-group .form-control:focus {
  -webkit-box-shadow: none;
          box-shadow: none;
  outline: none;
}

.register .form-container .form-card .form .form-group select {
  cursor: pointer;
}

.register .form-container .form-card .form .create-account-btn {
  text-decoration: none;
  width: 100%;
  margin: auto;
  color: #FFF;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  height: 50px;
  border-radius: 17px;
  font-size: .875rem;
  font-weight: 700;
  text-align: center;
  line-height: 50px;
  cursor: pointer;
  margin-top: 15px;
  -webkit-transition: background-color .2s ease-in-out;
  transition: background-color .2s ease-in-out;
  background-color: #51459e;
  -webkit-box-shadow: 4px 7px 12px 0 rgba(97, 93, 250, 0.2);
          box-shadow: 4px 7px 12px 0 rgba(97, 93, 250, 0.2);
  border: 0;
}

.register .form-container .form-card .form .create-account-btn svg {
  height: 18px;
  margin-left: 4px;
}

.register .form-container .form-card .form .create-account-btn svg path {
  fill: #FFF;
}

.register .form-container .form-card .form .create-account-btn:hover {
  background-color: #7868e6;
}

.register .form-container .form-card .form .form-check {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  margin: 10px 10px 20px 0;
  padding-left: 10px;
}

.register .form-container .form-card .form .form-check input {
  background-color: #fff;
  border: 1px solid #dedeea;
  height: 17px;
  width: 16px;
  position: unset;
  margin: 3px 5px 0 0px;
}

.register .form-container .form-card .form .form-check p {
  color: #2c2f32;
  font-size: .875rem;
  font-weight: 700;
  line-height: 22px;
  cursor: pointer;
  display: block;
  margin: 0;
}

.register .form-container .form-card .form .form-check p a {
  text-decoration: none;
  color: #7868e6;
}

.register .form-container .form-card .form p.text {
  margin-top: 30px;
  font-size: .875rem;
  line-height: 1.7142857143em;
  font-weight: 500;
  color: #3e3f5e;
}

.register .form-container .form-card .form p.text a {
  text-decoration: none;
  color: #51459e;
  font-weight: 700;
}

.register .form-container .form-card .form .active-input label {
  padding: 0 6px;
  font-size: 0.7rem;
  top: 7px;
  left: 14px;
}

.register .form-container .form-card .login-link a {
  color: #3e3f5e;
  font-weight: 700;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  margin: auto;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  margin-top: 20px;
}

.register .register-content {
  width: 100%;
  padding: 50px 150px;
  text-align: right;
}

@media (max-width: 1199.98px) {
  .register .register-content {
    width: 100%;
    padding-right: 20px;
  }
}

@media (max-width: 991.98px) {
  .register .register-content {
    text-align: center;
    margin: 50px auto;
    width: 90%;
  }
}

@media (max-width: 575.98px) {
  .register .register-content {
    text-align: center;
    margin: 50px auto;
    width: 100%;
    padding: 0;
  }
}

.register .register-content span {
  color: #ffb100;
  font-weight: 900;
  letter-spacing: 5px;
  word-spacing: 10px;
  font-size: 0.8rem;
  margin: auto;
  display: block;
}

@media (max-width: 575.98px) {
  .register .register-content span {
    font-size: 0.7rem;
    letter-spacing: 5px;
  }
}

.register .register-content h1 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 10px;
  display: block;
}

@media (max-width: 767.98px) {
  .register .register-content h1 {
    font-size: 1.5rem;
  }
}

@media (max-width: 575.98px) {
  .register .register-content h1 {
    font-size: 1.2rem;
  }
}

.register .register-content h1 a {
  text-decoration: none;
  color: #FFF;
}

.register .register-content p {
  font-size: 1.1rem;
  font-weight: 500;
  color: #f6f8ffa6;
  line-height: 30px;
}

@media (max-width: 767.98px) {
  .register .register-content p {
    font-size: 1rem;
    line-height: 20px;
  }
}

@media (max-width: 575.98px) {
  .register .register-content p {
    font-size: 0.9rem;
    display: block;
    margin-bottom: 30px;
  }
}

.register .register-content .register-links {
  margin-top: 30px;
}

.register .register-content .register-links a {
  text-decoration: none;
  text-decoration: none;
  background: #51459e;
  color: #FFF;
  padding: 11px 40px;
  border-radius: 17px;
  font-weight: 600;
  font-size: 0.8rem;
  margin-right: 0;
  border: 1px solid transparent;
}

@media (max-width: 575.98px) {
  .register .register-content .register-links {
    margin: 0 5px 0 5px;
  }
}

.register .register-content .register-links .register-login {
  border: 1px solid #FFF;
  background: transparent;
  color: #FFF;
}

.contact-line {
  text-align: center;
  color: #000;
  font-weight: 700;
  font-size: 0.9rem;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  padding-top: 26px;
}

.contact-line a {
  color: #51459e;
  margin: 0 5px;
  letter-spacing: 1px;
}

.month-overview-card {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  background-image: url(https://img.freepik.com/free-vector/gradient-grainy-gradient-texture_23-2148974142.jpg?w=1800&t=st=1694199269~exp=1694199869~hmac=17920f037023963b4692ff8edeae6c298a90f89a8a09920d62c8ed25ef207661);
  background-size: cover;
  background-position: center center;
  padding: 25px 25px;
  border-radius: 14px;
}

@media (max-width: 575.98px) {
  .month-overview-card {
    display: block;
  }
}

.month-overview-card .month-title {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.month-overview-card .month-title .month-num {
  background: #151521;
  color: #FFF;
  font-size: 1.8rem;
  font-weight: 700;
  height: 60px;
  width: 60px;
  border-radius: 14px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  margin-left: 15px;
  -webkit-box-flex: 0;
      -ms-flex: none;
          flex: none;
  background-repeat: no-repeat;
  background-position: center center;
}

@media (max-width: 575.98px) {
  .month-overview-card .month-title .month-num {
    font-size: 1.3rem;
    height: 45px;
    width: 45px;
  }
}

.month-overview-card .month-title .month-num span {
  font-family: "Poppins";
  font-weight: 700;
  margin-top: 3px;
  color: #FFF;
}

.month-overview-card .month-title .month-text {
  color: #FFF;
  font-size: 1.3rem;
  display: inline-block;
  max-width: 80%;
  text-align: right;
}

@media (max-width: 767.98px) {
  .month-overview-card .month-title .month-text {
    font-size: 1.2rem;
  }
}

@media (max-width: 575.98px) {
  .month-overview-card .month-title .month-text {
    width: 100%;
  }
}

.month-overview-card .month-title .month-text h3 {
  font-size: 1.3rem;
  font-weight: 700;
  margin: 0;
  color: #FFF;
  text-align: right;
  display: inline-block;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

@media (max-width: 767.98px) {
  .month-overview-card .month-title .month-text h3 {
    font-size: 1.2rem;
  }
}

@media (max-width: 575.98px) {
  .month-overview-card .month-title .month-text h3 {
    font-size: 0.9rem;
  }
}

.month-overview-card .month-title .month-text p {
  font-size: 1.3rem;
  font-weight: 600;
  margin: 0;
  text-align: right;
  color: #FFF;
  display: inline-block;
}

.month-overview-card .month-title .month-text span {
  display: inline-block;
  text-align: right;
}

.month-overview-card .course-progress {
  padding-top: 0;
  margin-top: 0;
  padding-bottom: 0px;
  width: 50%;
}

@media (max-width: 575.98px) {
  .month-overview-card .course-progress {
    margin: 10px auto 0 auto;
    width: 100%;
  }
}

.month-overview-card .course-progress .course-progress-info {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
}

.month-overview-card .course-progress .course-progress-info span {
  font-weight: 700;
  font-size: 0.8rem;
  color: #FFF;
}

.month-overview-card .course-progress .course-progress-content {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.month-overview-card .course-progress .course-persentage {
  font-weight: 700;
  font-size: 0.8rem;
  margin: 0 0 0 0;
  color: #FFF;
}

.month-overview-card .course-progress .progress {
  background: #FFF;
  height: 4px;
  width: 100%;
  position: relative;
  border-radius: 20px;
  margin-top: 10px;
}

.month-overview-card .course-progress .progress .inner-progress {
  background: #000;
  background: linear-gradient(-118deg, #d78b00, #ffe7a1) !important;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  z-index: 2;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
}

.month-overview-card .course-progress .course-score p {
  margin: 0 10px 0 0;
  font-size: 0.8rem;
  font-weight: 700;
  color: var(--p-color);
}

.month-sta {
  margin-top: 15px;
}

.month-sta .exp-statistics {
  background: var(--navbar-bg);
  -webkit-box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
  border-radius: 12px;
  margin-bottom: 15px;
}

.month-sta .exp-statistics .absence-chart {
  width: 100%;
  padding: 40px 20px;
}

.month-sta .exp-statistics .absence-chart .doughnut-chart {
  position: relative;
}

.month-sta .exp-statistics .absence-chart .doughnut-chart .canvas #graph {
  margin: 30px 0 30px 0;
  z-index: 2;
  position: relative;
}

.month-sta .exp-statistics .absence-chart .doughnut-chart .doughnut-text {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
  z-index: 1;
}

.month-sta .exp-statistics .absence-chart .doughnut-chart .doughnut-text .user-stat-title {
  font-weight: 700;
  font-size: 1.75rem;
  color: var(--p-color);
  margin: 0;
}

.month-sta .exp-statistics .absence-chart .doughnut-chart .doughnut-text .user-stat-text {
  margin: -3px 0 4px 0;
  color: #adafca;
  font-size: .75rem;
  font-weight: 700;
}

.month-sta .exp-statistics .absence-chart .chart-info .progress-arc-summary-title {
  color: var(--p-color);
  text-align: center;
  font-weight: 700;
  font-size: 1rem;
  margin-top: 25px;
  margin-bottom: 0;
}

.month-sta .exp-statistics .absence-chart .chart-info .progress-arc-summary-subtitle {
  margin-top: 2px;
  color: #8f91ac;
  font-size: .65rem;
  font-weight: 700;
  margin-bottom: 0;
}

.month-sta .exp-statistics .absence-chart .chart-info .progress-arc-summary-text {
  color: var(--p-color);
  margin-top: 35px;
  font-size: .8rem;
  font-weight: 500;
  line-height: 1.4285714286em;
  margin-bottom: 0;
}

.courses-registered {
  color: var(--p-color);
  padding: 32px 28px 38px 28px;
  border-radius: 12px;
  background-color: var(--navbar-bg);
  -webkit-box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
  margin-bottom: 15px;
  position: relative;
}

.courses-registered .widget-box-title {
  font-size: 0.8rem;
  font-weight: 700;
  color: var(--p-color);
  text-align: right;
}

.courses-registered .courses-registered-content {
  color: var(--p-color);
}

.courses-registered .courses-registered-content .courses-registered-preview {
  color: var(--p-color);
  margin-top: 25px;
}

.courses-registered .courses-registered-content .courses-registered-preview a {
  text-decoration: none;
}

.courses-registered .courses-registered-content .courses-registered-preview .media img {
  height: 30px;
  margin-left: 10px;
}

.courses-registered .courses-registered-content .courses-registered-preview .media .media-body {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
}

.courses-registered .courses-registered-content .courses-registered-preview .media .media-body h5 {
  color: var(--p-color);
  font-size: .75rem;
  font-weight: 700;
  text-align: right;
  margin: 0;
}

.courses-registered .courses-registered-content .courses-registered-preview .media .media-body .complete {
  color: #3e3f5e;
  line-height: 1.6em;
  font-size: 0.7rem;
  font-weight: 700;
  margin: 0;
  text-align: right;
  margin-top: 5px;
  margin-right: 2px;
}

.courses-registered .courses-registered-content .courses-registered-preview .media .media-body .complete span {
  color: #adafca;
}

.courses-registered .courses-registered-content .courses-registered-preview .progress {
  background: #e7e8ee;
  height: 4px;
  width: 100%;
  margin-top: 5px;
  position: relative;
}

.courses-registered .courses-registered-content .courses-registered-preview .progress .inner-progress {
  background: linear-gradient(-118deg, #0046ed, #00c5da) !important;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  z-index: 2;
}

a {
  text-decoration: none;
}

.month-content .month-content-card {
  background: var(--navbar-bg);
  -webkit-box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
  border-radius: 12px;
  margin: 15px 0 0 0;
  padding: 20px 25px;
  font-size: 0.9rem;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
}

@media (max-width: 575.98px) {
  .month-content .month-content-card {
    display: block;
  }
}

.month-content .month-content-card .month-content-card-title {
  text-align: right;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.month-content .month-content-card .month-content-card-title figure {
  height: 45px;
  width: 45px;
  margin-left: 15px;
  border-radius: 8px;
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  margin: 0;
}

.month-content .month-content-card .month-content-card-title .card-icon {
  height: 42px;
  width: 42px;
  margin-left: 15px;
  border-radius: 8px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  background: #151521;
  -webkit-box-flex: 0;
      -ms-flex: none;
          flex: none;
}

.month-content .month-content-card .month-content-card-title .card-icon svg {
  color: #FFF;
  height: 18px;
  width: 18px;
}

.month-content .month-content-card .month-content-card-title .month-content-card-info .upper-info span {
  font-size: 0.75rem;
  font-weight: 700;
  color: #8f91ac;
}

.month-content .month-content-card .month-content-card-title .month-content-card-info h3 {
  font-size: 0.9rem;
  font-weight: 700;
  color: var(--p-color);
}

.month-content .month-content-card .month-content-card-action .btn-transparent {
  text-decoration: none;
  width: 135px;
  margin-top: 0;
  background-color: transparent;
  border: 1px solid #dedeea;
  color: #151521c7;
  -webkit-box-shadow: none;
          box-shadow: none;
  height: 40px;
  font-size: .75rem;
  line-height: 37px;
  display: inline-block;
  border-radius: 10px;
  font-weight: 700;
  text-align: center;
  -webkit-transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
}

.month-content .month-content-card .month-content-card-action .btn-transparent:hover {
  background: var(--p-color);
  border-color: var(--p-color);
  color: #FFF;
  text-decoration: none;
}

@media (max-width: 575.98px) {
  .month-content .month-content-card .month-content-card-action .btn-transparent {
    margin-top: 10px;
    width: 100%;
  }
}

.month-content .opened-month-card .month-content-card-title .card-icon {
  background: #2ae99e;
  font-weight: 700;
  color: #FFF;
}

.month-content .opened-month-card .month-content-card-action .btn-transparent {
  text-decoration: none;
  width: 135px;
  margin-top: 0;
  background-color: transparent;
  border: 1px solid #151521;
  color: #151521c7;
  -webkit-box-shadow: none;
          box-shadow: none;
  height: 40px;
  font-size: .75rem;
  line-height: 37px;
  display: inline-block;
  border-radius: 10px;
  font-weight: 700;
  text-align: center;
  background: #151521;
  color: #FFF;
  -webkit-transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
}

.month-content .opened-month-card .month-content-card-action .btn-transparent:hover {
  background: var(--p-color);
  color: #FFF;
  text-decoration: none;
}

@media (max-width: 575.98px) {
  .month-content .opened-month-card .month-content-card-action .btn-transparent {
    margin-top: 10px;
    width: 100%;
  }
}

.col-lg-9 {
  padding: 0 6px !important;
}

@media (max-width: 575.98px) {
  .col-lg-9 {
    padding: 0 !important;
  }
}

.col-12,
.col-lg-3 {
  padding: 0 6px;
}

body .col-md-6,
body .col-lg-4 {
  padding: 0 8px;
}

body .content {
  padding-top: 20px;
}

@media (max-width: 575.98px) {
  body .content {
    width: 100%;
    -webkit-transform: translate(0, 60px);
            transform: translate(0, 60px);
    padding-bottom: 35px;
  }
}

.exam {
  position: relative;
  width: inherit;
}

.exam .exam-details {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  background: #1e1e2d;
  border-radius: 12px;
  padding: 15px 30px;
  text-align: right;
  position: -webkit-sticky;
  position: sticky;
  top: 15px;
  width: 100%;
  margin-bottom: 15px;
  z-index: 5;
  color: #FFF;
}

@media (max-width: 575.98px) {
  .exam .exam-details {
    padding: 15px 15px;
    background: #151521;
  }
}

@media (max-width: 575.98px) {
  .exam .exam-details {
    position: fixed;
    top: 0;
    right: 0;
    border-radius: 0;
    min-height: 100px;
  }
}

@media (max-width: 575.98px) {
  .exam .exam-details .exam-info {
    min-height: 70px;
  }
}

.exam .exam-details .exam-info span.tag {
  display: inline-block;
  font-size: 0.65rem;
  font-weight: 500;
  background: #615dfa;
  padding: 3px 7px;
  border-radius: 5px;
  margin-left: 3px;
  color: white;
}

.exam .exam-details .exam-info h5 {
  font-size: 1rem;
  margin: 7px 0 0 0;
  font-weight: 600;
}

@media (max-width: 575.98px) {
  .exam .exam-details .exam-info h5 {
    font-size: 0.9rem;
    margin: 10px 0 0 0;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
}

@media (max-width: 575.98px) {
  .exam .exam-details .exam-actions {
    position: absolute;
    top: 15px;
    left: 15px;
  }
}

.exam .exam-details .exam-actions .exam-time {
  color: #FFF;
}

.exam .exam-details .exam-actions .exam-time .timer {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.exam .exam-details .exam-actions .exam-time .timer svg {
  margin-right: 2px;
  height: 18px;
  width: 18px;
}

.exam .exam-details .exam-actions .exam-time .timer svg g [fill] {
  fill: #FFF;
}

.exam .exam-details .exam-actions .exam-time .timer p {
  margin: 0;
  margin-right: 2px;
}

.exam .exam-details .exam-actions .exam-time .time-progress {
  height: 3px;
  width: 82px;
  background: #615dfa;
  position: relative;
  border-radius: 20px;
}

.exam .exam-details .exam-actions .exam-time .time-progress .time-inner-progress {
  width: 99%;
  background: #f6f8ff;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  z-index: 2;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
}

@media (max-width: 991.98px) {
  .exam .quick-questions-container {
    position: fixed;
    top: 0;
    right: 0;
    z-index: 10;
    height: 100vh;
    width: 100%;
    display: none;
  }
}

.exam .quick-questions {
  background: var(--navbar-bg);
  border-radius: 12px;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  padding: 25px 20px;
  color: #3e3f5e;
}

@media (max-width: 1199.98px) {
  .exam .quick-questions {
    padding: 25px 15px;
  }
}

@media (max-width: 991.98px) {
  .exam .quick-questions {
    position: fixed;
    top: 0;
    right: 0;
    z-index: 10;
    border-radius: 0;
    -webkit-box-shadow: none;
            box-shadow: none;
    height: calc(100vh - 75px);
  }
}

@media (max-width: 575.98px) {
  .exam .quick-questions {
    height: calc(100vh - 60px);
  }
}

.exam .quick-questions .quick-questions-header {
  display: block;
  color: var(--p-color);
  padding-bottom: 12px;
  border-bottom: 1px solid var(--border-color);
  padding: 0 15px 15px 15px;
}

@media (max-width: 991.98px) {
  .exam .quick-questions .quick-questions-header {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    -webkit-box-pack: justify;
        -ms-flex-pack: justify;
            justify-content: space-between;
  }
}

.exam .quick-questions .quick-questions-header .i {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
}

.exam .quick-questions .quick-questions-header .i p {
  margin: 0;
  font-weight: 700;
  font-size: 0.8rem;
}

.exam .quick-questions .quick-questions-header .i span {
  background: #3e3f5e;
  color: #FFF;
  padding: 2px 5px;
  border-radius: 5px;
  font-size: 0.75rem;
  font-weight: 700;
  margin-right: 5px;
}

.exam .quick-questions .quick-questions-header .close-c {
  display: none;
}

.exam .quick-questions .quick-questions-header .close-c svg {
  height: 24px;
  width: 24px;
}

.exam .quick-questions .quick-questions-header .close-c svg g [fill] {
  fill: var(--p-color);
}

@media (max-width: 991.98px) {
  .exam .quick-questions .quick-questions-header .close-c {
    display: block;
  }
}

.exam .quick-questions .quick-questions-content {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
      flex-wrap: wrap;
  overflow: auto;
  height: 335px;
  position: relative;
  padding: 0 10px 0 0;
  margin-top: 15px;
}

@media (max-width: 991.98px) {
  .exam .quick-questions .quick-questions-content {
    display: block;
    text-align: right;
    height: calc(100vh - 225px);
    overflow: hidden;
  }
}

.exam .quick-questions .quick-questions-content::-webkit-scrollbar {
  display: none;
}

.exam .quick-questions .quick-questions-content .question-number {
  background: var(--body-bg);
  width: 30px;
  height: 30px;
  line-height: 30px;
  border-radius: 5px;
  font-size: 0.8rem;
  font-family: "font-en";
  padding-left: 2px;
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  text-align: center;
  font-weight: 700;
  margin: 6px;
  cursor: pointer;
  color: var(--p-color);
}

.exam .quick-questions .quick-questions-actions {
  margin-top: 15px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 15px 20px 0 20px;
  border-top: 1px solid var(--border-color);
}

@media (max-width: 1199.98px) {
  .exam .quick-questions .quick-questions-actions {
    padding: 15px 7px 0 7px;
  }
}

.exam .quick-questions .quick-questions-actions button.finish {
  border-radius: 7px;
  border: 0;
  -webkit-box-shadow: none;
  box-shadow: none;
  outline: none;
  background: #615dfa;
  padding: 0 15px;
  height: 35px;
  font-weight: 700;
  font-size: 0.75rem;
  color: #FFF;
}

.exam .quick-questions .quick-questions-actions .close-exam {
  color: var(--p-color);
  font-size: 0.75rem;
  font-weight: 700;
}

.exam .ques-container {
  border-radius: 12px;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  background: var(--navbar-bg);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

@media (max-width: 575.98px) {
  .exam .ques-container {
    margin-top: 80px;
    border-radius: 0;
  }
}

@media (max-width: 575.98px) {
  .exam .ques-container form {
    overflow: auto;
    height: calc(100vh - 180px);
    padding-bottom: 40px;
  }
}

.exam .questions {
  font-family: "cairo";
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques {
  padding: 20px;
  width: 100%;
  padding: 25px 25px 40px;
  margin-bottom: 12px;
  position: relative;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .ques-head {
  position: absolute;
  top: 20px;
  left: 15px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

@media (max-width: 767.98px) {
  .exam .questions .ques .ques-head {
    top: 10px;
    left: 50%;
    -webkit-transform: translate(-50%, 0);
            transform: translate(-50%, 0);
  }
}

.exam .questions .ques .ques-head .flag {
  display: none;
  cursor: pointer;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .ques-head .flag svg {
  height: 23px;
  width: 23px;
  padding: 3px;
  border-radius: 5px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  border: 1px solid #ffd13f;
}

.exam .questions .ques .ques-head .flag svg g [fill] {
  fill: #ffffff;
  stroke: #ffd13f;
  stroke-width: 2px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .ques-head .flag-active {
  cursor: pointer;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .ques-head .flag-active svg {
  height: 23px;
  width: 23px;
  background: #fff2ca;
  padding: 3px;
  border-radius: 5px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .ques-head .flag-active svg g [fill] {
  fill: #ffd13f;
  stroke-width: 0px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .ques-head .text-sticker {
  font-size: .8rem;
  height: 32px;
  padding: 0 10px;
  border-radius: 200px;
  background-color: var(--body-bg);
  font-weight: 700;
  line-height: 32px;
}

.exam .questions .ques .ques-head .text-sticker .exam-code {
  color: var(--p-color);
  letter-spacing: 0.8px;
}

.exam .questions .ques .question {
  display: block !important;
}

.exam .questions .ques .question .question-content {
  margin-bottom: 30px;
}

@media (max-width: 767.98px) {
  .exam .questions .ques .question .question-content {
    margin-top: 20px;
  }
}

.exam .questions .ques .question .question-content h4 {
  background: #615dfa;
  height: 27px;
  width: 27px;
  line-height: 28px;
  font-weight: 700;
  border-radius: 7px;
  color: #FFF;
  padding: 0px 14px;
  margin-left: 5px;
  margin: 0px 0 0 5px;
  font-size: 0.75rem;
}

.exam .questions .ques .question .question-content h4 span {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.exam .questions .ques .question .question-content p {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  text-align: right;
  margin: 0 5px;
  color: var(--p-color);
  font-weight: bold;
  font-size: 0.9rem;
  max-width: 75%;
  line-height: 25px;
}

@media (max-width: 767.98px) {
  .exam .questions .ques .question .question-content p {
    max-width: 100%;
    font-size: 0.85rem;
  }
}

.exam .questions .ques .question .question-img {
  margin: 20px auto;
}

.exam .questions .ques .question .question-img img {
  max-height: 240px;
  max-width: 240px;
}

.exam .questions .ques .questions-group .inputGroup {
  background-color: var(--body-bg);
  display: block;
  margin: 0;
  position: relative;
  color: var(--p-color);
  font-weight: bold;
  border-radius: 12px;
}

.exam .questions .ques .questions-group .inputGroup input {
  height: 100%;
  -webkit-box-ordinal-group: 2;
      -ms-flex-order: 1;
          order: 1;
  z-index: 4;
  position: absolute;
  right: 5px;
  top: 10px;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  cursor: pointer;
  opacity: 0;
  outline: none;
  display: block;
  width: 100%;
  text-align: right;
  padding: 15px 30px;
  border-radius: 12px;
  margin-top: 16px;
}

.exam .questions .ques .questions-group .inputGroup .abgd {
  height: 36px;
  width: 36px;
  border-radius: 12px;
  background-color: var(--navbar-bg);
  position: absolute;
  top: 50%;
  right: 6px;
  -webkit-transform: translate(0px, -50%);
          transform: translate(0px, -50%);
  z-index: 3;
  line-height: 36px;
  font-weight: bold;
  font-family: "cairo";
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.exam .questions .ques .questions-group .inputGroup .abgd span {
  color: var(--p-color);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  font-size: 0.85rem;
}

.exam .questions .ques .questions-group .inputGroup .correct {
  background: #2ae99e !important;
}

.exam .questions .ques .questions-group .inputGroup .correct span {
  color: #FFF !important;
}

.exam .questions .ques .questions-group .inputGroup .wrong {
  background: #ee4266 !important;
}

.exam .questions .ques .questions-group .inputGroup .wrong span {
  color: #FFF !important;
}

.exam .questions .ques .questions-group .inputGroup .answer {
  width: 100%;
  display: block;
  position: relative;
  z-index: 2;
  -webkit-transition: color 200ms ease-in;
  transition: color 200ms ease-in;
  overflow: hidden;
  background: var(--body-bg);
  padding: 15px 60px 15px 10px;
  border-radius: 12px;
  text-align: center;
  margin-top: 15px;
  cursor: pointer;
}

.exam .questions .ques .questions-group .inputGroup .answer p {
  margin: 0;
  font-size: 0.8rem;
}

.exam .questions .ques .questions-group .inputGroup .answer:before {
  width: 100%;
  height: 10px;
  border-radius: 50%;
  content: '';
  background-color: #ffd13f;
  position: absolute;
  left: 50%;
  top: 50%;
  -webkit-transform: translate(-50%, -50%) scale3d(1, 1, 1);
  transform: translate(-50%, -50%) scale3d(1, 1, 1);
  -webkit-transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
  transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
  opacity: 0;
  z-index: -1;
}

.exam .form-actions {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 20px 25px;
  border-top: 1px solid var(--border-color);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

@media (max-width: 575.98px) {
  .exam .form-actions {
    position: fixed;
    bottom: 10px;
    right: 0;
    width: 100%;
    background: var(--navbar-bg);
    z-index: 9;
    padding: 20px 15px;
  }
}

.exam .form-actions .form-button button {
  border-radius: 8px;
  border: 0;
  -webkit-box-shadow: none;
          box-shadow: none;
  outline: none;
  background: var(--body-bg);
  width: 100px;
  height: 40px;
  font-weight: 700;
  font-size: 0.7rem;
  color: var(--p-color);
}

.exam .form-actions .form-button button svg {
  height: 20px;
  width: 20px;
  margin: 0 5px;
  background: var(--navbar-bg);
  border-radius: 5px;
  height: 20px;
  padding: 2px;
}

.exam .form-actions .form-button button svg g [fill] {
  fill: #615dfa;
}

.exam .form-actions .form-button .go-quick {
  width: auto;
  background: #615dfa;
  color: #FFFF;
  line-height: 36px;
  font-size: 0.65rem;
  height: 37px;
  padding: 0 10px;
  display: none;
}

@media (max-width: 991.98px) {
  .exam .form-actions .form-button .go-quick {
    display: block;
  }
}

@media (max-width: 575.98px) {
  .exam .form-actions .form-button .go-quick .text-sm-none {
    display: none;
  }
}

.exam .form-actions .form-button .go-quick svg {
  background: none;
  margin: 0 2px;
}

.exam .form-actions .form-button .go-quick svg g [fill] {
  fill: #FFF;
}

.exam .form-actions .form-button .finish {
  background: #615dfa;
  color: #FFF;
}

.exam button.exit {
  text-decoration: none;
  width: 280px;
  margin: 20px auto 40px auto;
  color: #FFF;
  background-color: #51459e;
  -webkit-box-shadow: 4px 7px 12px 0 rgba(97, 93, 250, 0.2);
          box-shadow: 4px 7px 12px 0 rgba(97, 93, 250, 0.2);
  display: inline-block;
  height: 48px;
  border-radius: 10px;
  font-size: .875rem;
  font-weight: 700;
  text-align: center;
  line-height: 48px;
  cursor: pointer;
  -webkit-transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out;
  transition: background-color .2s ease-in-out,color .2s ease-in-out,border-color .2s ease-in-out,box-shadow .2s ease-in-out,-webkit-box-shadow .2s ease-in-out;
  -webkit-box-shadow: 3px 5px 10px 0 rgba(62, 63, 94, 0.2);
          box-shadow: 3px 5px 10px 0 rgba(62, 63, 94, 0.2);
}

.exam button.exit svg {
  height: 18px;
  margin-left: 4px;
}

.exam button.exit svg path {
  fill: #FFF;
}

.exam button.exit:hover {
  background: #1bc5d4;
}

.exam .answering-info {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  background: var(--navbar-bg);
  padding: 20px 35px;
  border-radius: 12px;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  margin-top: 12px;
}

@media (max-width: 575.98px) {
  .exam .answering-info {
    display: none;
  }
}

.exam .answering-info .answer-info-global {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.exam .answering-info .answer-info-global p {
  margin: 0;
  border-radius: 2px;
  font-weight: 700;
  font-size: 0.6rem;
  background: #615dfa;
  width: 8px;
  height: 8px;
  line-height: 20px;
}

.exam .answering-info .answer-info-global span {
  font-size: 0.65rem;
  color: var(--p-color);
  margin: 0 7px;
  font-weight: 500;
}

.exam .hash {
  color: #51459e !important;
  margin-right: 4px !important;
  margin-left: 4px !important;
}

.scrollbar-y {
  right: 0;
}

.ps__rail-y {
  right: 0 !important;
}

.ps__rail-y .ps__thumb-y {
  background: #637099;
  opacity: 1 !important;
  width: 5px;
}

.ps .ps__rail-x:hover, .ps .ps__rail-y:hover, .ps .ps__rail-x:focus, .ps .ps__rail-y:focus, .ps .ps__rail-x.ps--clicking, .ps .ps__rail-y.ps--clicking {
  background-color: var(--body-bg);
  opacity: 1;
  width: 11px;
  border-radius: 50px;
}

.ps__rail-y:hover > .ps__thumb-y, .ps__rail-y:focus > .ps__thumb-y, .ps__rail-y.ps--clicking .ps__thumb-y {
  background: #615dfa;
  opacity: 1;
  width: 7px;
}

input:checked ~ .abgd {
  background: #ffd13f !important;
}

input:checked ~ .abgd span {
  color: #FFF !important;
}

.correct {
  background: #2ae99e !important;
  color: #FFF !important;
}

.correct span {
  color: #FFF !important;
}

.wrong {
  background: #ee4266 !important;
  color: #FFF !important;
}

.wrong span {
  color: #FFF !important;
}

.opened {
  background: #615dfa !important;
  color: #ffffff !important;
}

.opened span {
  color: #FFF !important;
}

.not-opened {
  background: #f6f8ff !important;
  color: #3e3f5e;
}

.not-opened span {
  color: #FFF !important;
}

.mark {
  background: #ffd13f !important;
  color: #FFF !important;
  padding: 0;
}

.mark span {
  color: #FFF !important;
}

.col-xl-4,
.col-lg-5,
.col-xl-8,
.col-lg-7 {
  padding: 0 8px;
}

.course-sidebar {
  background: #FFF;
  color: #3e3f5e;
  text-align: right;
  font-size: 0.9rem;
  height: calc(100vh - 135px);
  overflow: auto;
  margin: 0 0 0 0;
  padding: 0;
  border-radius: 12px;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  padding-bottom: 25px;
}

@media (max-width: 991.98px) {
  .course-sidebar {
    height: 100%;
  }
}

.course-sidebar::-webkit-scrollbar {
  display: none;
}

.course-sidebar .sidebar-content .course-head {
  padding: 30px 30px 0 30px;
}

.course-sidebar .sidebar-content .course-head .back {
  display: inline-block;
  background: #f6f8ff;
  border-radius: 50px;
  padding: 5px 15px;
  color: #3e3f5e;
  font-size: 0.8rem;
  font-weight: 500;
}

.course-sidebar .sidebar-content .course-head .back svg {
  height: 20px;
  width: 20px;
}

.course-sidebar .sidebar-content .course-head .back svg g [fill] {
  fill: #6c5dd3;
}

.course-sidebar .sidebar-content .course-head .course-name {
  font-size: 1.2rem;
  font-weight: 700;
  color: #3e3f5e;
  letter-spacing: 0;
}

.course-sidebar .sidebar-content .course-head .course-progress {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-bottom: 1px solid #eaeaf5;
  padding-bottom: 15px;
  margin-bottom: 15px;
}

.course-sidebar .sidebar-content .course-head .course-progress .course-persentage {
  font-weight: 700;
  font-size: 0.8rem;
  margin: 0 0 0 10px;
}

.course-sidebar .sidebar-content .course-head .course-progress .progress {
  background: #eeeffd;
  height: 4px;
  width: 100%;
  position: relative;
  border-radius: 20px;
}

.course-sidebar .sidebar-content .course-head .course-progress .progress .inner-progress {
  background: #7868e6;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  z-index: 2;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  -webkit-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  width: 0%;
}

.course-sidebar .sidebar-content .course-head .course-progress .course-score p {
  margin: 0 10px 0 0;
  font-size: 0.8rem;
  font-weight: 700;
}

.course-sidebar .sidebar-content .course-content .head-parent {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 0 30px;
}

.course-sidebar .sidebar-content .course-content .head-parent .text {
  font-weight: 700;
  font-size: 0.8rem;
  margin: 0px 3px 5px 0;
}

.course-sidebar .sidebar-content .course-content .course-item .course-unit {
  padding: 15px 25px;
  background: #fbfcff;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  cursor: pointer;
  border: 1px solid #eeeffd;
  border-radius: 12px;
  margin: 10px 25px 0 25px;
}

.course-sidebar .sidebar-content .course-content .course-item .course-unit .course-unit-head {
  color: #3e3f5e;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.course-sidebar .sidebar-content .course-content .course-item .course-unit .course-unit-head svg {
  height: 15px;
  width: 15px;
  margin-left: 5px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.course-sidebar .sidebar-content .course-content .course-item .course-unit .course-unit-head .course-unit-title {
  margin: 0;
  font-size: 0.8rem;
  font-weight: 700;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.course-sidebar .sidebar-content .course-content .course-item .course-unit .course-info {
  color: #3e3f5e;
}

.course-sidebar .sidebar-content .course-content .course-item .course-unit .course-info p {
  margin: 0;
  font-size: 0.8rem;
  font-weight: 700;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons {
  display: none;
  padding-bottom: 20px;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson {
  color: #3e3f5e;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 20px 40px 0px 40px;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson .course-lesson-head {
  color: #3e3f5e;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson .course-lesson-head svg {
  height: 27px;
  width: 27px;
  background: #eeeffd;
  border-radius: 10px;
  text-align: center;
  margin: 0 0 0 10px;
  line-height: 20px;
  padding: 3px;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson .course-lesson-head svg g [fill] {
  fill: #7868e6;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson .course-lesson-head .course-lesson-title {
  margin: 0;
  font-size: 0.75rem;
  font-weight: 700;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson-active .course-lesson-head {
  text-decoration: none;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson-active .course-lesson-head svg {
  background: #7868e6;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson-active .course-lesson-head svg g [fill] {
  fill: #FFF;
}

.course-sidebar .sidebar-content .course-content .course-item .course-lessons .course-lesson-active .course-lesson-head .course-lesson-title {
  color: #7868e6;
}

.course-sidebar .sidebar-content .course-content .course-item-open .course-unit .course-unit-head svg {
  -webkit-transform: rotate(-90deg);
          transform: rotate(-90deg);
}

.course-sidebar .sidebar-content .course-content .course-item-open .course-lessons {
  display: block;
}

.course-check {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  font-size: 16px;
  color: #00104B;
  position: relative;
}

.course-check input[type="checkbox"] {
  z-index: 2;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  border-radius: 50%;
  opacity: 0;
  cursor: pointer;
}

.course-check label {
  margin-bottom: 0;
}

.course-check .cbx {
  -webkit-user-select: none;
  -moz-user-select: none;
   -ms-user-select: none;
       user-select: none;
  -webkit-tap-highlight-color: transparent;
  cursor: pointer;
}

.course-check .cbx span {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}

.course-check .cbx span:first-child {
  background: #eeeffd;
  position: relative;
  width: 22px;
  height: 22px;
  border-radius: 50%;
  -webkit-transform: scale(1);
          transform: scale(1);
  vertical-align: middle;
  border: 1px solid #dbdbff;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.course-check .cbx span:first-child svg {
  position: absolute;
  z-index: 1;
  top: 5px;
  left: 5px;
  height: 11px;
  width: 11px;
  fill: none;
  stroke: white;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-dasharray: 16px;
  stroke-dashoffset: 16px;
  -webkit-transition: all 0.3s ease;
  transition: all 0.3s ease;
  -webkit-transition-delay: 0.1s;
          transition-delay: 0.1s;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}

.course-check .cbx span:first-child:before {
  content: "";
  width: 100%;
  height: 100%;
  background: #506EEC;
  display: block;
  -webkit-transform: scale(0);
          transform: scale(0);
  opacity: 1;
  border-radius: 50%;
  -webkit-transition-delay: 0.2s;
          transition-delay: 0.2s;
}

.course-check .cbx span:last-child {
  margin-left: 0;
}

.course-check .cbx span:last-child:after {
  content: "";
  position: absolute;
  top: 8px;
  left: 0;
  height: 1px;
  width: 100%;
  background: #B9B8C3;
  -webkit-transform-origin: 0 0;
          transform-origin: 0 0;
  -webkit-transform: scaleX(0);
          transform: scaleX(0);
}

.course-check .cbx:hover span:first-child {
  border-color: #7868e6;
}

.course-check .inp-cbx:checked + .cbx span:first-child {
  border-color: #7868e6;
  background: #7868e6;
  -webkit-animation: check 0.6s ease;
          animation: check 0.6s ease;
}

.course-check .inp-cbx:checked + .cbx span:first-child svg {
  stroke-dashoffset: 0;
}

.course-check .inp-cbx:checked + .cbx span:first-child:before {
  -webkit-transform: scale(2.2);
          transform: scale(2.2);
  opacity: 0;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}

.course-check .inp-cbx:checked + .cbx span:last-child {
  color: #B9B8C3;
  -webkit-transition: all 0.3s ease;
  transition: all 0.3s ease;
}

@-webkit-keyframes check {
  50% {
    -webkit-transform: scale(1.2);
            transform: scale(1.2);
  }
}

@keyframes check {
  50% {
    -webkit-transform: scale(1.2);
            transform: scale(1.2);
  }
}

.coures-content {
  overflow: auto;
}

.coures-content::-webkit-scrollbar {
  display: none;
}

.coures-content .course-details {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  background: #FFF;
  color: #3e3f5e;
  border-radius: 12px;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  font-size: 0.9rem;
  padding: 25px 25px;
  margin-bottom: 15px;
}

@media (max-width: 575.98px) {
  .coures-content .course-details {
    margin-bottom: 8px;
  }
}

.coures-content .course-details .course-lesson-head {
  color: #3e3f5e;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.coures-content .course-details .course-lesson-head svg {
  height: 27px;
  width: 27px;
  background: #eeeffd;
  border-radius: 10px;
  text-align: center;
  margin: 0 0 0 10px;
  line-height: 20px;
  padding: 3px;
}

.coures-content .course-details .course-lesson-head svg g [fill] {
  fill: #7868e6;
}

.coures-content .course-details .course-lesson-head .course-lesson-title {
  margin: 0;
  font-size: 0.9rem;
  font-weight: 700;
  overflow: hidden;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.coures-content .course-video {
  max-width: 100%;
  background: #FFF;
  color: #3e3f5e;
  border-radius: 12px;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  padding: 25px 25px;
  margin-bottom: 15px;
}

@media (max-width: 575.98px) {
  .coures-content .course-video {
    padding: 0;
    margin-bottom: 8px;
  }
}

.coures-content .course-video video {
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  border-radius: 12px;
}

.coures-content .course-video .plyr__control--overlaid {
  background: #7868e6;
}

.coures-content .course-video .plyr--full-ui input[type=range] {
  color: #7868e6;
}

.coures-content .course-video .plyr--video .plyr__control.plyr__tab-focus, .coures-content .course-video .plyr--video .plyr__control:hover, .coures-content .course-video .plyr--video .plyr__control[aria-expanded=true] {
  background: #7868e6;
}

.coures-content .course-video .plyr__video-wrapper {
  background: #FFF;
}

.coures-content .course-video .plyr--video {
  border-radius: 12px;
}

.coures-content .course-video .plyr__poster {
  border-radius: 12px;
}

.col-lg-4,
.col-md-6,
.col-sm-6,
.col-12 {
  padding: 0 6px;
}

.payments-content a {
  text-decoration: none;
  display: block;
}

.payments-content .pay-card {
  background: var(--navbar-bg);
  border-radius: 12px;
  padding: 20px 20px 0;
  margin: 0 0 10px 0;
  height: 200px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  -webkit-box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
  cursor: pointer;
}

.payments-content .pay-card:hover .icon-parent {
  -webkit-transform: translate(0, -5px);
          transform: translate(0, -5px);
}

.payments-content .pay-card .pay-card-title {
  font-weight: 700;
  color: var(--p-color);
  font-size: 0.8rem;
  margin-bottom: 15px;
}

.payments-content .pay-card li .pay-item {
  margin-top: 20px;
}

.payments-content .pay-card li .pay-item .cir {
  width: 20px;
  height: 20px;
  line-height: 20px;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-radius: 50%;
  -webkit-transition: border-color .2s ease-in-out,background-color .2s ease-in-out;
  transition: border-color .2s ease-in-out,background-color .2s ease-in-out;
  border: 1px solid var(--border-color);
  background-color: var(--navbar-bg);
  margin-left: 10px;
  cursor: pointer;
}

.payments-content .pay-card li .pay-item .active {
  border: 6px solid #51459e;
}

.payments-content .pay-card li .pay-item .cir-title {
  font-size: .875rem;
  font-weight: 700;
  line-height: 22px;
  color: #2c2f32;
  cursor: pointer;
  margin-top: -1px;
  margin-bottom: 0;
}

.payments-content .pay-card li .numbers-menu {
  padding-right: 25px;
}

.payments-content .pay-card li .numbers-menu .num {
  margin: 10px 0 0 0;
  font-weight: 400;
  letter-spacing: 0.6px;
}

.payments-content .pay-card li .show {
  display: none;
}

.payments-content .pay-card .pay-card-content .icon-parent {
  height: 50px;
  width: 50px;
  border-radius: 14px;
  margin: auto;
  line-height: 50px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  margin-bottom: 15px !important;
}

.payments-content .pay-card .pay-card-content .icon-parent svg {
  height: 26px;
  width: 26px;
  fill: #FFF !important;
  padding-left: 1px;
  margin-top: -4px;
}

.payments-content .pay-card .pay-card-content h6 {
  margin: 15px 0 5px 0;
  color: var(--p-color);
  font-size: 0.8rem;
  font-weight: 700 !important;
}

.payments-content .pay-card .pay-card-content p {
  margin: 0;
  font-size: 0.8rem;
  color: #adafca;
}

.payments-content .pay-card .soon {
  position: absolute;
  top: 16px;
  left: 0px;
}

@media (max-width: 767.98px) {
  .payments-content .pay-card .soon {
    top: 16px;
    left: 20px;
  }
}

.payments-content .pay-card .soon .text-sticker {
  font-size: .8rem;
  height: 32px;
  padding: 0 14px;
  border-radius: 200px;
  background-color: var(--navbar-bg);
  -webkit-box-shadow: 3px 5px 20px 0 rgba(94, 92, 154, 0.12);
  box-shadow: 3px 5px 20px 0 rgba(94, 92, 154, 0.12);
  font-weight: 700;
  line-height: 32px;
}

.payments-content .pay-card .soon .text-sticker .exam-code {
  color: var(--p-color);
  letter-spacing: 0.8px;
}

.payments-history {
  background: var(--navbar-bg);
  padding: 20px 35px;
  border-radius: 12px;
  -webkit-box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
}

@media (max-width: 575.98px) {
  .payments-history {
    padding: 20px 10px;
  }
}

.payments-history .absence-head {
  margin: 10px 0 30px 0;
}

.payments-history .absence-head p {
  color: var(--p-color);
  font-weight: 700;
  font-size: 0.85rem;
  text-align: right;
  margin: 0;
}

.payments-history .absence-head .payments-tabs {
  text-align: left !important;
  margin-right: auto;
  width: auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  height: auto;
  padding-left: 20px;
  border: none;
  font-size: .75rem;
  cursor: pointer;
  background-color: var(--navbar-bg);
  border-radius: 12px;
  font-weight: 700;
  color: var(--p-color);
  -webkit-transition: border-color .2s ease-in-out;
  transition: border-color .2s ease-in-out;
}

.payments-history .absence-head .payments-tabs .payments-tab {
  margin: 0 10px;
  font-size: 0.75rem;
}

.payments-history .absence-head .payments-tabs .active {
  color: #51459e;
}

.payments-history .table {
  display: none;
}

.payments-history .table td,
.payments-history .table th {
  border: 0;
  padding: 1.2rem 0 0rem 0;
  font-size: .8rem;
  font-weight: 700;
  color: var(--p-color);
}

@media (max-width: 575.98px) {
  .payments-history .table td,
  .payments-history .table th {
    font-size: .6rem;
  }
}

.payments-history .table thead th {
  border-bottom: 1px solid var(--border-color);
  padding: 1rem 0 1rem 0;
  font-size: .7rem;
  font-weight: 700;
  color: var(--p-color);
}

@media (max-width: 575.98px) {
  .payments-history .table thead th {
    font-size: .6rem;
  }
}

.payments-history .table .light {
  color: #8f91ac;
  font-weight: 500;
  font-size: .8rem;
  font-weight: 500;
}

@media (max-width: 575.98px) {
  .payments-history .table .light {
    font-size: .6rem;
  }
}

.payments-history .table .pending {
  color: #8f91ac;
}

.payments-history .table .done {
  color: #51459e;
}

.payments-history .table .cur {
  margin-left: 5px;
  color: #51459e;
}

.payments-history .table button {
  color: #FFF;
  width: 80px;
  background: var(--main-color);
  border-radius: 5px;
  line-height: 17px;
  height: 30px;
  font-weight: 700;
  font-size: 0.7rem;
  -webkit-box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 10px 0 rgba(94, 92, 154, 0.06);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  outline: none;
}

@media (max-width: 575.98px) {
  .payments-history .table button {
    font-size: .6rem;
    width: 50px;
  }
}

.payments-history .table button:hover {
  background: #2c2f32;
}

.payments-history .table button:active {
  outline: none;
}

.payments-history .show {
  display: table;
}

.hash {
  color: #51459e !important;
  margin-right: 4px !important;
}

.popup {
  opacity: 0.8;
  height: 100vh;
  width: 100vw;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 9999999999999999999;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, -webkit-transform 0.3s ease-in-out;
  transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, -webkit-transform 0.3s ease-in-out;
  transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, transform 0.3s ease-in-out;
  transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, transform 0.3s ease-in-out, -webkit-transform 0.3s ease-in-out;
  overflow: auto;
}

.popup .popup-overlay {
  background-color: rgba(21, 21, 31, 0.96);
  opacity: 0.8;
  height: 100vh;
  width: 100vw;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 9999999999999999999;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, -webkit-transform 0.3s ease-in-out;
  transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, -webkit-transform 0.3s ease-in-out;
  transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, transform 0.3s ease-in-out;
  transition: opacity 0.5s ease-in-out 0s, visibility 0.5s ease-in-out 0s, transform 0.3s ease-in-out, -webkit-transform 0.3s ease-in-out;
  overflow: auto;
}

.popup .popup-content {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 9999999999999999999999999999999999999;
  -webkit-transform: translate(-50%, -100px);
          transform: translate(-50%, -100px);
  color: var(--p-color);
  -webkit-transition: -webkit-transform 0.5s ease-in-out;
  transition: -webkit-transform 0.5s ease-in-out;
  transition: transform 0.5s ease-in-out;
  transition: transform 0.5s ease-in-out, -webkit-transform 0.5s ease-in-out;
}

@media (max-width: 1199.98px) {
  .popup .popup-content {
    -webkit-transform: translate(-50%, -60%);
            transform: translate(-50%, -60%);
  }
}

@media (max-width: 575.98px) {
  .popup .popup-content {
    width: 90%;
  }
}

.popup .popup-content .form-container {
  height: 100%;
}

.popup .popup-content .form-container .form-card {
  background: var(--navbar-bg);
  width: 475px;
  padding: 50px 55px;
  border-radius: 12px;
  -webkit-box-shadow: 0 0 60px 0 rgba(94, 92, 154, 0.12);
          box-shadow: 0 0 60px 0 rgba(94, 92, 154, 0.12);
  position: absolute;
  top: 50%;
  left: 54%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
}

@media (max-width: 1199.98px) {
  .popup .popup-content .form-container .form-card {
    position: static;
    -webkit-transform: translate(0, 0);
            transform: translate(0, 0);
    margin: 30px auto;
  }
}

@media (max-width: 575.98px) {
  .popup .popup-content .form-container .form-card {
    width: 100%;
    padding: 40px 15px;
  }
}

.popup .popup-content .form-container .form-card .close-o {
  height: 35px;
  width: 35px;
  line-height: 35px;
  border-radius: 12px;
  background-color: var(--main-color);
  position: absolute;
  top: -15px;
  right: -15px;
  text-align: center;
  cursor: pointer;
}

.popup .popup-content .form-container .form-card .close-o svg {
  height: 12px;
  width: 12px;
  fill: #FFF;
  stroke: #FFF;
}

.popup .popup-content .form-container .form-card .form-box-title {
  font-size: 1.4rem;
  text-align: center;
  font-weight: 700;
  color: var(--p-color);
  margin-bottom: 40px;
}

.popup .popup-content .form-container .form-card .more-info {
  font-weight: 700;
  color: var(--p-color);
  margin: 5px 0;
}

.popup .popup-content .form-container .form-card .more-info .light {
  color: #adafca;
  font-weight: 700;
  font-size: .9rem;
}

.popup .popup-content .form-container .form-card .form {
  margin-top: 0;
  width: 100%;
  position: relative;
}

.popup .popup-content .form-container .form-card .form .col-12,
.popup .popup-content .form-container .form-card .form .col-6 {
  padding: 0 10px 0 10px;
}

.popup .popup-content .form-container .form-card .form .form-group {
  width: 100%;
  position: relative;
  margin: 10px 0;
}

.popup .popup-content .form-container .form-card .form .form-group label {
  color: #adafca;
  font-size: 0.85rem;
  font-weight: 600;
  position: absolute;
  top: 19px;
  right: 20px;
  -webkit-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
  pointer-events: none;
  display: block;
  margin: 0;
  line-height: 1em;
}

.popup .popup-content .form-container .form-card .form .form-group .form-control {
  height: 52px;
  padding: 0 18px;
  background-color: var(--navbar-bg);
  border: 1px solid var(--border-color);
  color: var(--p-color);
  -webkit-transition: border-color .2s ease-in-out;
  transition: border-color .2s ease-in-out;
  width: 100%;
  border-radius: 12px;
  font-size: 0.9rem;
  font-weight: 700;
}

.popup .popup-content .form-container .form-card .form .form-group .form-control:focus {
  border-color: var(--main-color);
  -webkit-box-shadow: none;
          box-shadow: none;
  outline: none;
}

.popup .popup-content .form-container .form-card .form .form-group select {
  cursor: pointer;
}

.popup .popup-content .form-container .form-card .form .create-account-btn {
  text-decoration: none;
  width: 100%;
  margin: auto;
  color: #FFF;
  display: inline-block;
  height: 48px;
  border-radius: 10px;
  font-size: .875rem;
  font-weight: 700;
  text-align: center;
  line-height: 48px;
  cursor: pointer;
  margin-top: 15px;
  -webkit-transition: background-color .2s ease-in-out;
  transition: background-color .2s ease-in-out;
  background-color: var(--main-color);
  border: 0;
}

.popup .popup-content .form-container .form-card .form .create-account-btn svg {
  height: 18px;
  margin-left: 4px;
}

.popup .popup-content .form-container .form-card .form .create-account-btn svg path {
  fill: #FFF;
}

.popup .popup-content .form-container .form-card .form .create-account-btn:hover {
  background-color: var(--main-color);
}

.popup .popup-content .form-container .form-card .form p.text {
  margin-top: 30px;
  font-size: .875rem;
  line-height: 1.7142857143em;
  font-weight: 500;
  color: var(--p-color);
}

.popup .popup-content .form-container .form-card .form p.text a {
  text-decoration: none;
  color: #51459e;
  font-weight: 700;
}

.popup .popup-content .form-container .form-card .form .active-input label {
  background: var(--navbar-bg);
  padding: 0 6px;
  font-size: 0.7rem;
  top: -6px;
  right: 12px;
}

.popup .popup-content .form-container .pay-card .pay-card-title {
  font-weight: 700;
  color: var(--p-color);
  font-size: 0.8rem;
  margin-bottom: 15px;
  margin-top: 15px;
}

.open-popup {
  opacity: 1 !important;
  visibility: visible !important;
}

.open-popup .popup-overlay {
  opacity: 1 !important;
  visibility: visible !important;
}

.open-popup .popup-content {
  -webkit-transform: translate(-50%, -50%) !important;
          transform: translate(-50%, -50%) !important;
}

.filepond--credits {
  display: none;
}

.filepond--drip {
  background: var(--navbar-bg);
  opacity: 1;
  border: 1px solid var(--border-color);
  color: var(--p-color);
}

.filepond--drop-label {
  color: var(--p-color);
}

body {
  font-family: "cairo";
  direction: rtl;
  text-align: right;
  color: var(--a-light);
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

body .header {
  background: var(--navbar-bg);
  color: #2c2f32;
  height: 75px;
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 5;
  padding: 0 0 0 0;
}

@media (max-width: 575.98px) {
  body .header {
    height: 60px;
    padding: 0 0 0 0;
  }
}

@media (min-width: 576px) {
  body .header .container {
    max-width: 720px;
  }
}

@media (min-width: 768px) {
  body .header .container {
    max-width: 720px;
  }
}

@media (min-width: 992px) {
  body .header .container {
    max-width: 960px;
  }
}

@media (min-width: 1200px) {
  body .header .container {
    max-width: 1140px;
  }
}

body .header .header-content {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
}

@media (max-width: 575.98px) {
  body .header .header-content {
    padding: 0 0 0 0;
  }
}

body .header .header-content .header-line {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

body .header .sidemenu-trigger {
  margin: 0 15px 0 0;
  background: #f5f8fa;
  border-radius: 12px;
  height: 45px;
  width: 45px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  background: var(--body-bg);
}

@media (max-width: 575.98px) {
  body .header .sidemenu-trigger {
    height: 35px;
    width: 35px;
  }
}

@media (max-width: 575.98px) {
  body .header .sidemenu-trigger {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    margin-left: 15px;
  }
}

body .header .sidemenu-trigger svg {
  height: 23px;
  width: 23px;
  fill: var(--p-color);
  -webkit-transition: all 0.1s ease-in-out;
  transition: all 0.1s ease-in-out;
  cursor: pointer;
}

body .header .sidemenu-trigger:hover svg {
  fill: var(--p-color);
}

body .header .navbar-actions {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

body .header .navbar-actions .navbar-brand {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  margin-right: 0;
  margin-left: 0;
}

@media (max-width: 991.98px) {
  body .header .navbar-actions .navbar-brand {
    margin: 0;
  }
}

body .header .navbar-actions .navbar-brand img {
  width: 75px;
  margin: 0px 0px 0px 0;
}

@media (max-width: 575.98px) {
  body .header .navbar-actions .navbar-brand img {
    width: 50px;
  }
}

body .header .navbar-actions .navbar-brand a {
  text-decoration: none;
  display: block;
}

body .header .navbar-actions .navbar-brand h3 {
  font-size: 1.75rem;
  color: var(--p-color);
  font-family: 'changa';
  font-weight: 600;
  margin: 0;
}

@media (max-width: 575.98px) {
  body .header .navbar-actions .navbar-brand h3 {
    font-size: 1rem;
    color: var(--p-color);
  }
}

body .header .search {
  width: 100%;
}

@media (max-width: 575.98px) {
  body .header .search {
    display: none !important;
  }
}

body .header .search .search-bar {
  height: 75px;
  margin: 0 15px;
  width: 100%;
}

@media (max-width: 575.98px) {
  body .header .search .search-bar {
    width: 100%;
    height: 60px;
  }
}

body .header .search .search-bar form {
  width: 100%;
}

body .header .search .search-bar form .form-group {
  height: 45px;
  margin: 0;
  position: relative;
}

@media (max-width: 575.98px) {
  body .header .search .search-bar form .form-group {
    height: 40px;
  }
}

body .header .search .search-bar form .form-group input {
  direction: rtl;
  text-align: right;
  height: 100%;
  border: none;
  background-color: var(--body-bg);
  color: var(--p-color);
  width: 100%;
  border-radius: 12px;
  font-size: 0.9rem;
  font-weight: 700;
  padding-right: 60px;
  padding-top: 0;
}

body .header .search .search-bar form .form-group input::-webkit-input-placeholder {
  color: #adafca;
  font-size: .85rem;
  font-weight: 600;
}

body .header .search .search-bar form .form-group input:-ms-input-placeholder {
  color: #adafca;
  font-size: .85rem;
  font-weight: 600;
}

body .header .search .search-bar form .form-group input::-ms-input-placeholder {
  color: #adafca;
  font-size: .85rem;
  font-weight: 600;
}

body .header .search .search-bar form .form-group input::placeholder {
  color: #adafca;
  font-size: .85rem;
  font-weight: 600;
}

body .header .search .search-bar form .form-group input:focus {
  outline: none;
  -webkit-box-shadow: none;
          box-shadow: none;
}

body .header .search .search-bar form .form-group span svg {
  width: 22px;
  position: absolute;
  top: 50%;
  right: 25px;
  line-height: 50px;
  -webkit-transform: translate(0px, -50%) rotateY(180deg);
          transform: translate(0px, -50%) rotateY(180deg);
  fill: var(--p-color);
}

body .header .search .search-bar form button {
  visibility: hidden;
  display: none;
}

body .header .action-list {
  position: relative;
  padding: 0 0;
}

@media (max-width: 575.98px) {
  body .header .action-list {
    padding: 0 0;
  }
}

body .header .action-list ul {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  height: 75px;
  margin: 0;
}

@media (max-width: 575.98px) {
  body .header .action-list ul {
    height: 60px;
  }
}

body .header .action-list ul li {
  border-radius: 10px;
  height: 35px;
  width: 35px;
  margin: 0 0px;
}

@media (max-width: 575.98px) {
  body .header .action-list ul li {
    height: 35px;
    width: 35px;
    line-height: 32px;
    margin: 0 2px;
  }
}

body .header .action-list ul li .a {
  color: #8b88ff;
  font-size: 24px;
  font-weight: normal;
  text-align: center;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  cursor: pointer;
}

body .header .action-list ul li .a svg {
  fill: var(--p-color);
  width: 20px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

body .header .action-list ul li .a svg:hover {
  fill: var(--main-color);
}

body .header .action-list ul li .a .noti svg {
  position: relative;
  fill: var(--navbar-color) !important;
}

body .header .action-list ul li .a .noti svg:hover {
  stroke: none;
}

body .header .action-list ul li .a:hover {
  color: var(--navbar-color);
}

body .header .user-action {
  height: 50px;
  width: 185px;
  border-radius: 12px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 0 10px;
  cursor: pointer;
  margin-right: 10px;
  background-color: var(--body-bg);
  border: 1px solid var(--border-color);
}

@media (max-width: 767.98px) {
  body .header .user-action {
    width: auto;
    display: none;
  }
}

body .header .user-action .user-icon figure {
  height: 35px;
  width: 35px;
  border-radius: 12px;
  margin: 0;
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;
}

@media (max-width: 767.98px) {
  body .header .user-action .user-icon figure {
    height: 30px;
    width: 30px;
  }
}

body .header .user-action .user-action-info {
  margin-right: 12px;
}

@media (max-width: 767.98px) {
  body .header .user-action .user-action-info {
    display: none;
  }
}

body .header .user-action .user-action-info h3 {
  font-size: .7rem;
  font-weight: 700;
  margin-bottom: 1px;
  display: block;
  margin-top: 3px;
  color: var(--p-color);
}

body .header .user-action .user-action-info span {
  font-weight: 500;
  font-size: 0.75rem;
  display: block;
}

body .header .user-action .user-action-info .active-account {
  color: #adafca;
  font-size: 0.75rem;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  font-family: "font-en";
  font-weight: 500;
  letter-spacing: 0.2px;
}

body .header .user-action .user-action-info .active-account .exp-text {
  margin-right: 0;
  font-family: "cairo";
}

@media (max-width: 767.98px) {
  body .header .user-action .toggle-account-icon {
    display: none;
  }
}

body .header .user-action .toggle-account-icon svg {
  height: 16px;
  width: 16px;
  fill: var(--p-color);
}

body .notification-container {
  background: var(--navbar-bg);
  position: fixed;
  height: 100%;
  z-index: 15;
  top: 0;
  left: 0;
  opacity: 0;
  visibility: hidden;
  -webkit-transform: translate(-400px, 0);
          transform: translate(-400px, 0);
  -webkit-transition: opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  transition: opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  transition: transform 0.4s ease-in-out 0s, opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s;
  transition: transform 0.4s ease-in-out 0s, opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  width: 380px;
  padding-bottom: 80px;
  border-radius: 0;
  -webkit-box-shadow: 3px 5px 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 3px 5px 40px 0 rgba(94, 92, 154, 0.06);
}

@media (max-width: 991.98px) {
  body .notification-container {
    left: 0;
  }
}

@media (max-width: 575.98px) {
  body .notification-container {
    width: 100%;
  }
}

body .notification-container .dropdown-box-header-title {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 25px 28px 15px 25px;
}

body .notification-container .dropdown-box-header-title span {
  font-size: 1rem;
  font-weight: 700;
  color: var(--p-color);
}

body .notification-container .dropdown-box-header-title .close-notification svg {
  fill: var(--p-color);
  width: 24px;
  cursor: pointer;
}

body .notification-container .notification-content {
  padding: 0 10px 10px 10px;
  overflow: auto;
  height: calc(100% - 60px);
}

@media (max-width: 575.98px) {
  body .notification-container .notification-content {
    padding-bottom: 0;
  }
}

body .notification-container .notification-content a {
  display: block;
  padding: 12px 12px 12px 20px;
  text-decoration: none;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  border-radius: 12px;
  margin: 10px 0;
  background: var(--navbar-bg);
}

body .notification-container .notification-content a .user-status {
  min-height: 44px;
  padding: 5px 55px 0 0px;
  position: relative;
}

body .notification-container .notification-content a .user-status .avatar-small {
  position: absolute;
  top: 0;
  right: 0;
  width: 45px;
  margin-top: 3px;
}

body .notification-container .notification-content a .user-status .avatar-small .person-img {
  z-index: 1;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -ms-flex-negative: 0;
      flex-shrink: 0;
  width: 40px;
  height: 40px;
  line-height: 40px;
  border-radius: 50%;
  background: #3e3f5e;
  margin-right: 0;
}

body .notification-container .notification-content a .user-status .avatar-small .person-img svg {
  width: 20px;
  height: 20px;
  fill: #FFF;
}

body .notification-container .notification-content a .user-status .avatar-small .person-img svg g [fill] {
  fill: #FFF;
}

body .notification-container .notification-content a .user-status .user-status-title {
  color: var(--p-color);
  font-size: .8rem;
  font-weight: 500;
  line-height: 1.4285714286em;
}

body .notification-container .notification-content a .user-status .user-status-title span {
  color: var(--p-color);
  font-weight: 700;
}

body .notification-container .notification-content a .user-status .user-status-text {
  margin-top: 4px;
  color: var(--p-color);
  font-size: .8rem;
  font-weight: 500;
  margin: 0;
}

body .notification-container .notification-content a .user-status .user-status-timestamp {
  margin-top: 0;
  position: absolute;
  top: 7px;
  left: 0;
  color: #8f91ac;
  font-size: .75rem;
  font-weight: 500;
}

body .notification-container .notification-content a:hover {
  background: var(--body-bg);
}

body .notification-container .notification-content .noti-read {
  background: var(--body-bg);
}

body .notification-container .notification-content .noti-read:hover {
  background: var(--body-bg);
}

body .notification-container .notification-content::-webkit-scrollbar {
  display: none;
}

body .notification-container .all-notification {
  position: absolute;
  bottom: 12px;
  left: 50%;
  -webkit-transform: translate(-50%, 0);
          transform: translate(-50%, 0);
  z-index: 5;
  width: 250px;
  margin: auto;
  height: 45px;
  border-radius: 10px;
  background: var(--body-bg);
  font-size: .7rem;
  font-weight: 700;
  text-align: center;
  line-height: 45px;
  -webkit-transition: background-color .2s ease-in-out;
  transition: background-color .2s ease-in-out;
  border: 1px solid var(--border-color);
}

body .notification-container .all-notification:hover {
  background: var(--main-color);
}

body .notification-container .all-notification:hover a {
  color: #FFF;
}

body .notification-container .all-notification:hover svg {
  fill: #FFF;
}

body .notification-container .all-notification svg {
  height: 16px;
  fill: var(--p-color);
  margin-left: 7px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  margin-top: -2px;
}

body .notification-container .all-notification a {
  text-decoration: none;
  color: var(--p-color);
  display: block;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

body .messages-container {
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 380px;
  background: var(--navbar-bg);
  -webkit-box-shadow: 0 10px 30px 0 rgba(82, 63, 105, 0.05);
          box-shadow: 0 10px 30px 0 rgba(82, 63, 105, 0.05);
  padding: 15px 15px;
  z-index: 105;
  -webkit-transition: opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  transition: opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  transition: transform 0.4s ease-in-out 0s, opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s;
  transition: transform 0.4s ease-in-out 0s, opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  opacity: 0;
  visibility: hidden;
  -webkit-transform: translate(-400px, 0);
          transform: translate(-400px, 0);
}

body .messages-container .messages-header {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  padding: 10px 10px 5px 10px;
}

body .messages-container .messages-header .menu-title {
  margin: 0;
  font-size: 1rem;
  font-weight: 700;
  color: var(--p-color);
}

body .messages-container .messages-header .close-messages svg {
  fill: var(--p-color);
  width: 24px;
  cursor: pointer;
}

body .messages-container .messages-contacts {
  margin-top: 10px;
  overflow: auto;
  height: calc(100vh - 140px);
}

body .messages-container .messages-contacts::-webkit-scrollbar {
  display: none;
}

body .messages-container .messages-contacts .contact-line {
  position: relative;
}

body .messages-container .messages-contacts .contact-line:hover .more-option-icon {
  display: -webkit-box !important;
  display: -ms-flexbox !important;
  display: flex !important;
}

body .messages-container .messages-contacts .contact-line .contact {
  text-decoration: none;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  border-radius: 12px;
  position: relative;
  cursor: pointer;
  padding: 12px 12px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  margin: 10px 0;
}

body .messages-container .messages-contacts .contact-line .contact:hover {
  background: var(--body-bg);
}

body .messages-container .messages-contacts .contact-line .contact .contact-item {
  text-align: right;
  display: -ms-inline-grid;
  display: inline-grid;
}

body .messages-container .messages-contacts .contact-line .contact .contact-item img {
  height: 45px;
  width: 45px;
  border-radius: 12px;
  margin-left: 15px;
}

body .messages-container .messages-contacts .contact-line .contact .contact-item h4 {
  margin: 0;
  margin-top: -4px;
  font-weight: 700;
  letter-spacing: 0;
  font-size: 0.8rem;
  color: var(--p-color);
}

body .messages-container .messages-contacts .contact-line .contact .contact-item p {
  margin: 0;
  color: var(--p-color);
  font-size: 0.7rem;
  margin-top: 0px;
  font-weight: 500;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  max-width: 235px;
}

body .messages-container .messages-contacts .contact-line .contact .pa {
  position: absolute;
  top: 15px;
  left: 10px;
  direction: ltr;
}

body .messages-container .messages-contacts .contact-line .contact .pa span {
  font-size: 0.67rem;
  color: #9aa4bf;
}

body .messages-container .messages-contacts .contact-line .contact .img-assign {
  border-radius: 50%;
  height: 22px;
  width: 22px;
  border: 2px solid #FFF;
  position: absolute;
  top: 43px;
  right: 43px;
  z-index: 5;
  display: none;
}

body .messages-container .messages-contacts .unanswered-chats .contact {
  background: var(--body-bg);
}

body .messages-container .messages-contacts .unanswered-chats .contact .contact-item h4 {
  color: var(--main-color);
}

body .messages-container .messages-contacts .unanswered-chats .contact .contact-item p {
  font-weight: 700;
  color: var(--p-color);
}

body .messages-container .messages-contacts .unanswered-chats .contact .pa span {
  color: var(--main-color);
}

body .user-container {
  background: var(--navbar-bg);
  position: fixed;
  padding: 55px 55px;
  width: 750px;
  z-index: 15;
  top: 50%;
  left: 50%;
  transition: transform 0.4s ease-in-out 0s, opacity 0.4s ease-in-out 0s, visibility 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  border-radius: 16px;
  -webkit-box-shadow: 3px 5px 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 3px 5px 40px 0 rgba(94, 92, 154, 0.06);
  -webkit-transform: translate(-50%, -50%) scale(0.5);
          transform: translate(-50%, -50%) scale(0.5);
  opacity: 0;
  display: none;
}

@media (max-width: 991.98px) {
  body .user-container {
    width: 700px;
    height: 450px;
  }
}

@media (max-width: 767.98px) {
  body .user-container {
    width: 100%;
    height: 100%;
    border-radius: 0;
  }
}

@media (max-width: 575.98px) {
  body .user-container {
    width: 100%;
  }
}

body .user-container a {
  text-decoration: none;
}

body .user-container .dropdown-box-header-title {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 0 0 0 0;
  position: absolute;
  top: 22px;
  left: 27px;
  cursor: pointer;
}

body .user-container .dropdown-box-header-title span {
  font-size: 0.7rem;
  font-weight: 700;
  color: var(--p-color);
  margin-right: 5px;
}

body .user-container .dropdown-box-header-title .close-user svg {
  fill: var(--p-color);
  width: 16px;
  cursor: pointer;
}

body .user-container .user-container-content {
  margin-bottom: 0;
  text-align: center;
}

body .user-container .user-container-content .user-container-content-header {
  margin-bottom: 45px;
}

body .user-container .user-container-content .user-container-content-header h3 {
  color: var(--p-color);
  font-size: 1.6rem;
  font-weight: 600;
  margin: 0 0 2px 0;
}

body .user-container .user-container-content .user-container-content-header span {
  color: #adafca;
  font-size: 0.9rem;
  font-weight: 500;
}

body .user-container .user-container-content .user-container-content-toggle .user-container-content-toggle-card {
  margin: auto;
  background: var(--body-bg);
  padding: 35px 10px;
  border-radius: 16px;
  border: 1px solid var(--border-color);
}

@media (max-width: 575.98px) {
  body .user-container .user-container-content .user-container-content-toggle .user-container-content-toggle-card {
    margin-bottom: 15px;
  }
}

body .user-container .user-container-content .user-container-content-toggle .user-container-content-toggle-card .user-image-parent {
  height: 110px;
  width: 110px;
  margin: 0 auto 15px auto;
  background-color: var(--navbar-bg);
  border: 2px solid var(--border-color);
  border-radius: 50%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
}

body .user-container .user-container-content .user-container-content-toggle .user-container-content-toggle-card .user-image-parent figure {
  height: 100px;
  width: 100px;
  border-radius: 50%;
  margin: 0;
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
}

body .user-container .user-container-content .user-container-content-toggle .user-container-content-toggle-card .user-info-parent h3 {
  color: var(--p-color);
  font-size: 1.1rem;
  font-weight: 600;
  margin: 0 0 2px 0;
}

body .user-container .user-container-content .user-container-content-toggle .user-container-content-toggle-card .user-info-parent span {
  color: #adafca;
  font-size: 0.85rem;
  font-weight: 500;
}

body .noti-open {
  -webkit-transform: translate(0, 0);
          transform: translate(0, 0);
  visibility: visible;
  opacity: 1;
}

body .message-button {
  position: absolute;
  bottom: 15px;
  left: 50%;
  -webkit-transform: translate(-50%, 0);
          transform: translate(-50%, 0);
  z-index: 5;
  width: 340px;
  margin: auto;
  height: 50px;
  border-radius: 10px;
  background-color: #3e3f5e;
  font-size: .8rem;
  font-weight: 700;
  text-align: center;
  line-height: 50px;
  -webkit-transition: background-color .2s ease-in-out;
  transition: background-color .2s ease-in-out;
}

@media (max-width: 575.98px) {
  body .message-button {
    background: #51459e;
  }
}

body .message-button:hover {
  background: var(--main-color);
}

@media (max-width: 575.98px) {
  body .message-button:hover {
    background: var(--main-color);
  }
}

body .message-button a {
  text-decoration: none;
  color: var(--navbar-color);
  display: block;
}

body .load-more-line {
  padding: 9px 0 10px 0;
  margin: 7px 0;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  cursor: pointer;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

body .load-more-line:hover svg {
  -webkit-transform: rotate(180deg) scale(1.1);
          transform: rotate(180deg) scale(1.1);
}

body .load-more-line svg {
  height: 15px;
  width: 15px;
  margin-left: 10px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

body .load-more-line svg [fill]:not(.permanent):not(g) {
  fill: var(--main-color);
}

body .load-more-line span {
  color: #7e8299;
  font-size: 0.75rem;
  font-weight: 600;
  text-align: center;
}

body .open-dropdown {
  opacity: 1 !important;
  visibility: visible !important;
  -webkit-transform: translate(0, 0) !important;
          transform: translate(0, 0) !important;
}

body .more-option-icon-active {
  display: -webkit-box !important;
  display: -ms-flexbox !important;
  display: flex !important;
}

body .more-option-icon-active svg [fill]:not(.permanent):not(g) {
  fill: #9aa4bf;
}

body .big-nav {
  width: 280px;
  padding-top: 0;
  padding-bottom: 40px;
  position: fixed;
  top: 0;
  z-index: 15;
  -webkit-box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
          box-shadow: 0 0 40px 0 rgba(94, 92, 154, 0.06);
  background: var(--navbar-bg);
  height: 100%;
  -webkit-transition: all .4s ease-in-out;
  transition: all .4s ease-in-out;
  -webkit-transition-delay: .1s;
          transition-delay: .1s;
  overflow: hidden;
}

@media (max-width: 575.98px) {
  body .big-nav {
    width: 100%;
    height: 100%;
  }
}

body .big-nav .big-nav-header-title {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  padding: 0 0 0 0;
  position: absolute;
  top: 15px;
  left: 20px;
  cursor: pointer;
}

body .big-nav .big-nav-header-title span {
  font-size: 0.7rem;
  font-weight: 700;
  color: var(--p-color);
  margin-right: 5px;
}

body .big-nav .big-nav-header-title .close-big-nav svg {
  fill: var(--p-color);
  width: 16px;
  cursor: pointer;
}

body .big-nav .user-info h5 {
  color: var(--p-color);
  font-weight: bold;
  margin: 0 0 4px 0;
  font-size: 1.125rem;
}

body .big-nav .user-info p {
  color: #adafca;
  font-weight: 700;
  font-size: .6875rem;
}

body .big-nav .toggle-account-big {
  width: 80%;
  margin: auto;
  padding: 10px 0px;
  margin-top: 5px;
  border-bottom: 1px solid var(--border-color);
  cursor: pointer;
}

body .big-nav .toggle-account-big .toggle-account-big-container .teacher-icon-parent {
  background-color: var(--navbar-bg);
  border: 2px solid var(--border-color);
  padding: 0;
  border-radius: 50%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  width: 87px;
  height: 87px;
  margin-bottom: 7px;
  margin-right: -5px;
}

body .big-nav .toggle-account-big .toggle-account-big-container figure {
  height: 75px;
  width: 75px;
  border-radius: 50%;
  margin: 0 0 0 0;
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
}

body .big-nav .toggle-account-big .toggle-account-big-container .toggle-account-big-info span {
  font-size: 0.95rem;
  font-weight: 500;
  color: #adafca;
}

body .big-nav .toggle-account-big .toggle-account-big-container .toggle-account-big-info .teacher-toggle {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: justify;
      -ms-flex-pack: justify;
          justify-content: space-between;
  cursor: pointer;
}

body .big-nav .toggle-account-big .toggle-account-big-container .toggle-account-big-info .teacher-toggle h3 {
  font-size: 1.15rem;
  color: var(--p-color);
  font-weight: 700;
}

body .big-nav .toggle-account-big .toggle-account-big-container .toggle-account-big-info .teacher-toggle svg {
  height: 16px;
  fill: var(--p-color);
  margin-bottom: 7px;
}

body .big-nav .search {
  width: 230px;
  height: 45px;
  margin: 10px auto 0 auto;
}

@media (max-width: 575.98px) {
  body .big-nav .search {
    width: 85%;
  }
}

body .big-nav .search .search-bar {
  height: 75px;
  margin: 0 0;
  width: 100%;
}

@media (max-width: 575.98px) {
  body .big-nav .search .search-bar {
    width: 100%;
    height: 60px;
  }
}

body .big-nav .search .search-bar form {
  width: 100%;
}

body .big-nav .search .search-bar form .form-group {
  height: 40px;
  margin: 0;
  position: relative;
}

@media (max-width: 575.98px) {
  body .big-nav .search .search-bar form .form-group {
    height: 40px;
  }
}

body .big-nav .search .search-bar form .form-group input {
  direction: rtl;
  text-align: right;
  height: 100%;
  border: none;
  background-color: var(--body-bg);
  color: var(--p-color);
  width: 100%;
  border-radius: 12px;
  font-size: 0.9rem;
  font-weight: 700;
  padding-right: 35px;
  padding-top: 0;
  border: 1px solid var(--border-color);
}

body .big-nav .search .search-bar form .form-group input::-webkit-input-placeholder {
  color: #adafca;
  font-size: .7rem;
  font-weight: 600;
}

body .big-nav .search .search-bar form .form-group input:-ms-input-placeholder {
  color: #adafca;
  font-size: .7rem;
  font-weight: 600;
}

body .big-nav .search .search-bar form .form-group input::-ms-input-placeholder {
  color: #adafca;
  font-size: .7rem;
  font-weight: 600;
}

body .big-nav .search .search-bar form .form-group input::placeholder {
  color: #adafca;
  font-size: .7rem;
  font-weight: 600;
}

body .big-nav .search .search-bar form .form-group input:focus {
  outline: none;
  -webkit-box-shadow: none;
          box-shadow: none;
}

body .big-nav .search .search-bar form .form-group span svg {
  width: 16px;
  position: absolute;
  top: 53%;
  right: 12px;
  line-height: 50px;
  -webkit-transform: translate(0px, -50%) rotateY(180deg);
          transform: translate(0px, -50%) rotateY(180deg);
  fill: var(--p-color);
}

body .big-nav .search .search-bar form button {
  visibility: hidden;
  display: none;
}

body .big-nav .nav-links {
  width: 100%;
  height: 100%;
  overflow: auto;
  height: calc(100% - 270px);
}

body .big-nav .nav-links ul {
  margin-top: 6px;
}

body .big-nav .nav-links ul .ul-head {
  padding-right: 30px;
  color: #adafca;
  font-size: .75rem;
  font-weight: 700;
}

body .big-nav .nav-links ul li {
  text-decoration: none;
  color: #8b88ff;
  width: 90%;
  display: block;
  height: 45px;
  border-radius: 12px;
  font-size: .875rem;
  font-weight: 700;
  line-height: 48px;
  position: relative;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  margin: 5px auto;
  padding-right: 20px;
}

body .big-nav .nav-links ul li:hover {
  background-color: var(--navbar-color);
  color: #51459e;
}

body .big-nav .nav-links ul li:hover a {
  color: var(--link-color);
}

body .big-nav .nav-links ul li:hover a svg {
  fill: var(--link-color);
}

body .big-nav .nav-links ul li:hover a .svg-icon {
  height: 22px;
  width: 22px;
  stroke-width: 0.8px;
}

body .big-nav .nav-links ul li:hover a .svg-icon path {
  fill: var(--link-color);
  stroke: var(--link-color);
}

body .big-nav .nav-links ul li:hover a .link-info {
  visibility: visible;
  padding-right: 8px;
}

body .big-nav .nav-links ul li:hover a .link-info span {
  color: var(--link-color);
}

body .big-nav .nav-links ul li a {
  height: 50px;
  width: 100%;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  text-decoration: none;
  display: block;
}

body .big-nav .nav-links ul li a svg {
  height: 25px;
  width: 25px;
  height: 22px;
  width: 22px;
  fill: #808196;
}

body .big-nav .nav-links ul li a svg g [fill] {
  fill: #2c2f32;
}

body .big-nav .nav-links ul li a .svg-icon {
  height: 22px;
  width: 22px;
  stroke-width: 0.8px;
}

body .big-nav .nav-links ul li a .svg-icon path {
  fill: #adafca;
  stroke: #adafca;
}

body .big-nav .nav-links ul li a .link-info {
  white-space: nowrap;
  border-radius: 50px;
  margin: 0;
  -webkit-transition: all 0.3s ease-in-out 0s;
  transition: all 0.3s ease-in-out 0s;
  display: -webkit-inline-box;
  display: -ms-inline-flexbox;
  display: inline-flex;
}

body .big-nav .nav-links ul li a .link-info span {
  padding: 0 13px;
  color: var(--p-color);
  font-size: .8rem;
  line-height: 25px;
  font-weight: bold;
  -webkit-transition: all 0.3s ease-in-out 0s;
  transition: all 0.3s ease-in-out 0s;
}

body .big-nav .nav-links ul .li-active {
  color: var(--p-color);
}

body .big-nav .nav-links ul .li-active a svg {
  fill: var(--link-color);
}

body .big-nav .nav-links ul .li-active a svg g [fill] {
  fill: var(--link-color);
}

body .big-nav .nav-links ul .li-active a .svg-icon path {
  fill: var(--link-color);
  stroke: var(--link-color);
}

body .big-nav .nav-links ul .li-active a .link-info {
  visibility: visible;
  padding-right: 8px;
}

body .big-nav .nav-links ul .li-active a .link-info span {
  color: var(--link-color) !important;
}

body .big-nav .nav-links ul .li-active a .link-info span:hover {
  color: var(--link-color);
}

body .big-nav .nav-links ul .li-active:hover {
  background: var(--body-bg);
  color: var(--link-color);
}

body .big-nav .nav-links .other-links li {
  padding-right: 2px;
}

body .big-nav .nav-links .other-links li:hover {
  color: var(--link-color);
  background: none;
  -webkit-box-shadow: none;
          box-shadow: none;
}

body .big-nav::-webkit-scrollbar {
  display: none;
}

body .big-nav .all-notification {
  position: absolute;
  bottom: 12px;
  left: 50%;
  -webkit-transform: translate(-50%, 0);
          transform: translate(-50%, 0);
  z-index: 5;
  width: 250px;
  margin: auto;
  height: 45px;
  border-radius: 10px;
  background: var(--body-bg);
  font-size: .7rem;
  font-weight: 700;
  text-align: center;
  line-height: 45px;
  -webkit-transition: background-color .2s ease-in-out;
  transition: background-color .2s ease-in-out;
}

body .big-nav .all-notification:hover {
  background: #ee4266;
}

body .big-nav .all-notification:hover a {
  color: #FFF;
}

body .big-nav .all-notification:hover svg {
  fill: #FFF;
}

body .big-nav .all-notification svg {
  height: 16px;
  fill: var(--p-color);
  margin-left: 7px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  margin-top: -2px;
}

body .big-nav .all-notification a {
  text-decoration: none;
  color: var(--p-color);
  display: block;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

body .nav-hiddin {
  -webkit-transform: translate(80px, 0);
          transform: translate(80px, 0);
}

body .big-nav-hiddin {
  -webkit-transform: translate(580px, 0);
          transform: translate(580px, 0);
}

body::-webkit-scrollbar {
  display: none;
}

body .close-overlay {
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: rgba(22, 22, 34, 0.6);
  z-index: 10;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
  opacity: 0;
  visibility: hidden;
}

body .open-over {
  opacity: 1;
  visibility: visible;
}

body .open-user-container {
  -webkit-transform: translate(-50%, -50%) scale(1);
          transform: translate(-50%, -50%) scale(1);
  opacity: 1;
  display: block;
}

body .content {
  min-height: calc(100vh - 75px);
  width: calc(100%);
  position: relative;
  margin: 0 auto 0 auto;
  -webkit-transform: translate(0, 75px);
          transform: translate(0, 75px);
  -webkit-transition: -webkit-transform 0.4s ease-in-out 0s;
  transition: -webkit-transform 0.4s ease-in-out 0s;
  transition: transform 0.4s ease-in-out 0s;
  transition: transform 0.4s ease-in-out 0s, -webkit-transform 0.4s ease-in-out 0s;
  padding-top: 20px;
  padding-bottom: 30px;
  text-align: center;
  background-color: var(--body-bg);
}

@media (max-width: 575.98px) {
  body .content {
    width: 100%;
    -webkit-transform: translate(0, 60px);
            transform: translate(0, 60px);
  }
}

@media (max-width: 767.98px) {
  body .content {
    min-height: calc(100vh - 60px);
  }
}

.progress-pie-chart {
  width: 135px;
  height: 135px;
  border-radius: 50%;
  background-color: var(--body-bg);
  position: relative;
}

.progress-pie-chart.gt-50 {
  background-color: var(--main-color);
}

.ppc-progress {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 67.5px);
  top: calc(50% - 67.5px);
  width: 135px;
  height: 135px;
  clip: rect(0, 135px, 135px, 67.5px);
}

.ppc-progress .ppc-progress-fill {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 67.5px);
  top: calc(50% - 67.5px);
  width: 135px;
  height: 135px;
  clip: rect(0, 67.5px, 135px, 0);
  background: var(--main-color);
  -webkit-transform: rotate(60deg);
          transform: rotate(60deg);
}

.gt-50 .ppc-progress {
  clip: rect(0, 67.5px, 135px, 0);
}

.gt-50 .ppc-progress .ppc-progress-fill {
  clip: rect(0, 135px, 135px, 67.5px);
  background: var(--body-bg);
}

.ppc-percents {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 121.62162px/2);
  top: calc(50% - 121.62162px/2);
  width: 121.62162px;
  height: 121.62162px;
  text-align: center;
  display: table;
  border: 5px solid var(--navbar-bg);
}

.ppc-percents span {
  display: block;
  font-size: 2.6em;
  font-weight: bold;
  color: var(--main-color);
}

.pcc-percents-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.progress-pie-chart {
  margin: 0 auto 0;
}

* {
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

body {
  background-color: #f5f8fa;
  height: 100%;
  position: relative;
  direction: rtl;
  text-align: right;
  overflow-x: hidden;
}

.row {
  overflow: hidden;
}

.container-fluid {
  padding-right: 50px;
  padding-left: 50px;
}

.content {
  color: #000;
}

.row-inside-row {
  margin-right: -8px;
  margin-left: -8px;
}

.col-lg-1,
.col-lg-2,
.col-lg-3,
.col-lg-4,
.col-lg-5,
.col-lg-6,
.col-lg-7,
.col-lg-8,
.col-lg-9,
.col-lg-10,
.col-lg-11,
.col-lg-12,
.col-md-6,
.col-md-3,
.col-md-4,
.col-md-8,
.col-md-9 {
  padding-right: 8px;
  padding-left: 8px;
}

.banner {
  min-height: 130px;
  padding: 35px 0px 0 50px;
  border-radius: 12px;
  position: relative;
  -webkit-transform: rotatey(180deg);
          transform: rotatey(180deg);
  margin-bottom: 15px;
  background-repeat: no-repeat;
  background-position: 60% 0%;
}

@media (max-width: 1199.98px) {
  .banner {
    height: 86px;
    min-height: auto;
    padding: 20px 28px 0 35px;
  }
}

@media (max-width: 767.98px) {
  .banner {
    text-align: center;
  }
}

.banner .banner-content {
  text-align: right;
}

.banner .banner-content .section-banner-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #fff;
  margin: 0;
  -webkit-transform: rotatey(180deg);
          transform: rotatey(180deg);
}

@media (max-width: 1199.98px) {
  .banner .banner-content .section-banner-title {
    font-size: 1.2rem;
  }
}

@media (max-width: 767.98px) {
  .banner .banner-content .section-banner-title {
    text-align: center;
  }
}

.banner .banner-content .section-banner-text {
  margin-top: 10px;
  font-size: 0.75rem;
  font-weight: 500;
  color: #fff;
  margin: 0;
  -webkit-transform: rotatey(180deg);
          transform: rotatey(180deg);
}

@media (max-width: 1199.98px) {
  .banner .banner-content .section-banner-text {
    margin-top: 0px;
    font-size: .75rem;
  }
}

@media (max-width: 767.98px) {
  .banner .banner-content .section-banner-text {
    text-align: center;
  }
}

.list-unstyled {
  padding: 0;
}

.dark .light-theme {
  display: block;
}

.dark .dark-theme {
  display: none;
}

.dark-mode {
  overflow: hidden;
}

.light-theme {
  display: none;
}
/*# sourceMappingURL=main.css.map */
    </style>
</head>
<body>
    <div class="register" style="background-image: url(https://images.unsplash.com/photo-1661090790202-2f9173c66362?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80)">
        <div class="register-overlay"></div>

        <div class="row align-items-center">

            <div class="col-xl-6 col-lg-6 order-1 order-lg-2">
                <div class="register-content">
                    <span class="wow bounceIn"></span>
                    <h1><a href="{{ route("home") }}">فى أى مكان ... تعليمك مرن</a></h1>
                    <p>
                        حدث خطا ما
                    </p>
                    <div class="register-links">
                        <a href="{{ route("home") }}" class="register-home">العودة للرئيسية</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // setTimeout(() => {
        //     location.href="{{ route("home") }}"
        // }, 1000);
    </script>
</body>
</html>
