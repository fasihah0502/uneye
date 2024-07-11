@extends('book')
@section('title')
Menu
@endsection
<style>
div.gallery {
  border: 1px solid #ccc;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}

* {
  box-sizing: border-box;
}

.responsive {
  padding: 0 6px;
  float: left;
  width: 24.99999%;
}

@media only screen and (max-width: 700px) {
  .responsive {
    width: 49.99999%;
    margin: 6px 0;
  }
}

@media only screen and (max-width: 500px) {
  .responsive {
    width: 100%;
  }
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}
.button {
  background-color: #ffaa80;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>

<h2>Responsive Image Gallery</h2>

<h4>Resize the browser window to see the effect.</h4>

<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="user">
      <img src="assets/images/langkawi.jpg" alt="Pulau langkawi" width="600" height="400">
    </a>
    <div class="desc">RM 150</div>
  </div>
</div>


<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="user">
      <img src="assets/images/langkawi.jpg" alt="Pulau langkawi" width="600" height="400">
    </a>
    <div class="desc">RM 150</div>
  </div>
</div>

<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="user">
      <img src="assets/images/langkawi.jpg" alt="Pulau langkawi" width="600" height="400">
    </a>
    <div class="desc">RM 150</div>
  </div>
</div>

<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="user">
      <img src="assets/images/langkawi.jpg" alt="Pulau langkawi" width="600" height="400">
    </a>
    <div class="desc">RM 150</div>
  </div>
</div>

<div class="clearfix"></div>
<center>
<a href="user" class="button">BUY NOW</a>
</center>