<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>


<body>
	<input id="modalToggle" class="hide" type="checkbox">
	<section class="modal">
  		<div class="btn btn-open" for="modalToggle">Open modal</div>
  
  	<div class="inside">
    	<div class="btn-close" for="modalToggle">X</div>
    	<p>Text goes here.</p>
  	</div>
	</section>
</body>
<style>
* { box-sizing: border-box }
.hide { display: none }
html {
  position: relative;
  width: 100%;
  height: 100%;
  
  font-family: "Source Sans Pro", sans-serif;
  font-size: 14pt;
  text-align: center;
}
body {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  margin: 0;
}
.container {
  width: 75%;
  margin: 0 auto;
}
.container > p {
  line-height: 1.6;
}

.modal {
  position: fixed;
  display: block;
  width: 100%;
  height: 100%;
  background: transparent;
  overflow: hidden;
  border-radius: .2em;
}

.btn {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  display: inline-block;
  height: 3em;
  width: 10em;
  line-height: 3em;
  border-radius: 1.5em;
  
  font-weight: 700;
  background: #34383c;
  cursor: pointer;
  user-select: none;
  
  animation-duration: 2s;
  animation-fill-mode: forwards;
}

.modal .inside { 
  opacity: 0;
  display: none;
  
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  
  text-align: left;
  padding: 2em;
  
  animation-duration: 2s;
  animation-fill-mode: forwards;
}

.inside p { margin: 0 }

.inside .btn-close {
  position: absolute;
  top: 1em;
  right: 1em;
  
  background: rgba(0,0,0,.5);
  font-size: .8em;
  text-align: center;
  
  height: 3em;
  width: 3em;
  line-height: 3em;
  border-radius: 3em;
  cursor: pointer;
}

#modalToggle:checked ~ .modal .btn-open {
  animation-name: btnExpand;
}
#modalToggle:checked ~ .modal .inside {
  display: block;
  animation-name: delayedFadeIn;
}


@keyframes btnExpand {
  15% {
    color: transparent;
    width: 10em;
  }
  35% {
    width: 3em;
    height: 3em;
    border-radius: 9999px;
    margin: 0;
  }
  to {
    width: 9999px;
    height: 9999px;
    border-radius: 9999px;
    color: transparent;
  }
}

@keyframes delayedFadeIn {
  from: {
    opacity: 0
  }
  55% {
    opacity: 0
  }
  65% {
    opacity: 1
  }
  to {
    opacity: 1
  }
}
</style>
</html>