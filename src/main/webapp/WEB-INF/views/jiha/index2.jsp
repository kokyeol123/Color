<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Cropper.js</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" crossorigin="anonymous">
  <link rel="stylesheet" href="resources/css/cropper.css">
  <style>
    .label {
      cursor: pointer;
    }

    .progress {
      display: none;
      margin-bottom: 1rem;
    }

    .alert {
      display: none;
    }

    .img-container img {
      max-width: 100%;
    }
  </style>
</head>
<body>
  <div class="container">
    
    
    <label class="label" data-toggle="tooltip" title="사진을 업로드 해주세요">
      <img class="rounded" id="avatar" src="https://avatars0.githubusercontent.com/u/3456749?s=160" alt="avatar">
      <input type="file" class="sr-only" id="input" name="upload" accept="image/*" >
    </label>
   <input type="button" id="detect" class="detect" value="나의 피부색 찾기">
    <div class="progress">
      <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
    </div>
    <div class="alert" role="alert"></div>
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalLabel">이미지 자르기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="img-container">
              <img id="image" src="https://avatars0.githubusercontent.com/u/3456749">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" id="crop">Crop</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="resources/js/cropper.js"></script>
  <script type="text/javascript">
  $(function(){
	  //처음에 색찾기 버튼 숨기기
	  $("#detect").hide();
	  //버튼 누르면 색 분석 고
	  $("#detect").click(function(){
		  //세이브드 파일네임으로 경로 들어가면 될듯
		  location.href="colorFind?filePath=/Users/yoonjiha/Desktop/uploadPath/username_9b0ec088-a33b-4d3f-9d49-87cfb69c3f9e.png"
	  })
  })
  </script>
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      var avatar = document.getElementById('avatar');
      var image = document.getElementById('image');
      var input = document.getElementById('input');
      var $progress = $('.progress');
      var $progressBar = $('.progress-bar');
      var $alert = $('.alert');
      var $modal = $('#modal');
      var cropper;

      $('[data-toggle="tooltip"]').tooltip();

      input.addEventListener('change', function (e) {
        var files = e.target.files;
        var done = function (url) {
          input.value = '';
          image.src = url;
          $alert.hide();
          $modal.modal('show');
        };
        var reader;
        var file;
        var url;

        if (files && files.length > 0) {
          file = files[0];

          if (URL) {
            done(URL.createObjectURL(file));
          } else if (FileReader) {
            reader = new FileReader();
            reader.onload = function (e) {
              done(reader.result);
            };
            reader.readAsDataURL(file);
          }
        }
      });

      $modal.on('shown.bs.modal', function () {
        cropper = new Cropper(image, {
          aspectRatio: 1,
          viewMode: 3,
        });
      }).on('hidden.bs.modal', function () {
        cropper.destroy();
        cropper = null;
      });

      document.getElementById('crop').addEventListener('click', function () {
        var initialAvatarURL;
        var canvas;

        $modal.modal('hide');

        if (cropper) {
          canvas = cropper.getCroppedCanvas({
            width: 160,
            height: 160,
          });
          initialAvatarURL = avatar.src;
          avatar.src = canvas.toDataURL();
          //alert(avatar.src);
          $progress.show();
          $alert.removeClass('alert-success alert-warning');
          var blobBin = atob((avatar.src).split(',')[1]);//base64 데이터 디코딩
          var array = [];
          for (var i = 0; i < blobBin.length; i++) {
              array.push(blobBin.charCodeAt(i));
          }
          var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
          var formdata = new FormData();	// formData 생성
          formdata.append("upload", file,"username.png");	// file data 추가 // 로그인 한 사람 아이디 명 .png 로 이름 정해요
            
            $.ajax( {
            url: 'upload',
              method: 'POST',
              enctype: 'multipart/form-data',
              data: formdata,
              processData: false,
              contentType: false,
              success: function () {
                $alert.show().addClass('alert-success').text('Upload success');
                //업로드 성공했으니 버튼 보이기
                $("#detect").show();
              },
              error: function () {
                avatar.src = initialAvatarURL;
                $alert.show().addClass('alert-warning').text('Upload error');
              },
              complete: function () {
                $progress.hide();
              },
            });
        }
      });
   });
  </script>
</body>
</html>
