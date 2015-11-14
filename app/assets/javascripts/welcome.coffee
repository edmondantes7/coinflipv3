// Place all the styles related to the welcome controller here.
// They will automatically be included in application.css.
// You can use Sass (SCSS) here: http://sass-lang.com/

#welcome-container {
  height: 100%;
  width: 100%;
  padding: 0;
  margin: 0;
}

#welcome-container #mountains  {
  z-index: -999;
  min-height: 100%;
  min-width: 1024px;
  width: 100%;
  height: auto;
  position: fixed;
  top: 0;
  left: 0;
}

#welcome-text-container {
  position: relative;
  width: 50%;
  min-height: 400px;
  margin: 100px auto;
  color: rgb(41,41,41);
  border: 1px solid white;
  padding: 25px;
  margin: 25px;
  background-color: rgba(241,241,241,0.7);
  border-radius: 10px;
  left: 25%;
  top: 100px;
}

.form-labels {
	color: rgb(41,41,41);
	width: 150px;
}

.q-labels {
	color: rgb(41,41,41);
	width: 400px;
	height: 30px;
	vertical-align: top;
	font-weight: normal;
}

.q-radio {
	position: relative;
	top: -30px;
	left: 400px;
}


.form-fields {
	color: rgb(41,41,41);
	background-color: rgb(230,230,230);
  	border: 1px solid rgb(41,41,41);
  	border-radius: 3px;
	width: 300px;
}
