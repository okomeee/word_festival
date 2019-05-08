// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require_tree .
var Dot = function () {
  this.size = Math.floor( Math.random() * 6 ) + baseSize; //大きさ
  this.color = colors[~~(Math.random() * 3)]; //色
  this.speed = this.size / baseSpeed; // 大きさによって速度変更

  this.pos = {   // 位置
      x: canvas.width / 2,
      y: canvas.height / 2
  };

  var rot = Math.random() * 360;  // ランダムな角度
  var angle = rot * Math.PI / 180;

  this.vec = {    // 移動方向
      x: Math.cos(angle) * this.speed,
      y: Math.sin(angle) * this.speed
  };

  // ランダムに配置
  var startRandom = Math.random();
  this.pos.x += this.vec.x * (startRandom * center.x);
  this.pos.y += this.vec.y * (startRandom * center.y);
};

Dot.prototype = {
  update: function() {
      this.pos.x += this.vec.x;
      this.pos.y += this.vec.y;

      if(this.pos.x > canvas.width + baseSize
              || this.pos.x < 0 - baseSize
              || this.pos.y > canvas.height + baseSize
              || this.pos.y < 0 - baseSize) {
          this.pos.x = center.x;
          this.pos.y = center.y;
      }
  },
  draw: function() {
      ctx.fillStyle = this.color;
      ctx.beginPath();
      ctx.arc(this.pos.x, this.pos.y, this.size, 0, 2 * Math.PI, false);
      ctx.fill();
  }
};